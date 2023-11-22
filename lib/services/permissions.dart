import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart';

abstract class StoragePermission {
  static Future<bool> _requestStoragePermissions() async {
    final storage = await Permission.storage.request();
    PermissionStatus? manageExternalStorage;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    if (storage.isGranted && deviceInfo.version.sdkInt >= 30) {
      manageExternalStorage = await Permission.manageExternalStorage.request();
    }
    if (manageExternalStorage == null) return storage.isGranted;
    return storage.isGranted && manageExternalStorage.isGranted;
  }

  static void check({
    required BuildContext context,
    void Function()? function,
  }) {
    _requestStoragePermissions().then((bool granted) {
      if (granted) {
        function?.call();
      } else {
        openAppSettings().then((bool opened) {
          if (!opened) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context).cannotOpenSettings)),
            );
          }
        });
      }
    });
  }
}
