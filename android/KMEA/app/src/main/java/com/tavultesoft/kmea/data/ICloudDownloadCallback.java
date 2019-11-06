package com.tavultesoft.kmea.data;

import android.content.Context;

/**
 * Interface for {@link CloudDownloadMgr} as callback to do use case specific task.
 * @param <ModelType> the model objects type
 * @param <ResultType> the result type of the download
 */
public interface ICloudDownloadCallback<ModelType,ResultType> {


  /**
   * extract download result object from download set
   * @param aDownload the download
   * @return the result
   */
  ResultType extractCloudResultFromDownloadSet(CloudApiTypes.CloudDownloadSet<ModelType,ResultType> aDownload);

  /**
   * Apply download results to target model.
   * @param aContext the context
   * @param aModel the model
   * @param aCloudResult the result
   */
  void applyCloudDownloadToModel(Context aContext, ModelType aModel, ResultType aCloudResult);
}
