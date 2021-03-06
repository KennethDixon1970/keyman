//
//  FullLexicalModelID.swift
//  KeymanEngine
//
//  Created by Randy Boring on 3/14/19.
//  Copyright © 2019 SIL International. All rights reserved.
//

import Foundation

/// A complete identifier for an `InstallableLexicalModel`. LexicalModels must have unique `FullLexicalModelID`s.
public struct FullLexicalModelID: Codable {
  public var lexicalModelID: String
  public var languageID: String
}

// MARK: - Equatable
extension FullLexicalModelID: Equatable {
  public static func ==(lhs: FullLexicalModelID, rhs: FullLexicalModelID) -> Bool {
    return lhs.lexicalModelID == rhs.lexicalModelID && lhs.languageID == rhs.languageID
  }
}

// MARK: - CustomStringConvertible
extension FullLexicalModelID: CustomStringConvertible {
  public var description: String {
    return "<lexicalModelID: \"\(lexicalModelID)\", languageID: \"\(languageID)\">"
  }
}

