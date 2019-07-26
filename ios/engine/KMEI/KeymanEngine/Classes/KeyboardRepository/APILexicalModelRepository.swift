//
//  APILexicalModelRepository.swift
//  KeymanEngine
//
//  Created by Randy Boring on 3/19/19.
//  Copyright © 2019 SIL International. All rights reserved.
//

import Foundation
import UIKit // for UIDevice

public enum APILexicalModelFetchError: Error {
  case networkError(Error)
  case noData
  case parsingError(Error)
}

public class APILexicalModelRepository: LexicalModelRepository {
  private let modelsAPIURL = URLComponents(string: "https://api.keyman.com/model")!
  
  public weak var delegate: LexicalModelRepositoryDelegate?
  public private(set) var languages: [String: Language]?
  public private(set) var lexicalModels: [String: LexicalModel]?
  
  public func fetchList(languageID: String, completionHandler: @escaping ListCompletionHandler) {
    var urlComponents = modelsAPIURL
    let bcp47Value = "bcp47:" + languageID
    urlComponents.queryItems = [
      URLQueryItem(name: "q", value: bcp47Value)
    ]
    log.info("Connecting to Keyman cloud: \(urlComponents.url!).")
    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
      self.apiListCompletionHandler(data: data, response: response, error: error,
                                fetchCompletionHandler: completionHandler)
    }
    task.resume()
  }
  
  private func apiListCompletionHandler(data: Data?,
                                    response: URLResponse?,
                                    error: Error?,
                                    fetchCompletionHandler: @escaping ListCompletionHandler) {
    let errorHandler = { (error: Error) -> Void in
      DispatchQueue.main.async {
        self.delegate?.lexicalModelRepository(self, didFailFetch: error)
        fetchCompletionHandler(nil, error)
      }
    }
    
    if let error = error {
      log.error("Network error fetching languages: \(error)")
      errorHandler(APILexicalModelFetchError.networkError(error))
      return
    }
    guard let data = data else {
      log.error("Language API did not return data")
      errorHandler(APILexicalModelFetchError.noData)
      return
    }
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    let result: LexicalModelAPICall
    do {
      result = try decoder.decode(LexicalModelAPICall.self, from: data)
    } catch {
      log.error("Failed parsing API lexical models: \(error)")
      errorHandler(APILexicalModelFetchError.parsingError(error))
      return
    }
    
    let lexicalModels = result.lexicalModels
    self.lexicalModels = Dictionary(uniqueKeysWithValues: result.lexicalModels.map { ($0.id, $0) })

    
    log.info("Request list completed -- \(result.lexicalModels.count) lexical models.")
    DispatchQueue.main.async {
      self.delegate?.lexicalModelRepositoryDidFetchList(self)
      fetchCompletionHandler(lexicalModels, nil)
    }
  }
}
