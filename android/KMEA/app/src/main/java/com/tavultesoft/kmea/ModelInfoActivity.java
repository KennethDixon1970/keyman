/*
 * Copyright (C) 2017 SIL International. All rights reserved.
 */
package com.tavultesoft.kmea;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.app.DialogFragment;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import androidx.core.content.FileProvider;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.tavultesoft.kmea.data.CloudRepository;
import com.tavultesoft.kmea.data.Dataset;
import com.tavultesoft.kmea.data.Keyboard;
import com.tavultesoft.kmea.data.LexicalModel;
import com.tavultesoft.kmea.util.FileUtils;
import com.tavultesoft.kmea.util.FileProviderUtils;
import com.tavultesoft.kmea.util.HelpFile;
import com.tavultesoft.kmea.util.MapCompat;

import static com.tavultesoft.kmea.ConfirmDialogFragment.DialogType.DIALOG_TYPE_DELETE_MODEL;

// Public access is necessary to avoid IllegalAccessException
public final class ModelInfoActivity extends AppCompatActivity {

  private static ArrayList<HashMap<String, String>> infoList = null;
  private final String titleKey = "title";
  private final String subtitleKey = "subtitle";
  private final String iconKey = "icon";

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
    final Context context = this;
    final String authority = FileProviderUtils.getAuthority(context);

    setContentView(R.layout.activity_list_layout);
    final Toolbar toolbar = findViewById(R.id.list_toolbar);
    setSupportActionBar(toolbar);
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setDisplayShowHomeEnabled(true);
    getSupportActionBar().setDisplayShowTitleEnabled(false);

    final ListView listView = findViewById(R.id.listView);

    final String packageID = getIntent().getStringExtra(KMManager.KMKey_PackageID);
    final String languageID = getIntent().getStringExtra(KMManager.KMKey_LanguageID);
    final String modelID = getIntent().getStringExtra(KMManager.KMKey_LexicalModelID);
    final String modelName = getIntent().getStringExtra(KMManager.KMKey_LexicalModelName);
    final String modelVersion = getIntent().getStringExtra(KMManager.KMKey_LexicalModelVersion);
    String latestModelCloudVersion = modelVersion;

    // Determine if model update is available from the cloud
    Dataset dataset = CloudRepository.shared.fetchDataset(this);
    HashMap<String, String> modelInfo = new HashMap<>();
    modelInfo.put(KMManager.KMKey_PackageID, packageID);
    modelInfo.put(KMManager.KMKey_LanguageID, languageID);
    modelInfo.put(KMManager.KMKey_LexicalModelID, modelID);
    modelInfo.put(KMManager.KMKey_LexicalModelName, modelName);

    LexicalModel modelQuery = new LexicalModel(modelInfo);
    final LexicalModel latestModel = dataset.lexicalModels.findMatch(modelQuery);
    if (latestModel != null) {
      latestModelCloudVersion = latestModel.getVersion();
    }

    final TextView textView = findViewById(R.id.bar_title);
    textView.setText(String.format(getString(R.string.model_info_header), modelName));

    infoList = new ArrayList<>();
    // Display model version title
    final String noIcon = "0";
    String icon = noIcon;
    HashMap<String, String> hashMap = new HashMap<>();
    hashMap.put(titleKey, getString(R.string.model_version));
    hashMap.put(subtitleKey, modelVersion);
    // Display notification to download update if latestModelCloudVersion > modelVersion (installed)
    if (FileUtils.compareVersions(latestModelCloudVersion, modelVersion) == FileUtils.VERSION_GREATER) {
      hashMap.put(subtitleKey, context.getString(R.string.update_available, modelVersion));
      icon = String.valueOf(R.drawable.ic_cloud_download);
    }
    hashMap.put(iconKey, icon);
    infoList.add(hashMap);

    // Display model help link
    hashMap = new HashMap<>();
    final String customHelpLink = getIntent().getStringExtra(KMManager.KMKey_CustomHelpLink);
    // Check if app declared FileProvider
    // Currently, model help only available if custom link exists
    icon = String.valueOf(R.drawable.ic_arrow_forward);
    // Don't show help link arrow if both custom help and File Provider don't exist
    // TODO: Update this when model help available on help.keyman.com
    if ( (!customHelpLink.equals("") && !FileProviderUtils.exists(context)) ||
        customHelpLink.equals("") ){
      icon = noIcon;
    }
    hashMap.put(titleKey, getString(R.string.help_link));
    hashMap.put(subtitleKey, "");
    hashMap.put(iconKey, icon);
    infoList.add(hashMap);

    // Display link to uninstall model
    hashMap = new HashMap<>();
    hashMap.put(titleKey, getString(R.string.uninstall_model));
    hashMap.put(subtitleKey, "");
    hashMap.put(iconKey, noIcon);
    infoList.add(hashMap);

    String[] from = new String[]{titleKey, subtitleKey, iconKey};
    int[] to = new int[]{R.id.text1, R.id.text2, R.id.image1};

    ListAdapter adapter = new SimpleAdapter(context, infoList, R.layout.list_row_layout2, from, to) {
      @Override
      public boolean isEnabled(int position) {
        HashMap<String, String> hashMap = infoList.get(position);
        String itemTitle = MapCompat.getOrDefault(hashMap, titleKey, "");
        String icon = MapCompat.getOrDefault(hashMap, iconKey, noIcon);
        if (itemTitle.equals(getString(R.string.model_version)) && icon.equals(noIcon)) {
          // No point in 'clicking' on version info if no update available.
          return false;
        // Visibly disables the help option when custom help isn't available
        } else if (itemTitle.equals(getString(R.string.help_link)) && icon.equals(noIcon)) {
          return false;
        }

        return super.isEnabled(position);
      }
    };
    listView.setAdapter(adapter);
    listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

      @Override
      public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        HashMap<String, String> hashMap = (HashMap<String, String>) parent.getItemAtPosition(position);
        String itemTitle = MapCompat.getOrDefault(hashMap, titleKey, "");

        // "Version" link clicked to download latest model version from cloud
        if (itemTitle.equals(getString(R.string.model_version))) {
          Bundle args = latestModel.buildDownloadBundle();
          Intent i = new Intent(getApplicationContext(), KMKeyboardDownloaderActivity.class);
          i.putExtras(args);
          startActivity(i);

        // "Help" link clicked
        } else if (itemTitle.equals(getString(R.string.help_link))) {
          if (!customHelpLink.equals("")) {
            // Display local welcome.htm help file, including associated assets
            Intent i = HelpFile.toActionView(context, customHelpLink, packageID);

            if (FileProviderUtils.exists(context) || KMManager.isTestMode()) {
              startActivity(i);
            }
          } else {
            // We should always have a help file packaged with models.
          }

        // "Uninstall Model" clicked
        } else if (itemTitle.equals(getString(R.string.uninstall_model))) {
          // Uninstall selected model
          String lexicalModelKey = String.format("%s_%s_%s", packageID, languageID, modelID);
          DialogFragment dialog = ConfirmDialogFragment.newInstanceForItemKeyBasedAction(
            DIALOG_TYPE_DELETE_MODEL, modelName, getString(R.string.confirm_delete_model), lexicalModelKey);
          dialog.show(getFragmentManager(), "dialog");

        } else {
          return;
        }
      }
    });
  }

  @Override
  public boolean onSupportNavigateUp() {
    super.onBackPressed();
    return true;
  }
}
