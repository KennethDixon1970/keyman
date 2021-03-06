# Keyman Developer Version History

## 2020-02-18 13.0.76 beta
* Bug Fix(Install): Upgrading would lose user settings (resolves after 2 upgrades) (#2668)

## 2020-02-17 13.0.75 beta
* Bug Fix(IDE): In some situations, the context help window could cause Developer to crash (#2661)
* Bug Fix(IDE): Attempting to import a blank OSK into the Touch Layout Editor would eventually crash (#2663)

## 2020-02-13 13.0.73 beta
* Bug Fix(IDE/Model Editor): Would never be set into modified state for changes exclusively in a wordlist. (#2634)
* Bug Fix(IDE/Model Editor): Add context help (#2634)
* Bug Fix(IDE/Model Editor): Add Ctrl+PgUp/Ctrl+PgDn hotkeys for switching pages (#2634)
* Bug Fix(IDE/Model Editor): Add Alt+Left/Alt+Right hotkeys for switching views (#2634)
* Bug Fix(IDE/Model Editor): Saving file from source view now gets latest changes correctly (#2634)

## 2020-02-12 13.0.72 beta
* Bug Fix(IDE/Debugger): MIME type mismatch on some systems could cause web test to fail (#2633)

## 2020-02-11 13.0.66 beta
* Bug Fix(Compiler): Merge of .keyboard_info files would not always get platform support correct (#2621)
* Bug Fix(Compiler): Missing keyboard file led to misleading error in package compiler (#2620)
* Bug Fix(Compiler): Double-click to drop character onto touch layout was disabled (#2619)

## 2020-01-28 13.0.65 beta
* Feature(Compiler): Hotkeys defined in .kmn no longer need to be quoted (#2432)
* Feature(IDE): Enhanced Lexical Model Editor (#2396)
* Feature(IDE): Show QRCode for web debugger URLs in Keyboard and Package editors (#2433)
* Feature(IDE): F7 in Project window compiles the whole project (#2442)
* Feature(IDE): Default Project Path is now Documents\Keyman Developer\Projects (#2449)
* Feature(Tools): Add unsupported kmdecomp decompiler utility (#2419)
* Feature(Tools): Add x64 version of kmcomp for macOS (#2352)
* Bug Fix(Compiler): Missing author email was causing lexical model compiler to fail (#2388, 12.0:#2496)
* Bug Fix(Compiler): Lexical model compiler was not handling SMP characters (#2438, 12.0:#2502)
* Bug Fix(Compiler): Zero-length store names are no longer permitted (#2443)
* Bug Fix(Compiler): Some keyboards were incorrectly marked as mobile-capable (#2334, 12.0:#2343)
* Bug Fix(Compiler): nul in context caused incorrect context deletion for web keyboards 10.0 or newer (#2295)
* Bug Fix(IDE): Remove version info from .kps when follow-keyboard-version is set (#2417)
* Bug Fix(IDE): Make sure popup menus are never obscured in Project view (#2415)
* Bug Fix(IDE): 'Show Help' was not working on Distribution tab in Project view (#2397)
* Bug Fix(IDE): Character Map now drops characters instead of codes in visual editors (#2428)
* Bug Fix(IDE): Text editor and other controls did not receive focus correctly (#2331, 12.0:#2340)
* Bug Fix(IDE): Shortcuts in text editors were not working after #2331 (#2424, 12.0:#2425)
* Bug Fix(IDE): Unicode characters could be silently lost when editing legacy Windows-1252 files (#2416)
* Bug Fix(IDE): Deleting select platform in code view of touch layout editor could crash (#2294)
* Bug Fix(Tools): Keyboard ID was not clean by default with Import Windows Keyboard (#2431)
* Change(IDE): Rename UI references of 'TIKE' to 'Keyman Developer' (#2439)
* Change(IDE): Application title no longer shows active project, only main window (#2441, #2291)

## 2020-01-20 12.0.66 stable
* Bug Fix: Character Map was not reliably dropping into Text Editor (#2504)
* Bug Fix: Lexical model compiler was not handling SMP characters (#2502)

## 2020-01-20 12.0.65 stable
* Bug Fix: Missing author email was causing lexical model compiler to fail (#2496)

## 2019-12-06 12.0.62 stable
* Bug Fix: Shortcuts in text editors were not working after #2331 (#2425)

## 2019-11-18 12.0.55 stable
* Bug Fix: Some keyboards were incorrectly marked as mobile-capable (#2343)

## 2019-11-15 12.0.54 stable
* Bug Fix: Text editor and other controls did not receive focus correctly (#2340)

## 2019-10-07 12.0.50 stable
* Release 12.0

## 2019-10-05 12.0.45 beta
* Touch Layout Editor: Make default padding in touch layout editor match default padding in KeymanWeb. (#2170)

## 2019-10-04 12.0.44 beta
* Package Editor: Lexical models do not have embedded version numbers, so remove this from the user interface. (#2164)
* Touch Layout Editor: Dropping character from Character Map onto Touch Layout Editor now saves the change. (#2163)

## 2019-09-30 12.0.41 beta
* General: Keyman Desktop 11 would crash if installed together with Keyman Developer 12. (#2148)

## 2019-09-29 12.0.40 beta
* General: Context help was not showing correctly on startup. (#2145)

## 2019-09-27 12.0.39 beta
* General: Introduces a Welcome screen and improves workflow for starting use of Keyman Developer. (#2134)
* General: Fix version numbers for kmlmc, kmlmp and kmlmi. (#2129)
* General: .js files now open in Keyman Developer for editing. (#2140)

## 2019-09-25 12.0.37 beta
* Compiler: Add -lexical-model command line option for building lexical model template projects to kmconvert. (#2120)
* Debugger: Remove legacy 'Install keyboard' link in web test and cleanup look somewhat. (#2122)
* Compiler: Support colour log messages and cleanup logging. (#2128)
* Help: Fix some of the issues with Context Help, and address one specific topic - touch layout editor. (#2132)

## 2019-09-24 12.0.36 beta
* General: File type icons were mismatched (#2112)
* Project: Shift layer in basic touch layout template had incorrect modifier for period (.) on shift layer (#2113)
* Touch layout editor: Adding or deleting a playform or layer and making no other changes would not stick (#2114)
* General: On Windows 7 and 8, in some circumstances dialog boxes could appear behind the main form (#2115)

## 2019-09-20 12.0.34 beta
* Add basic wordlist editor to Keyman Developer (#2086)

## 2019-09-19 12.0.33 beta
* Disable canonicalization of BCP 47 codes when building keyboard and model projects from template because it's inadequate (#2084)
* Prevent package metadata preprocessor from treating .model.js files as keyboard files when they don't exist (#2085)

## 2019-09-11 12.0.30 beta
* Clarify the project filename that will be created and simplify how the Browse button works in Project Template dialogs (#2073)

## 2019-09-09 12.0.28 beta
* Character preview was not updating in mobile web touch test (#2061)

## 2019-09-08 12.0.27 beta
* Make sure New Project actually starts a new, blank project (#2059)
* Don't overwrite a BCP 47 code that the user has chosen when writing project templates (#2060)

## 2019-09-02 12.0.23 beta
* Add kmlmc, kmlmi and kmlmp command line tools for building lexical models (#2024)

## 2019-08-16 12.0.15 beta
* Add support for lexical models in packages for development tools (#1977)

## 2019-07-29 12.0.9 beta
* Initial beta release of Keyman Desktop 12
* [Pull Requests](https://github.com/keymanapp/keyman/pulls?utf8=%E2%9C%93&q=is%3Apr+merged%3A2019-02-25..2019-08-04+label%3Adeveloper+base%3Amaster)

* New Features:
  * Lexical model compiler - currently only available from source (#1766)
  * Add keyboard source analysis and automated regression test tool "kmanalyze" (#1696)

## 2019-06-12 11.0.1360.0 stable
* No changes

## 2019-06-05 11.0.1357.0 stable
* No changes

## 2019-04-29 11.0.1355.0 stable
* No changes

## 2019-04-24 11.0.1354.0 stable
* Bug fix: Keyman Developer touch layout editor would not save key caps for subkeys (#1731)
* Bug fix: Compiler could occasionally fail with undefined results when using Unicode store names (#1736)

## 2019-04-06 11.0.1353.0 stable
* Bug fix: For large keyboards, Keyman Developer would generate a .js file that Chrome was unable to parse (#1717)

## 2019-02-27 11.0.1352.0 stable
* No changes

## 2019-02-26 11.0.1351.0 stable
* Not released

## 2019-02-25 11.0.1350.0 stable
* 11.0 Stable release

## 2019-02-25 11.0.1313.0 beta
* No changes to Keyman Developer

## 2019-02-21 11.0.1312.0 beta
* Bug fix: Connect buttons to actions in Distribution tab in Project (#1606)
* Bug fix: Fix crash saving new keyboard when missing files are referenced (#1605)
* Bug fix: Fix resizing of text editor windows (#1607)

## 2019-02-20 11.0.1311.0 beta
* No changes to Keyman Developer

## 2019-02-19 11.0.1310.0 beta
* Bug fix: Developer does not focus the text editor automatically after load (#1582)

## 2019-02-15 11.0.1309.0 beta
* Bug fix: Developer was not maintaining project state between page loads (#1580)
* Bug fix: Developer now maintains the view state when switching between Design and Code views of touch layout editor (#1579)
* Bug fix: New Project Wizard wasn't adding metadata files to project (#1578)
* Bug Fix: Package RTL keyboard metadata was being overwritten if .kmx was after .js in package file list (#1576)

## 2019-02-14 11.0.1308.0 beta
* Change: Adds option to check filename conventions (#1549)

## 2019-02-01 11.0.1307.0 beta
* Change: Removed unused test window (#1560)

## 2019-01-18 11.0.1306.0 beta
* Change: Update included KeymanWeb to 11.0.206 (#1537)

## 2019-01-17 11.0.1305.0 beta
* Change: Allow the "display underlying" flag to be set for each platform (#1539)

## 2019-01-15 11.0.1304.0 beta
* Change: Tidy up ambiguities in user interface in touch layout editor (#1534)

## 2019-01-15 11.0.1303.0 beta
* No changes to Keyman Developer

## 2019-01-10 11.0.1302.0 beta
* Change: Update included KeymanWeb to 11.0.205

## 2019-01-07 11.0.1301.0 beta
* Bug fix: Developer does not open a new project after it is created (#1499)
* Bug fix: Developer does not enable Install button in Package Editor after compile (#1498)
* Bug fix: Developer would sometimes ask for ethnologue.txt on upgrade (#1481)
* Change: Options dialog Editor tab layout polished (#1482)

## 2019-01-02 11.0.1300.0 beta
* Initial beta release of Keyman Developer 11
* [Pull Requests](https://github.com/keymanapp/keyman/pulls?utf8=%E2%9C%93&q=is%3Apr+merged%3A2018-07-01..2019-01-01+label%3Adeveloper+-label%3Acherry-pick+-label%3Astable)

* New Features:
  * New Project from template and Import Keyboard (#1210, #1216, #1240)
  * kmconvert command line utility (#1207)
  * New code editor using open source Monaco component (#1153, #1154, #1155, #1156, #1252, #1274)
  * Web views now use Chromium, not MSHTML (IE) (#1078, #1086, #1435, #1374, #1354, #1248)
  * Support Linux targets (#1239)
  * Added oskbulkrenderer tool for generating sample on screen keyboards (#1428)

* Changes:
  * Tidy up of installer to make future upgrades easier (#1175)
  * Opening or creating a project now closes current editor files (#1242)
  * Projects can now include other related files such as history.md (#1243)
  * Keyman Developer now treats files as UTF-8 by default (#1244, #1355)
  * kmcomp now adds language subtag names to keyboard_info files (#1426)
  * kmcomp now supports `-add-help-link` parameter when bulding .keyboard_info files (#1346)
  * Refactored how keyboard_info metadata is generated (#1158)
  * Improved performance of web server (#1433)
  * Current project is now shown in title bar (#1369)
  * Tweaked setup user interface and structure (#1098, #1175, #1178, #1245, #1238)

* Bug Fixes:
  * Support for display (avoiding crash) when loading large icons (#1416)
  * Importing .kvks into .keyman-touch-layout no longer uses incorrect layer names for some rare modifiers (#1415)
  * Various bug fixes for touch layout editor (#1414, #1405)
  * Various bug fixes and regressions for project view (#1368, #1247, #1241, #1228, #1157)
  * Fixed surrogate pair support in some debugger status views (#1246)

## 2018-11-28 10.0.1206 stable
* Add parameter `-add-help-link` to kmcomp (#1346)

## 2018-11-07 10.0.1205 stable
* Mitigation for issues with installation under certain languages in Windows 10 1803 or later (#1299)

## 2018-09-28 10.0.1204 stable
* Fix crash in Keyman Developer package editor when a compiled .js keyboard is missing (#1224)

## 2018-09-12 10.0.1202 stable
* Refactor how keyboard_info metadata is generated (#1174)

## 2018-07-06 10.0.1201 stable
* No changes to Keyman Developer (update to KeymanWeb script)

## 2018-06-28 10.0.1200 stable
* 10.0 stable release

## 2018-06-27 10.0.1113.0 beta
* No changes to Keyman Developer (update to KeymanWeb)

## 2018-06-26 10.0.1112.0 beta
* Keyman Developer no longer crashes if a .kpj.user file is deleted while in use (#1017)

## 2018-06-21 10.0.1111.0 beta
* No changes to Keyman Developer (update to KeymanWeb)

## 2018-06-20 10.0.1110.0 beta
* Script subtags are now appended for more scripts in the Keyboard languages dialog (#1006)
* KeymanWeb 10.0 compiler now computes indexes correctly when deadkey and any used in a secondary group (#1008)

## 2018-06-19 10.0.1109.0 beta
* No changes to Keyman Developer

## 2018-06-15 10.0.1108.0 beta
* No changes to Keyman Developer

## 2018-06-13 10.0.1107.0 beta
* Add Unicode 11.0 characters

## 2018-06-12 10.0.1106.0 beta
* No changes to Keyman Developer

## 2018-06-11 10.0.1105.0 beta
* No changes to Keyman Developer

## 2018-06-09 10.0.1104.0 beta
* No changes to Keyman Developer

## 2018-06-07 10.0.1103.0 beta
* No changes to Keyman Developer

## 2018-06-05 10.0.1102.0 beta
* Improved crash reporting stability (#940)

## 2018-06-03 10.0.1101.0 beta
* Open Packages Page now opens the browser in Package Editor (#926)
* Source editor no longer left-trims comments (#925)

## 2018-06-01 10.0.1100.0 beta
* No changes to Keyman Developer

## 2018-05-31 10.0.1099.0 beta
* No changes to Keyman Developer

## 2018-05-30 10.0.1098.0 beta
* Validate and lookup language names automatically in package editor (#911)
* Feature: add .kmp download links from debug web server (#910)

## 2018-05-29 10.0.1097.0 beta
* Prevent a crash when attempting to load an invalid project file (#909)
* Hide debug status panel in Test Mode (#908)

## 2018-05-28 10.0.1096.0 beta
* Fix for crash in regression testing restart (#907)

## 2018-05-28 10.0.1095.0 beta
* Renames touch layout extension from -layout.js to .keyman-touch-layout (#897)

## 2018-05-26 10.0.1094.0 beta
* Check that build succeeded before attempting to start debugger (#900)

## 2018-05-25 10.0.1093.0 beta
* Make longpress slash darker in touch layout editor (#898)

## 2018-05-22 10.0.1092.0 beta
* No changes to Keyman Developer

## 2018-05-17 10.0.1091.0 beta
* No changes to Keyman Developer

## 2018-05-11 10.0.1090.0 beta
* Fixed missing icons in project view (#864)

## 2018-05-11 10.0.1087.0 beta
* Opening an editor by double-clicking a message in message window can crash Developer (#857)

## 2018-05-09 10.0.1086.0 beta
* No changes to Keyman Developer (KeymanWeb updated)

## 2018-05-08 10.0.1085.0 beta
* No changes to Keyman Developer

## 2018-05-08 10.0.1084.0 beta
* No changes to Keyman Developer

## 2018-05-08 10.0.1083.0 beta
* No changes to Keyman Developer

## 2018-05-08 10.0.1082.0 beta
* Fixes support for 'beep' statements in keyboard stores when compiling for web or mobile targets (#733)

## 2018-05-07 10.0.1081.0 beta
* No changes to Keyman Developer

## 2018-05-07 10.0.1080.0 beta
* No changes to Keyman Developer

## 2018-05-07 10.0.1079.0 beta
* No changes to Keyman Developer

## 2018-05-04 10.0.1078.0 beta
* No changes to Keyman Developer

## 2018-05-04 10.0.1077.0 beta
* Correctly show the messages window after a compile (#822)

## 2018-05-04 10.0.1076.0 beta
* Don't create a blank project on 'opening' a project, either on startup or via menu (#815)
* Scroll text editor cursor into view after undo (#821)

## 2018-05-04 10.0.1075.0 beta
* Ensure that compiled visual keyboard associates with correct base keyboard (#817)

## 2018-05-03 10.0.1074.0 beta
* Restrict modifier options to a small set by default in touch layout editor (#810)

## 2018-05-03 10.0.1073.0 beta
* Checking for online update when it is already running in background can crash Developer (#813)
* Avoid crash if online update already running (#814)

## 2018-05-03 10.0.1072.0 beta
* Touch layout editor no longer leaves broken JSON when deleting or modifying some keys (#811)

## 2018-05-03 10.0.1071.0 beta
* Special keys imported from a visual keyboard into a touch layout now display correctly (#812)

## 2018-04-30 10.0.1070.0 beta
* BCP 47 picker in package editor now does name lookups and constrains codes as required by target operating systems (#746, #766)

## 2018-04-30 10.0.1066.0 beta
* Fixed broken test for valid match/nomatch output (#793)

## 2018-04-27 10.0.1061.0 beta
* Fixed broken context help (#779)

## 2018-04-25 10.0.1060.0 beta
* No changes in Keyman Developer (updated KeymanWeb)

## 2018-04-25 10.0.1059.0 beta
* No changes in Keyman Developer (updated KeymanWeb)

## 2018-04-25 10.0.1058.0 beta
* No changes in Keyman Developer

## 2018-04-12 10.0.1057.0 beta
* No changes in Keyman Developer

## 2018-03-31 10.0.1056.0 beta
* Web compiler was not escaping quote character in v10.0 keyboards (#719)

## 2018-03-22 10.0.1055.0 beta
* No changes in Keyman Developer

## 2018-03-22 10.0.1054.0 beta
* Initial beta release of Keyman Developer 10

## 10.0 alpha
* Keyman Developer moved to open source (#121)
* Keyman Developer now supports BCP 47 tags throughout (#543)
* KeymanWeb is now continuously integrated with Developer, ensuring that each update uses the most current version possible (#122)
  - Additional KeymanWeb compatibility fixes (#349)
* Keyman Developer now connects only to *api.keyman.com* and *keyman.com* for online tools (#653)

### Compilers
* Keyman Developer compiler now generates keyboards that distinguish left and right ctrl/alt for web (#313)
* Packages can now include .js files for deployment to iOS and Android (#461)
* The keyboard compiler now generates .js files that do not include version numbers in the filename (#528)
* The keyboard compiler now supports treating warnings as errors for packages and web keyboards (#620, #662, #665)
* Web keyboard compiler now fully supports all deadkey scenarios (#627)
* Keyboard compiler now compiles .kvks to .kvk (#536)

### Editors and debuggers
* Keyman Developer visual editors now support keyboards that distinguish left and right ctrl/alt for web/mobile targets (#342)
* Web debugger now shows character codes above the text editor (#573)
* Visual keyboard files are now saved by default in .kvks XML format to make version control simpler (#536)

### Language
* The `&version` store is now optional and the compiler will determine and report on the minimum version required if it is not present (#334)
* `T_` keys in mnemonic layouts are now better supported in touch keyboards (#660)

### Tools
* Added support for processing `.keyboard_info` files to command line compiler (#331)



## 9.0.523 stable
* Fix: When a longpress popup is being edited, selecting another primary key can copy the details to that key's popup (additional scenario, I4926)
* Update: Updated KeymanWeb to latest build 408

## 9.0.519 stable
* Fix: When a longpress popup is being edited, selecting another primary key can copy the details to that key's popup (I4926)
* Fix: If 'find char under cursor automatically' is on, OSK editor opens charmap if it is closed (I4927)
* Fix: Keyman 9 product installers should test for XP or Vista (I4934)
* Fix: Redraw not reliably working in text editor (I4962)
* Fix: Importing a KMN into a KVK does not work if includecodes are in the keyboard (I4979)
* Fix: Keyboard fonts dialog has incorrect tab order (I4980)
* Fix: Character Map is being updated even when not visible (I4981)
* Fix: Defined character constants cannot be referenced correctly in other stores (I4982)
* Fix: Starting a subprocess can fail due to constant buffer for CreateProcessW (I4983)

## 9.0.518 stable
* Fixed: Compiler does not warn on an index() statement that has an offset one past the key (I4914)
* Improved: Text editor refresh is now faster after fix for I4870 (I4918)

## 9.0.517 stable
* Fixed: Blank font filename entry in JSON metadata UI editor crashes on save [CrashID:tike.exe_9.0.516.0_009CD793_EAssertionFailed] (I4878)

## 9.0.516 stable
* Fixed: Keyman Developer crashes when starting regression test [CrashID:tike.exe_9.0.511.0_0058BC63_EInvalidOperation] (I4839)
* Fixed: Editor does not always refresh immediately with new theming (I4870)
* Fixed: OSK font and Touch Layout font should be the same in Developer (I4872)
* Fixed: Keyman Configuration test windows do not always display correctly (I4874)
* Fixed: RTL flag is not mapped in the JSON editor (I4875)
* Fixed: Default "eng" language should be added if missing during debug to JSON (I4876)
* Fixed: JSON format is inconsistent with documentation (I4877)
* Added: "Treat hints and warnings as errors" option to compiler (I4865)
* Added: "Warn on deprecated features" option to compiler (I4866)
* Added: "Test for code after use()" warning to compiler (I4867)
* Added: Branding editor needs smoother interactions with test window (I4873)

## 9.0.515 stable
* Added: Dynamically refresh Branding Pack UI Test window as edits happen (I4855)
* Fixed: Support view of particular pages of Keyman Configuration and missing pages in KCT Test (I4856)
* Fixed: Allow edit of dtd files in kct editor (I4857)
* Fixed: Asset files not always upgrading in Keyman Developer (I4858)

## 9.0.514 stable
* Added: New File dialog now creates folders automatically (I4852)
* Fixed: Inconsistent display of panels through Developer (I4851)

## 9.0.513 stable
* Fixed: Backspace doesn't always work in the keyboard debugger (I4838)

## 9.0.512 stable
* Added: Update KeymanWeb to build 403 (I4837)
* Added: Context-sensitive help missing V8 and V9 keywords (I4840)
* Added: Restructure version 9 developer help (I4841)
* Fixed: Ctrl+N, Ctrl+O not working in Developer Project view (I2986)
* Fixed: Compiler does not recognise baselayout, layer or platform at the start of a line (I4784)
* Fixed: Character Identifier cells are too narrow for entire U+xxxxxx caption (I4832)
* Fixed: Character Identifier blank font grid needs formatting (I4834)
* Fixed: Project window needs Keyman 9 icons (I4835)
* Fixed: Character Map and Character Identifier don't match tokens at start of line (I4842)
* Fixed: Delete key doesn't work in the keyboard debugger (I4845)
* Fixed: Code editor does not get focus automatically when file is loaded (I4847)

## 9.0.511 stable
* Added: Refresh Keyman Developer look and feel for release (I4796)
* Added: Split Path and Name boxes in New File dialogs (I4798)
* Added: Add Character Identifier to Keyman Developer (I4807)
* Added: Add character preview to debug window (I4808)
* Added: Track keystrokes in debug status form (I4809)
* Added: Add Restart Debugger button to debug status window (I4815)
* Added: Note in compile log if symbols are included in build (I4823)
* Added: Add Unicode 8.0.0 to Keyman Developer 9 (I4829)
* Fixed: Convert to Characters tool is inconsistent (I4797)
* Fixed: Preview keys are wrong colour in Developer (I4799)
* Fixed: Targets box overlaps name box in keyboard editor (I4810)
* Fixed: Hide JSON metadata tab for desktop keyboards (I4811)
* Fixed: Tab order in Details page for Keyboard Editor is incorrect (I4812)
* Fixed: Keyboard preview background colour is incorrect (I4813)
* Fixed: Image preview in package editor doesn't refresh after changes (I4814)
* Fixed: Tidy up display of key in debug status window (I4816)
* Fixed: Regression test buttons have incorrect labels (I4817)
* Fixed: Remove obsolete files from Keyman Developer source (I4818)
* Fixed: Keyman Developer home page in About dialog is incorrect (I4819)
* Fixed: Keyboard fonts dialog box has incorrect control types (I4820)
* Fixed: Update icons for version 9.0 in New File dialog (I4821)
* Fixed: Form sizes are incorrect with new theming (I4822)
* Fixed: Fonts don't always load correctly in KeymanWeb test page (I4824)
* Fixed: Make kmcomp command line details consistent (I4825)
* Fixed: Navigation keys don't work in debugger (I4826)
* Fixed: Key down debug events are not always processed correctly (I4827)
* Fixed: Font identifier miscalculates percentages when supplementary plane characters in string (I4828)

## 9.0.510 stable
* Keyboard debugger does not always activate profile correctly (I4767)
* Add "open in code view" default option for keyboards (I4751)
* Opening a keyboard externally can open it multiple times (I4749)
* V9.0 - Enable SHIFT+ESC to pause debugger with TSF (I4033)

## 9.0.509 stable
* Package compiler (buildpkg) needs to specify username and password on command line (I4763)
* Buildpkg needs to support different paths for msi and kmp files (I4764)
* Add "open in code view" default option for keyboards (I4751)
* Double-click on message does not find source line since build 500 (I4765)
* EthnologueCode system store does not correlate to control on first page of wizard for messages (I4766)
* Keyboard debugger does not always activate profile correctly (I4767)
* Opening a keyboard externally can open it multiple times (I4749)
* KeymanWeb key is no longer required for debugger in Keyman Developer (I4768)
* Keyman Developer missing keymanweb-osk.ttf from layoutbuilder install (I4747)
* Command line package compiler should trap exceptions and report rather than crashing (I4769)
* Product compiler does not create output path if required (I4756)
* Add "open in code view" default option for keyboards (I4751)
* If kmcmpdll.dll does not exist in debug path, try default paths (I4770)
* Update regressiontest app for Engine and Developer 9.0 (I4771)

## 9.0.508 stable
* Fixed: Project files need to build package installers (I4734)
* Added: Clean and Build single file commands to project (I4735)
* Fixed: Product files don't include version in output filename in project (I4736)
* Fixed: Clean package should also clean installer (I4737)
* Fixed: Product compiler crashes with stack overflow in build 507 (I4738)
* Fixed: Don't show "keep in touch" for non-keyman products (I4740)
* Fixed: Package installer compiler references wrong path for compiled package file (I4741)
* Fixed: Product compiler does not save .msi or .pxx into project output folder (I4743)
* Fixed: Keyman Developer 9.0 fails to upgrade from Developer 8.0 cleanly (I4744)

## 9.0.505 stable
* Fixed: Crash when developer tries Upload to Tavultesoft and internet connection is down [CrashID:tike.exe_9.0.504.0_0068E2DC_ESOAPHTTPException] (I4726)
* Fixed: Changing font while touch layout editor in Code mode results in broken \ rules (I4727)
* Fixed: Saving a keyboard with a locked feature file causes Developer to crash [CrashID:tike.exe_9.0.504.0_0045876A_EFCreateError] (I4728)
* Fixed: If you attempt to load a non-XML file as a project, it silently fails and overwrites the file (I4729)
* Fixed: Loading a kvk file in a keyboard, where content is invalid, crashes developer [CrashID:tike.exe_9.0.504.0_0078D23F_EVisualKeyboardLoader] (I4730)

## 9.0.504 stable
* Fixed: Project display crashes if project render output file is locked [CrashID:tike.exe_9.0.489.0_0045876A_EFCreateError] (I4654)
* Fixed: Developer crashes when changing font settings and in code view for touch layout if not on first line [CrashID:tike.exe_9.0.487.0_0069BE51_ERangeError] (I4655)
* Fixed: Loading a non-project file as a project crashes Developer [CrashID:tike.exe_9.0.497.0_00813E09_EProjectLoader] (I4703)
* Fixed: Compiling a standalone keyboard crashes Developer [CrashID:tike.exe_9.0.503.0_00A4316C_EAccessViolation] (I4720)
* Fixed: Developer crashes if a file is in use and a reload is attempted (I4721)
* Fixed: Keyboard uploads fail due to incorrect server name (I4722)
* Fixed: Switching from source tab to design tab in layout fails to refresh the layout (I4723)
* Fixed: Compiler generates warnings for JSON files if output path is source path (I4724)

## 9.0.502 stable
* Project no longer crashes if file parameters change during build (I4710)
* Closing a modified package no longer crashes Developer (I4708)

## 9.0.501 stable
* kmcomp no longer modifies project files during a build (I4709)

## 9.0.500 stable
* Add silent and warning-as-error parameters to kmcomp (I4706)
* Add clean target to kmcomp (I4707)

## 9.0.499 stable
* Add KeymanDeveloperPath environment variable to installer (I4705)

## 9.0.498 stable
* Project files should be formatted XML (I4704)

## 9.0.497 stable
* section should be in project .user file (I4700)
* If version is not specified in keyboard file, it gets blank instead of 1.0 in kmcomp .kpj (I4701)
* Package actions crash if package not part of a project [CrashID:tike.exe_9.0.496.0_008033BD_EAccessViolation] (I4702)

## 9.0.496 stable
* Remove VCL dependency for mrulist (I4697)
* Split project and user preferences files (I4698)
* Compile .kpj files from kmcomp (I4699)
* Split UI actions from non-UI actions in projects (I4694)
* Debugger needs to use project file filename not internal name (I4695)
* Refactor compile into project file action (I4686)
* Split project UI actions into separate classes (I4687)
* Add build path to project settings (I4688)
* Redesign package editor as left tabbed (I4689)
* Pull keyboard version into package version when adding a keyboard (I4690)
* Always save project automatically (I4691)
* Add Clean as project action (I4692)
* Fix crash when creating left tabbed page control without images (I4693)

## 9.0.495 stable
* Move Developer help to online only (I4677)
* Fixup Ctrl+PgUp, Ctrl+PgDn, Alt+Left, Alt+Right hotkeys (I4678)
* Remember focus for active editor when swapping editors (I4679)
* Ctrl+S often activates the "select key" dialog in editor (I4680)
* mnemoniclayout store should be enough to block design view (I4681)
* Installing a keyboard with an OSK from Developer fails to install the OSK (I4682)

## 9.0.489 stable
* WiX file generator in Keyman Developer was failing due to security (I4643)

## 9.0.488 stable
* Debug host keyboard did not correctly map through some Keyman keyboard keys (I4156)

## 9.0.485 stable
* Keyman Developer failed to import kvk xml file (I4619)

## 9.0.484 stable
* context statement in output could fail in some situations in KeymanWeb compiler (I4611)

## 9.0.476 stable
* The text editor in the keyboard wizard is no longer blanked in some circumstances when switching tabs (I4557)
* Keyboard parser no longer forces keyboard version to 9.0 (I4558)
* Debugger development - disable debug tip when stopping debugging (I4331)

## 9.0.475 stable
* JSON search needs to do cleanname on the keyboard filename to find candidates (I4508)

## 9.0.474 stable
* Consolidate the compile action into single command (I4504)
* Add JSON metadata editor to keyboard wizard (I4505)
* Add command to send email with targets (I4506)
* Move tab close button onto tabs (I4507)

## 9.0.473 stable
* Add kmw_embedcss to feature support in Developer (I4369)
* Tab and Dismiss keys have been removed from touch templates (I4475)
* Added source version of KMW to Keyman Developer (I4476)

## 9.0.472 stable
* The dismiss keyboard and tab buttons should not be required by Keyman Developer now (I4447)
* Sometimes when saving, the list of &WINDOWSLANGUAGES is doubled (I4329)
* Standard fonts should not be downloaded to devices in test window (I4448)
* Font CSS responds as ISO-8859-1 instead of UTF-8 (I4449)
* Layout Builder is missing OSK special keys font in some situations (I4450)
* Touch layout editor polish (I4330)

## 9.0.471 stable
* JSON hosting for installing keyboard into native app has wrong extension (I4437)
* Keyboard debugger does not show button control in desktop mode (I4438)
* If more than one language listed for a keyboard, the JSON file becomes invalid (I4440)

## 9.0.469 stable
* Download Keyboard dialog does not display correctly (I4414)
* OSK does not show underlying characters if base keyboard is not loaded (I4415)

## 9.0.467 stable
* Manual Activate dialog is misformatted (I4408)
* Wrong font selected in keyboard debugger touch layout (I4409)
* Metrics should be visible in touch layout editor (I4410)
* Character map allows Ctrl+Click to insert character (I4411)
* Wrong font selected in keyboard debugger touch layout (I4409)

## 9.0.463 stable
* Line number comments are no longer incorrectly added to non-debug builds (I4384)

## 9.0.460 stable
* Web and touch keyboards now support custom stylesheets with &kmw_embedcss (I4368)
* Line number comments are now included in generated Javascript when compiling with debug (I4373)

## 9.0.458 stable
* Added: Require Windows 7 or later for install (I4313)

## 9.0.454 stable
* Fixed: Compiling a product installer failed with xsl security error (I3734)

## 9.0.453 stable
* Fixed: Clicking Remove Feature when no feature selected crashes [CrashID:tike.exe_9.0.449.0_00987F63_EAccessViolation] (I4247)

## 9.0.452 stable
* Fixed: File format dropdown should be disabled in project view (I3733)
* Fixed: Crash opening project in read-only location [CrashID:tike.exe_9.0.443.0_005E202D_EOleException] (I4212)
* Added: Added BCP-47 language codes to unicodedata (I4257)
* Fixed: Keyboard font dialog crashed if in text editor view (I4258)
* Added: Generate a .json file when compiling keyboard for web (I4259)
* Added: Add link to install keyboard file into native app into debug web (I4260)
* Added: Build 357 of KeymanWeb into Developer (I4261)
* Fixed: Compile to web and test fails when keyboard version is not 1.0 (I4263)
* Fixed: If Keyman Developer is running, double clicking a file in Explorer doesn't open it (I4264)

## 9.0.449 stable
* Keyboard wizard crashes with missing template-default.js when adding Touch Layout (I4226)

## 9.0.448 stable
* Manifests missing or malformed in some executables (I4205)
* Block U_0000-U_001F and U_0080-U_009F in layout files (I4198)
* adding a subkey array generates an invalid "?" id (I4213)
* template-default should be called template-latin (I4217)
* Activate/Purchase dialogs are incomplete and the Buy Modules button doesn't work (I4090)

## 9.0.447 stable
* Add Windows compatibility values to all manifests (I4194)

## 9.0.443 stable
* Need keyboard version control in Keyman Developer Wizard (I4157)
* Keyboardversion is not compiled into kmw js (I4155)
* keyboardversion is not read by KeymanWeb compiler and applied to filename. (I4154)

## 9.0.442 stable
* Edit platform button still in editor even though it does nothing (Bug) (I4126)
* OSK Import KMX breaks some shift states (Bug) (I4127)
* Edit Platform dialog is deleted but button is still there in touch layout editor (Bug) (I4129)
* Build php help files to help.keyman.com (Tweak) (I4135)
* Add keyboard version information to Keyman Configuration (Tweak) (I4136)
* Don't prompt to sort out L/R shift on save of keyboard (Bug) (I4137)
* If the KVK is removed from the keyboard, it can still be imported into the touch layout until the file is closed (Bug) (I4138)
* Compress layout file when compiling to KMW (Tweak) (I4139)
* Add keyboard version information to keyboards (Develop) (I4140)
* Warn when unusable key ids are used (Develop) (I4141)
* Validate key ids are in an acceptable format (Develop) (I4142)
* Support modifier layers of KVK when importing a KMX (Bug) (I4143)
* When character is dropped or double-clicked to insert into html text field, no modified event is triggered (Bug) (I4144)
* Deadkeys are corrupted by KeyboardParser (Bug) (I4145)
* When importing OSK into touch layout, unused layers are populated with base layer (Bug) (I4146)
* If a touch layout is added to a keyboard, it doesn't get saved until the tab is visited (Bug) (I4147)
* Touch layout editor is missing a number of standard key names (Bug) (I4148)
* If a touch layout key has no id, the builder fails to load the json (Bug) (I4149)
* Double clicking on a key should activate its 'nextlayer' in touch layout editor (Tweak) (I4150)
* key id is not saved until field is blurred in touch layout editor (Bug) (I4151)
* Resizing a key with the grab handle causes other keys to overlap during the resize operation (Bug) (I4152)
* Pressing and releasing Ctrl in touch layout editor should allow selection of standard keys a-la layout editor (Tweak) (I4153)

## 9.0.441 stable
* Double-click on Character Map when in Touch Layout Editor crashes TIKE (I4110)
* Double-click in char map when no input element focused in touch layout editor crashes TIKE (I4111)
* Installer links should be to keyman.com (I4115)
* KMW compiler should warn when extended shift flags are used (I4118)
* KMW compiler should only warn unassociated keys that are not special keys (I4119)
* Remove platform properties from touch layout editor as font details are now accessible via Keyboard|Font menu (I4120)
* Rename 'subkey' to 'touch+hold popup' (I4121)
* traditional touch template has K_SEMICOLON and K_SQUOTE wrongly named key ids (I4122)
* Keyman Developer installer should required Vista or later (I4123)

## 9.0.440 stable
* Keyman Developer installer icon is still v8.0 style (I4100)
* Touch layout editor still has the font options in its Edit Platform dialog (I4091)

## 9.0.439 stable
* Trace compile errors in subfiles in Keyman Developer (I4081)
* Make details tab scrollable with mouse wheel (I4082)
* When errors encountered in JSON layout file, locate the error in the source view (I4083)
* Remove old font selection controls from wizard (I4085)
* About should be version 9.0 style (I4086)
* Splash should be version 9.0 style (I4084)
* KeymanWeb compiler does not clear messages before starting (I4087)

## 9.0.438 stable
* Keyman Developer Keyboard Font dialog helpful to reduce font confusion (I4057)
* Touch Layout Import OSK fails with weird error if OSK is missing (I4058)
* If OSK is not saved, then changes do not flow through in Touch Layout Import (I4059)
* KeymanWeb compiler should validate the layout file (I4060)
* KeymanWeb compiler needs defined codes for some errors (I4061)
* Touch Layout platforms do not allow font size specification (I4062)
* Web Debugger needs to embed fonts for OSK and text area (I4063)
* Touch layout editor does not apply fonts consistently to keys (I4064)
* Deleting a touch layout layer leaves a "null" entry in the layout file (I4065)

## 9.0.437 stable
* Layout editor needs to refresh character map (I4046)
* TIKE shows an error if you try to save before viewing the touch layout tab (I4047)
* Various fixes and features for touch layout editor: (I4049)
    * Deselecting main key does not disable subkey or clear other controls
    * Drag+drop not sticking
    * Drag+drop not allowing drop at end
    * Key height not right
    * Not showing editor in line for key
    * Not showing key code on key
    * No wedges showing
    * No delete icon showing
    * Deselecting does not disable controls
    * If inserting or removing key padding, the key display does not refresh correctly
    * 'Label:' label should be removed
    * Key id does not update on keyboard view when changed
* Character map does not show currently selected char from keyboard view (I4049)
* Button UI not displaying in KMDev KMW test window (I4048)

## 9.0.436 stable
* Add support for Redo to Keyman Developer actions (I4032)
* Enable SHIFT+ESC to pause debugger with TSF (I4033)
* Restructure keyboard wizard for source views and features (I4034)
* Parsing of UTF-8 in JSON layout file crashes TIKE (I4035)
* Keyboard Debug HTTP Host should be thread safe (I4036)
* Keyboard HTTP debugger sometimes caches old keyboards (I4037)

## 9.0.434 stable
* Redesign Keyboard Wizard to integrate V9 features (I4021)
* Rework Import KMX to work with V9.0 Debug Host Keyboard (I4022)
* Touch Layout Editor crashes with file in use sometimes (I4023)
* Installer is missing jquery support files for Configuration UI (I4011)

# Legacy "What's New" sections

## 8.0.0 stable

### Fully integrated source editors
* Changes to source are instantly reflected in the Design Editor and vice-versa
* Keyboard, Package and Distribution editors all have Source tabs
* On Screen Keyboard Editor integrated into Keyboard Editor
* Keyboard, Package and Distribution editors feature integrated upload to Tavultesoft

### Much improved character map
* Displays all characters from Unicode 5.0
* Filter characters by range, name, font and more
* Exceptionally clear display with ClearType and font linking
* Resizeable character cells

### Tightly integrated project
* Project provides a clear step-by-step process for developing keyboard solutions
* Links in the project take you to tutorials, help, and more

### User Interface Redesign
* Much clearer user interface - every screen revisited and polished

### Language Changes
* 'notany' Statement - provides the opposite of the 'any' statement
* Maximum store or rule length now 4095 characters, up from 255
* New system stores for KeymanWeb and On Screen Keyboard links

### Keyboard Icons
* Keyboard icons support 256 colour and transparency

### Tutorials
* New tutorials for Packages, Branding and Distribution

### KeymanWeb Pack
* KeymanWeb compiler and design tools integrated into Keyboard Editor
* KeymanWeb keyboard test window

### Branding Pack
* Create your own product using the Branding Pack and the Keyman Engine
* Fully customisable user interface for your product with Branding Editor
* Distribution Editor to create a Windows Installer .msi for your product
* Customer Relationship Manager
    * manage your customers and their licences from your desktop
    * fully integrated with the Tavultesoft Online Store
* Simple integration of your product into Tavultesoft Online Store for instant online sales
* Integration with WiX provides modern installation techniques for product installers
* Keyman Engine separated from Keyman Desktop to enable straightforward use in your own product

### Modern installation and operating system support
* Modern Windows Installer for straightforward deployment
* Windows Vista support
* Unicode support throughout Keyman Developer
* Automated online updates