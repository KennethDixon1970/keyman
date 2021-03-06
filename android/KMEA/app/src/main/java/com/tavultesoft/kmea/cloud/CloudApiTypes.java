package com.tavultesoft.kmea.cloud;

import android.app.DownloadManager;

import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class CloudApiTypes {
  public static class CloudApiReturns {

    public final ApiTarget target;
    public final JSONArray jsonArray;
    public final JSONObject jsonObject;

    public CloudApiReturns(ApiTarget target, JSONArray jsonArray) {
      this.target = target;
      this.jsonArray = jsonArray;
      this.jsonObject = null;
    }

    public CloudApiReturns(ApiTarget target, JSONObject jsonObject) {
      this.target = target;
      this.jsonArray = null;
      this.jsonObject = jsonObject;
    }

  }

  public enum ApiTarget {
    /**
     * Catalog download: available keyboards including meta data.
     */
    Keyboards,
    /**
     * Catalog download: available lexical models including meta data.
     */
    LexicalModels,
    /**
     * Keyboard download: keyboard meta data for the selected keyboard.
     */
    Keyboard,
    /**
     * Keyboard download: lexical models meta data for the language of the selected keyboard.
     */
    KeyboardLexicalModels,
    /**
     *  Keyboard download: download keyboard data package and fonts.
     */
    KeyboardData,
    /**
     *  Lexical download: download lexical model package
     *  Used for single lexical model download and
     *  automatic lexical model download during keyboard download
     */
    LexicalModelPackage,
  }

  public enum JSONType {
    Array,
    Object
  }

  public static class CloudApiParam implements Serializable {

    static final long serialVersionUID = 1L;

    public final ApiTarget target;
    public final String url;
    public JSONType type;
    private final HashMap<String,Serializable> additionalProperties = new HashMap<>();

    public CloudApiParam(ApiTarget target, String url) {
      this.target = target;
      this.url = url;
    }

    public CloudApiParam setType(JSONType type) {
      this.type = type;
      return this;
    }
    public CloudApiParam setAdditionalProperty(String aProperty, Serializable aValue)
    {
      additionalProperties.put(aProperty,aValue);
      return this;
    }

    public <T extends  Serializable> T getAdditionalProperty(String aProperty,Class<T> aType)
    {
      return aType.cast(additionalProperties.get(aProperty));
    }
  }

  public static class SingleCloudDownload
  {
    private final DownloadManager.Request request;
    private boolean downloadFinished =false;
    private long downloadId;
    private final File destinationFile;
    private CloudApiParam cloudParams;

    public SingleCloudDownload(DownloadManager.Request aRequest,File aDestinationFile)
    {
      request = aRequest;
      destinationFile = aDestinationFile;
    }
    public SingleCloudDownload setDownloadId(long downloadId) {
      this.downloadId = downloadId;
      return this;
    }

    public SingleCloudDownload setCloudParams(CloudApiParam params) {
      this.cloudParams = params;
      return this;
    }

    public DownloadManager.Request getRequest() {
      return request;
    }

    public long getDownloadId() {
      return downloadId;
    }

    public File getDestinationFile() {
      return destinationFile;
    }

    public CloudApiParam getCloudParams() {
      return cloudParams;
    }
  }

  /**
   * Typed Download sets for cloud download.
   * @param <ModelType> the model objects type
   * @param <ResultType> the result type of the download
   */
  public static class CloudDownloadSet<ModelType,ResultType> {
    private final String downloadIdentifier;
    private final ModelType targetModel;
    private final LinkedList<SingleCloudDownload> downloads = new LinkedList<>();

    private ICloudDownloadCallback<ModelType,ResultType> callback;

    private boolean resultsReady = false;

    //TODO: maybe implement a max lifetime for downloads
    //private long startingTime = System.currentTimeMillis();

    public CloudDownloadSet(@NonNull String aDownloadIdentifier, ModelType theTargetObject)
    {
      targetModel = theTargetObject;
      downloadIdentifier = aDownloadIdentifier;
    }

    protected boolean hasOpenDownloads() {
      synchronized (downloads) {
        for (SingleCloudDownload _d : downloads) {
          if (!_d.downloadFinished)
            return true;
        }
        return false;
      }
    }

    void addDownload(SingleCloudDownload aDownload) {
      synchronized (downloads) {
        if (resultsReady)
          throw new IllegalStateException("Could not add download to an already processed download set");

        downloads.add(aDownload);
      }
    }

    public ICloudDownloadCallback getCallback() {
      return callback;
    }

    public void setCallback(ICloudDownloadCallback<ModelType,ResultType> callback) {
      this.callback = callback;
    }

    public boolean isResultsReady() {
      return resultsReady;
    }

    public void setResultsReady() {
      this.resultsReady = true;
    }

    public String getDownloadIdentifier() {
      return downloadIdentifier;
    }

    public ModelType getTargetModel() {
      return targetModel;
    }

    void setDone(long aDownload) {
      synchronized (downloads) {
        if (resultsReady)
          throw new IllegalStateException("Download is already ready");

        for (SingleCloudDownload _d : downloads) {
          if (_d.downloadId == aDownload) {
            _d.downloadFinished = true;
            return;
          }
        }
      }


    }

    public List<SingleCloudDownload> getSingleDownloads() {
      return Collections.unmodifiableList(downloads);
    }
  }
}
