import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Deploy the Guatiní data source to your smartphone in the easiest way possible'**
  String get welcomeText;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @dataSource.
  ///
  /// In en, this message translates to:
  /// **'Data source'**
  String get dataSource;

  /// No description provided for @dataSourceInformation.
  ///
  /// In en, this message translates to:
  /// **'Data source information'**
  String get dataSourceInformation;

  /// No description provided for @dsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get dsVersion;

  /// No description provided for @dsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get dsLanguage;

  /// No description provided for @dsTopic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get dsTopic;

  /// No description provided for @deploy.
  ///
  /// In en, this message translates to:
  /// **'Deploy'**
  String get deploy;

  /// No description provided for @deployment.
  ///
  /// In en, this message translates to:
  /// **'Deployment'**
  String get deployment;

  /// No description provided for @deploying.
  ///
  /// In en, this message translates to:
  /// **'Deploying data source'**
  String get deploying;

  /// No description provided for @dbFile.
  ///
  /// In en, this message translates to:
  /// **'DB file'**
  String get dbFile;

  /// No description provided for @mediaFiles.
  ///
  /// In en, this message translates to:
  /// **'Media files'**
  String get mediaFiles;

  /// No description provided for @mapFiles.
  ///
  /// In en, this message translates to:
  /// **'Map files'**
  String get mapFiles;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cannotOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Cannot open the app settings.\nThe requested permission cannot be granted.\nYou need grant the permission manually in the app settings.'**
  String get cannotOpenSettings;

  /// No description provided for @errorLoadingStorages.
  ///
  /// In en, this message translates to:
  /// **'An error occurred loading storage'**
  String get errorLoadingStorages;

  /// No description provided for @processStatus.
  ///
  /// In en, this message translates to:
  /// **'Process status'**
  String get processStatus;

  /// No description provided for @dsDeployed.
  ///
  /// In en, this message translates to:
  /// **'Data source deployed'**
  String get dsDeployed;

  /// No description provided for @dsDecoding.
  ///
  /// In en, this message translates to:
  /// **'Processing data source'**
  String get dsDecoding;

  /// No description provided for @dsFileCopying.
  ///
  /// In en, this message translates to:
  /// **'Copying files'**
  String get dsFileCopying;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @errorDeploying.
  ///
  /// In en, this message translates to:
  /// **'Error copying files.\nIt may due to new Android policies this directory cannot be used. Try selecting another one.'**
  String get errorDeploying;

  /// No description provided for @systemErrorResponse.
  ///
  /// In en, this message translates to:
  /// **'System response:'**
  String get systemErrorResponse;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @deployConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to deploy the data source? The process cannot be interrupted for security and consistency reasons.\n\nPlease note that if a data source already existed in this folder, files with the same name will be overwritten.'**
  String get deployConfirmationText;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @selectPath.
  ///
  /// In en, this message translates to:
  /// **'Choose a folder'**
  String get selectPath;

  /// No description provided for @androidPathPolicies.
  ///
  /// In en, this message translates to:
  /// **'Due to new Android policies, storage paths cannot be used derectly for deployment.'**
  String get androidPathPolicies;

  /// No description provided for @selectedPath.
  ///
  /// In en, this message translates to:
  /// **'Selected path'**
  String get selectedPath;

  /// No description provided for @unselect.
  ///
  /// In en, this message translates to:
  /// **'Unselect'**
  String get unselect;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @closeExplorer.
  ///
  /// In en, this message translates to:
  /// **'Close explorer'**
  String get closeExplorer;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @levelUp.
  ///
  /// In en, this message translates to:
  /// **'Level up'**
  String get levelUp;

  /// No description provided for @noFolders.
  ///
  /// In en, this message translates to:
  /// **'No folders'**
  String get noFolders;

  /// No description provided for @noFoldersIn.
  ///
  /// In en, this message translates to:
  /// **'No folders in'**
  String get noFoldersIn;

  /// No description provided for @informatonProvider.
  ///
  /// In en, this message translates to:
  /// **'Information provider'**
  String get informatonProvider;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by'**
  String get developedBy;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @college.
  ///
  /// In en, this message translates to:
  /// **'School of Computer Engineering'**
  String get college;

  /// No description provided for @university.
  ///
  /// In en, this message translates to:
  /// **'Technological University of Havana'**
  String get university;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
