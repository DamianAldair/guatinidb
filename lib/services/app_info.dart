import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static final AppInfo _instance = AppInfo._();
  AppInfo._();
  factory AppInfo() => _instance;

  late PackageInfo _info;

  Future<void> init() async => _info = await PackageInfo.fromPlatform();

  String get appName => _info.appName;

  String get version => _info.version;

  String getDevelopers(BuildContext context) => 'Damian Aldair ${AppLocalizations.of(context).and} Daydee Molinet';

  String getDepartment(BuildContext context) => AppLocalizations.of(context).college;

  String getOrganization(BuildContext context) =>
      '${AppLocalizations.of(context).university}\n"José Antonio Echeverría"';

  final String organizationLite = 'CUJAE';
}
