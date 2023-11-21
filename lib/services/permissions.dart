import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart';

abstract class StoragePermission {
  static Future<bool> check({
    required BuildContext context,
    void Function()? function,
  }) async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    final permission = deviceInfo.version.sdkInt < 30 ? Permission.storage : Permission.manageExternalStorage;
    final status = await permission.request();
    if (status.isGranted) {
      function?.call();
      return true;
    } else {
      openAppSettings().then((opened) {
        if (!opened) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).cannotOpenSettings)),
          );
        }
      });
      return false;
    }
  }
}
