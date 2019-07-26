/**
 * Copyright (C) 2019 SIL International. All rights reserved.
 */

package com.tavultesoft.kmea;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SwitchCompat;
import androidx.appcompat.widget.Toolbar;

import com.tavultesoft.kmea.data.CloudRepository;
import com.tavultesoft.kmea.data.Dataset;
import com.tavultesoft.kmea.data.Keyboard;
import com.tavultesoft.kmea.data.adapters.NestedAdapter;
import com.tavultesoft.kmea.util.MapCompat;

import java.util.HashMap;

/**
 * Keyman Settings --> Languages Settings --> Language Settings
 * Displays a list of installed keyboards and some lexical model switches.
 */
public final class LanguageSettingsActivity extends AppCompatActivity {
  private Context context;
  private static Toolbar toolbar = null;
  private static ListView listView = null;
  private static TextView lexicalModelTextView = null;
  private ImageButton addButton = null;
  private String associatedLexicalModel = "";
  private String lgCode;
  private String lgName;
  private SharedPreferences prefs;

  private final static String TAG = "LanguageSettingsAct";

  private final static String predictionPrefSuffix = ".mayPredict";
  private final static String correctionPrefSuffix = ".mayCorrect";

  private class PreferenceToggleListener implements View.OnClickListener {
    String prefsKey;
    String lgCode;

    public PreferenceToggleListener(String prefsKey, String lgCode) {
      this.prefsKey = prefsKey;
      this.lgCode = lgCode;
    }

    @Override
    public void onClick(View v) {
      SwitchCompat correctToggle = (SwitchCompat) v;

      // This will allow preemptively making settings for languages without models.
      // Seems more trouble than it's worth to block this.
      SharedPreferences.Editor prefEditor = prefs.edit();
      prefEditor.putBoolean(prefsKey, correctToggle.isChecked());
      prefEditor.apply();

      // Don't use/apply language modeling settings for languages without models.
      if (associatedLexicalModel.isEmpty()) {
        return;
      }

      // If the active keyboard is for this language, immediately enact the new pref setting.
      String kbdLgCode = KMManager.getCurrentKeyboardInfo(context).get(KMManager.KMKey_LanguageID);
      if (kbdLgCode.equals(lgCode)) {
        // Not only registers the model but also applies our modeling preferences.
        KMManager.registerAssociatedLexicalModel(lgCode);
      }
    }
  }

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
    context = this;
    setContentView(R.layout.language_settings_list_layout);

    toolbar = (Toolbar) findViewById(R.id.list_toolbar);
    setSupportActionBar(toolbar);
    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    getSupportActionBar().setDisplayShowHomeEnabled(true);
    getSupportActionBar().setDisplayShowTitleEnabled(false);
    TextView textView = (TextView) findViewById(R.id.bar_title);

    listView = (ListView) findViewById(R.id.listView);
    listView.setFastScrollEnabled(true);

    Bundle bundle = getIntent().getExtras();
    if (bundle == null) {
      // Should never actually happen.
      Log.e(TAG, "Language data not specified for LanguageSettingsActivity!");
      finish();

      if(KMManager.isDebugMode()) {
        throw new NullPointerException("Language data not specified for LanguageSettingsActivity!");
      } else {
        return;
      }
    }

    lgCode = bundle.getString(KMManager.KMKey_LanguageID);
    lgName = bundle.getString(KMManager.KMKey_LanguageName);

    // Necessary to properly insert a language name into the title.  (Has a %s slot for it.)
    String title = String.format(getString(R.string.title_language_settings), lgName);
    textView.setText(title);

    FilteredKeyboardsAdapter adapter = new FilteredKeyboardsAdapter(context, KeyboardPickerActivity.getInstalledDataset(context), lgCode);

    // The following two layouts/toggles will need to link with these objects.
    Context appContext = this.getApplicationContext();
    prefs = appContext.getSharedPreferences(appContext.getString(R.string.kma_prefs_name), Context.MODE_PRIVATE);
    boolean mayPredict = prefs.getBoolean(getLanguagePredictionPreferenceKey(lgCode), true);
    boolean mayCorrect = prefs.getBoolean(getLanguageCorrectionPreferenceKey(lgCode), true);

