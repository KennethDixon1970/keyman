/**
 * Copyright (C) 2017-2019 SIL International. All rights reserved.
 */

package com.tavultesoft.kmapro;

import com.tavultesoft.kmea.KMManager;
import com.tavultesoft.kmea.KMManager.FormFactor;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;
import android.annotation.SuppressLint;
import androidx.appcompat.widget.Toolbar;
import androidx.appcompat.app.AppCompatActivity;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;

public class InfoActivity extends AppCompatActivity {

  private WebView webView;
  private final String kmHelpBaseUrl = "https://help.keyman.com/products/android";
  private String kmUrl = "";
  private final String htmlPath = "file:///android_asset/info/products/android";
  private final String htmlPage = "index.php";
  private String kmOfflineUrl = "";

  @SuppressLint("SetJavaScriptEnabled")
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    final Context context = this;

    setContentView(R.layout.activity_info);

    Toolbar toolbar = findViewById(R.id.info_toolbar);
    setSupportActionBar(toolbar);
    getSupportActionBar().setTitle(null);
    getSupportActionBar().setDisplayUseLogoEnabled(true);
    getSupportActionBar().setDisplayShowHomeEnabled(true);
    getSupportActionBar().setLogo(R.drawable.keyman_logo);
    getSupportActionBar().setDisplayShowTitleEnabled(false);
    getSupportActionBar().setDisplayShowCustomEnabled(true);

    TextView version = new TextView(this);
    version.setWidth((int) getResources().getDimension(R.dimen.label_width));
    version.setTextSize(getResources().getDimension(R.dimen.titlebar_label_textsize));
    version.setGravity(Gravity.CENTER);

    // Parse to create a version title
    String versionStr = "";
    PackageInfo pInfo;
    try {
      pInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
      versionStr = pInfo.versionName;
    } catch (NameNotFoundException e) {
      // Fallback to a "current" version. This does not need to be maintained
      versionStr = "12.0.0.0";
    }

    String versionTitle = String.format("%s: %s", getString(R.string.title_version), versionStr);
    version.setText(versionTitle);
    getSupportActionBar().setCustomView(version);

    // Extract the the major minor version from the full version string
    String[] versionArray = versionStr.split("\\.", 3);
    String majorMinorVersion = String.format("%s.%s", versionArray[0], versionArray[1]);

    // Determine the appropriate form factor
    FormFactor ff = KMManager.getFormFactor();
    String formFactor;

    if(ff == FormFactor.PHONE) {
      formFactor = "phone";
    } else {
      formFactor = "tablet";
    }

    kmUrl = String.format("%s/%s/%s?embed=android&formfactor=%s", kmHelpBaseUrl, majorMinorVersion, htmlPage, formFactor);
    // The offline mirroring process (currently) adds .html to the end of the whole string.
    kmOfflineUrl = String.format("%s/%s/%s.html", htmlPath, formFactor, htmlPage);
    webView = (WebView) findViewById(R.id.infoWebView);
    webView.getSettings().setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);
    webView.getSettings().setJavaScriptEnabled(true);
    webView.getSettings().setUseWideViewPort(true);
    webView.getSettings().setLoadWithOverviewMode(true);
    webView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);

    webView.setWebChromeClient(new WebChromeClient() {
    });
    webView.setWebViewClient(new WebViewClient() {
      @Override
      public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
      }

      @Override
      public boolean shouldOverrideUrlLoading(WebView view, String url) {
        if (url != null && !url.toLowerCase().equals("about:blank")) {
          view.loadUrl(url);
         }

        return true;
      }

      @Override
      public void onPageStarted(WebView view, String url, Bitmap favicon) {
      }

      @Override
      public void onPageFinished(WebView view, String url) {
      }
    });

    if (KMManager.hasConnection(context)) {
      // Load app info page from server
      webView.loadUrl(kmUrl);
    } else {
      // Load app info page from assets
      webView.loadUrl(kmOfflineUrl);
    }
  }

  @Override
  public void onBackPressed() {
    finish();
    overridePendingTransition(0, android.R.anim.fade_out);
  }
}