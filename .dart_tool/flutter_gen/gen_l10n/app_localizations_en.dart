import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeText => 'Deploy the Guatiní data source to your smartphone in the easiest way possible';

  @override
  String get next => 'Next';

  @override
  String get dataSource => 'Data source';

  @override
  String get dataSourceInformation => 'Data source information';

  @override
  String get dsVersion => 'Version';

  @override
  String get dsLanguage => 'Language';

  @override
  String get dsTopic => 'Topic';

  @override
  String get deploy => 'Deploy';

  @override
  String get deployment => 'Deployment';

  @override
  String get deploying => 'Deploying data source';

  @override
  String get dbFile => 'DB file';

  @override
  String get mediaFiles => 'Media files';

  @override
  String get mapFiles => 'Map files';

  @override
  String get cancel => 'Cancel';

  @override
  String get cannotOpenSettings => 'Cannot open the app settings.\nThe requested permission cannot be granted.\nYou need grant the permission manually in the app settings.';

  @override
  String get processStatus => 'Process status';

  @override
  String get dsDeployed => 'Data source deployed';

  @override
  String get dsDecoding => 'Processing data source';

  @override
  String get dsFileCopying => 'Copying files';

  @override
  String get done => 'Done';

  @override
  String get errorDeploying => 'Error copying files.\nIt may due to new Android policies this directory cannot be used. Try selecting another one.';

  @override
  String get warning => 'Warning';

  @override
  String get deployConfirmationText => 'Are you sure you want to deploy the data source? The process cannot be interrupted for security and consistency reasons.\n\nPlease note that if a data source already existed in this folder, files with the same name will be overwritten.';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get ok => 'OK';

  @override
  String get selectPath => 'Choose a folder';

  @override
  String get androidPathPolicies => 'Due to new Android policies, storage paths cannot be used derectly for deployment.';

  @override
  String get selectedPath => 'Selected path';

  @override
  String get unselect => 'Unselect';

  @override
  String get about => 'About';

  @override
  String get closeExplorer => 'Close explorer';

  @override
  String get close => 'Close';

  @override
  String get levelUp => 'Level up';

  @override
  String get noFolders => 'No folders';

  @override
  String get noFoldersIn => 'No folders in';
}