    RelativeLayout layout = (RelativeLayout)findViewById(R.id.corrections_toggle);

    textView = (TextView) layout.findViewById(R.id.text1);
    textView.setText(getString(R.string.enable_corrections));
    SwitchCompat toggle = layout.findViewById(R.id.toggle);
    toggle.setChecked(mayCorrect); // Link to persistent option storage!  Also needs handler.
    String prefsKey = getLanguageCorrectionPreferenceKey(lgCode);
    toggle.setOnClickListener(new PreferenceToggleListener(prefsKey, lgCode));

    layout = (RelativeLayout)findViewById(R.id.predictions_toggle);

    textView = (TextView) layout.findViewById(R.id.text1);
    textView.setText(getString(R.string.enable_predictions));
    toggle = layout.findViewById(R.id.toggle);
    toggle.setChecked(mayPredict); // Link to persistent option storage!  Also needs handler.
    prefsKey = getLanguagePredictionPreferenceKey(lgCode);
    toggle.setOnClickListener(new PreferenceToggleListener(prefsKey, lgCode));

    layout = (RelativeLayout)findViewById(R.id.model_picker);
    textView = (TextView) layout.findViewById(R.id.text1);
    textView.setText(getString(R.string.model));

    lexicalModelTextView = layout.findViewById(R.id.text2);

    updateActiveLexicalModel();

