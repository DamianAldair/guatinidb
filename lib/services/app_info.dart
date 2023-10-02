import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static final AppInfo _instance = AppInfo._();
  AppInfo._();
  factory AppInfo() => _instance;

  late PackageInfo _info;

  Future<void> init() async => _info = await PackageInfo.fromPlatform();

  String get version => _info.version;
}
