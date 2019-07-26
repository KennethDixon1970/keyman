//
//  LexicalModelInfoViewController.swift
//  KeymanEngine
//
//  Created by Randy Boring on 3/19/19.
//  Copyright © 2019 SIL International. All rights reserved.
//
import UIKit
import Foundation

class LexicalModelInfoViewController: UITableViewController, UIAlertViewDelegate {
  var lexicalModelCount: Int = 0
  var lexicalModelIndex: Int = 0
  var lexicalModelID: String = ""
  var languageID: String = ""
  var lexicalModelVersion: String = ""
  var lexicalModelCopyright: String = ""
  var isCustomLexicalModel: Bool = false
  
  private var infoArray = [[String: String]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    infoArray = [[String: String]]()
    infoArray.append([
        "title": "Dictionary version",
        "subtitle": lexicalModelVersion
        ])
  
    if !isCustomLexicalModel {
      infoArray.append([
          "title": "Help link",
          "subtitle": ""
          ])
    }
    infoArray.append([
        "title": "Uninstall dictionary",
        "subtitle": ""
        ])
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setToolbarHidden(true, animated: true)
    log.info("didAppear: LexicalModelInfoViewController")
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isCustomLexicalModel {
      return 2
    } else {
      return 3
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "Cell"
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
      return cell
    }
    return UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if !isCustomLexicalModel {
      if indexPath.row == 1 {
        let url = URL(string: "http://help.keyman.com/lexicalModel/\(lexicalModelID)/\(lexicalModelVersion)/")!
        if let openURL = Manager.shared.openURL {
          _ = openURL(url)
        } else {
          log.error("openURL not set in Manager. Failed to open \(url)")
        }
      } else if indexPath.row == 2 {
        showDeleteLexicalModel()
      }
    } else if indexPath.row == 1 {
      showDeleteLexicalModel()
    }
  }
  
  private func fetchedLexicalModelData(_ data: Data) {
    guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [AnyHashable: Any] else {
      return
    }
    let lexicalModels = json[Key.language] as? [Any]
    let kbDict = lexicalModels?[0] as? [AnyHashable: Any]
    var info = infoArray[1]
    let copyright = kbDict?[Key.lexicalModelCopyright] as? String ?? "Unknown"
  
    info["subtitle"] = copyright
    infoArray[1] = info
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.selectionStyle = .none
    cell.accessoryType = .none
    cell.textLabel?.text = infoArray[indexPath.row]["title"]
    cell.detailTextLabel?.text = infoArray[indexPath.row]["subtitle"]
    cell.tag = indexPath.row
  
    if !isCustomLexicalModel {
      if indexPath.row == 1 {
        cell.accessoryType = .disclosureIndicator
      } else if indexPath.row == 2 && !canDeleteLexicalModel {
        cell.isUserInteractionEnabled = false
        cell.textLabel?.isEnabled = false
        cell.detailTextLabel?.isEnabled = false
      }
    } else if indexPath.row == 1 && !canDeleteLexicalModel {
      cell.isUserInteractionEnabled = false
      cell.textLabel?.isEnabled = false
      cell.detailTextLabel?.isEnabled = false
    }
  }
  
  private var canDeleteLexicalModel: Bool {
    if !Manager.shared.canRemoveLexicalModels {
      return false
    }
  
    if !Manager.shared.canRemoveDefaultLexicalModel {
      return lexicalModelIndex != 0
    }
  
    if lexicalModelIndex > 0 {
      return true
    }
    return lexicalModelCount > 1
  }
  
  private func showDeleteLexicalModel() {
    let alertController = UIAlertController(title: title ?? "", message: "Would you like to delete this dictionary?",
                                            preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Cancel",
                                            style: UIAlertActionStyle.cancel,
                                            handler: nil))
    alertController.addAction(UIAlertAction(title: "Delete",
                                            style: UIAlertActionStyle.default,
                                            handler: deleteHandler))
  
    self.present(alertController, animated: true, completion: nil)
  }
  
  func deleteHandler(withAction action: UIAlertAction) {
    if Manager.shared.removeLexicalModel(at: lexicalModelIndex) {
      navigationController?.popToRootViewController(animated: true)
    }
  }
}