    ImageView imageView = (ImageView) layout.findViewById(R.id.image1);
    imageView.setImageResource(R.drawable.ic_arrow_forward);
    layout.setEnabled(true);
    layout.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        // Start ModelPickerActivity
        Bundle bundle = new Bundle();
        bundle.putString(KMManager.KMKey_LanguageID, lgCode);
        bundle.putString(KMManager.KMKey_LanguageName, lgName);
        Intent i = new Intent(context, ModelPickerActivity.class);
        i.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        i.putExtras(bundle);
        startActivity(i);
      }
    });

    /**
     * This is a placeholder for "Manage dictionary" settings
     *
     * layout = (RelativeLayout)findViewById(R.id.manage_dictionary);
     * textView = (TextView) layout.findViewById(R.id.text1);
     * textView.setText(getString(R.string.manage_dictionary));
     * imageView = (ImageView) layout.findViewById(R.id.image1);
     * imageView.setImageResource(R.drawable.ic_arrow_forward);
     */

    listView.setAdapter(adapter);
    listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
      @Override
      public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        listView.setItemChecked(position, true);
        listView.setSelection(position);
        Keyboard kbd = ((FilteredKeyboardsAdapter) listView.getAdapter()).getItem(position);
        HashMap<String, String> kbInfo = new HashMap<>(kbd.map);
        String packageID = kbInfo.get(KMManager.KMKey_PackageID);
        String keyboardID = kbInfo.get(KMManager.KMKey_KeyboardID);
        if (packageID == null || packageID.isEmpty()) {
          packageID = KMManager.KMDefault_UndefinedPackageID;
        }
        Intent intent = new Intent(context, KeyboardSettingsActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
        intent.putExtra(KMManager.KMKey_PackageID, packageID);
        intent.putExtra(KMManager.KMKey_KeyboardID, keyboardID);
        intent.putExtra(KMManager.KMKey_LanguageID, kbInfo.get(KMManager.KMKey_LanguageID));
        intent.putExtra(KMManager.KMKey_LanguageName, kbInfo.get(KMManager.KMKey_LanguageName));
        intent.putExtra(KMManager.KMKey_KeyboardName, kbInfo.get(KMManager.KMKey_KeyboardName));
        intent.putExtra(KMManager.KMKey_KeyboardVersion, KMManager.getLatestKeyboardFileVersion(context, packageID, keyboardID));
        boolean isCustom = MapCompat.getOrDefault(kbInfo, KMManager.KMKey_CustomKeyboard, "N").equals("Y") ? true : false;
        intent.putExtra(KMManager.KMKey_CustomKeyboard, isCustom);
        String customHelpLink = kbInfo.get(KMManager.KMKey_CustomHelpLink);
        if (customHelpLink != null)
          intent.putExtra(KMManager.KMKey_CustomHelpLink, customHelpLink);
        startActivity(intent);
      }
    });

    addButton = (ImageButton) findViewById(R.id.add_button);
    addButton.setOnClickListener(new View.OnClickListener() {
      public void onClick(View v) {
        // Check that available keyboard information can be obtained via:
        // 1. connection to cloud catalog
        // 2. cached file
        // 3. local kmp.json files in packages/
        if (KMManager.hasConnection(context) || CloudRepository.shared.hasCache(context) ||
          KeyboardPickerActivity.hasKeyboardFromPackage()){
          // Rework to use languuage-specific (KeyboardList) picker!
          Intent i = new Intent(context, KeyboardListActivity.class);
          i.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
          i.putExtra("languageCode", lgCode);
          i.putExtra("languageName", lgName);
          context.startActivity(i);
        } else {
          AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(context);
          dialogBuilder.setTitle(getString(R.string.title_add_keyboard));
          dialogBuilder.setMessage(String.format("\n%s\n", getString(R.string.cannot_connect)));
          dialogBuilder.setPositiveButton(getString(R.string.label_ok), null);
          AlertDialog dialog = dialogBuilder.create();
          dialog.show();
        }
      }
    });
  }

  @Override
  public void onResume() {
    super.onResume();

    FilteredKeyboardsAdapter adapter = ((FilteredKeyboardsAdapter) listView.getAdapter());

    if(adapter != null) {
      // Despite the fact that updates should have been auto-triggered anyway, it seems that we
      // need a manual call here for things to happen in a timely fashion.
      adapter.notifyDataSetChanged();
    }

    updateActiveLexicalModel();
  }

  public void updateActiveLexicalModel() {
    HashMap<String, String> lexModelMap = KMManager.getAssociatedLexicalModel(lgCode);
    if(lexModelMap != null) {
      associatedLexicalModel = lexModelMap.get(KMManager.KMKey_LexicalModelName);
    } else {
      associatedLexicalModel = "";
    }
    if (!associatedLexicalModel.isEmpty()) {
      lexicalModelTextView.setText(associatedLexicalModel);
      lexicalModelTextView.setEnabled(true);
    } else {
      lexicalModelTextView.setText("");
      lexicalModelTextView.setEnabled(false);
    }
  }

  @Override
  public void onPause() {
    super.onPause();
  }

  @Override
  public boolean onSupportNavigateUp() {
    onBackPressed();
    return true;
  }

  @Override
  public void onBackPressed() {
    finish();
  }

  public static String getLanguagePredictionPreferenceKey(String langID) {
    return langID + predictionPrefSuffix;
  }

  public static String getLanguageCorrectionPreferenceKey(String langID) {
    return langID + correctionPrefSuffix;
  }

  // Fully details the building of this Activity's list view items.
  static private class FilteredKeyboardsAdapter extends NestedAdapter<com.tavultesoft.kmea.data.Keyboard, Dataset.Keyboards, String> {
    static final int RESOURCE = R.layout.list_row_layout1;

    private static class ViewHolder {
      ImageView img;
      TextView text;
    }

    public FilteredKeyboardsAdapter(@NonNull Context context, final Dataset storage, final String languageCode) {
      // Goal:  to not need a custom filter here, instead relying on LanguageDataset's built-in filters.
      super(context, RESOURCE, storage.keyboards, storage.keyboardFilter, languageCode);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
      com.tavultesoft.kmea.data.Keyboard kbd = this.getItem(position);
      ViewHolder holder;

      // If we're being told to reuse an existing view, do that.  It's automatic optimization.
      if (convertView == null) {
        convertView = LayoutInflater.from(getContext()).inflate(RESOURCE, parent, false);
        holder = new ViewHolder();
        holder.img = convertView.findViewById(R.id.image1);
        holder.text = convertView.findViewById(R.id.text1);
        convertView.setTag(holder);
      } else {
        holder = (ViewHolder) convertView.getTag();
      }

      holder.text.setText(kbd.map.get(KMManager.KMKey_KeyboardName));
      holder.img.setImageResource(R.drawable.ic_arrow_forward);

      return convertView;
    }
  }
}