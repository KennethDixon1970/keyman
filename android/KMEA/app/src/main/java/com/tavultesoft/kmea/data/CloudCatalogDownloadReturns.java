package com.tavultesoft.kmea.data;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

/**
 * Result type for catalogue download.
 */
class CloudCatalogDownloadReturns {
  public JSONObject keyboardJSON;
  public JSONArray lexicalModelJSON;

  // Used by the CloudCatalogDownloadTask, as it fits well with doInBackground's param structure.
  public CloudCatalogDownloadReturns(List<CloudApiTypes.CloudApiReturns> returns) {
    JSONObject kbd = null;
    JSONArray lex = null;

    //TODO: Seems to be wrong because only the last result for each type will be processed
    for(CloudApiTypes.CloudApiReturns ret: returns) {
      switch(ret.target) {
        case Keyboards:
          kbd = ret.jsonObject;
          break;
        case LexicalModels:
          lex = ret.jsonArray;
      }
    }

    // Errors are thrown if we try to do this assignment within the loop.
    this.keyboardJSON = kbd;
    this.lexicalModelJSON = lex;
  }

  public CloudCatalogDownloadReturns(JSONObject keyboardJSON, JSONArray lexicalModelJSON) {
    this.keyboardJSON = keyboardJSON;
    this.lexicalModelJSON = lexicalModelJSON;
  }

  public boolean isEmpty() {
    boolean emptyKbd = keyboardJSON == null || keyboardJSON.length() == 0;
    boolean emptyLex = lexicalModelJSON == null || lexicalModelJSON.length() == 0;

    return emptyKbd && emptyLex;
  }
}
