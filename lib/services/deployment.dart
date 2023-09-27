import 'dart:developer' as dev;
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

abstract class Deployment {
  static ValueNotifier<int> dataSourceDeployment = ValueNotifier(0);
  static const int dataSourceDeploymentTotal = 3;
  static ValueNotifier<int> filesDeployment = ValueNotifier(0);
  static ValueNotifier<int> filesDeploymentTotal = ValueNotifier(1);
  static ValueNotifier<bool> deploying = ValueNotifier(false);
  static ValueNotifier<bool> deploymentDone = ValueNotifier(false);
  static ValueNotifier<bool> error = ValueNotifier(false);

  static Future<void> deploy(String path) async {
    deploying.value = true;
    final dataZip = await rootBundle.load(join('assets', 'db', 'db.zip'));
    dataSourceDeployment.value++;
    final bytesZip = dataZip.buffer.asUint8List(dataZip.offsetInBytes, dataZip.lengthInBytes);
    dataSourceDeployment.value++;
    final archive = ZipDecoder().decodeBytes(bytesZip);
    dataSourceDeployment.value++;
    filesDeploymentTotal.value = archive.length;
    try {
      for (int i = 0; i < archive.length; i++) {
        final a = archive[i];
        final aPath = join(path, a.name);
        if (!a.isFile && !a.isSymbolicLink) {
          await Directory(aPath).create();
        } else {
          await File(aPath).writeAsBytes(a.content as List<int>);
        }
        filesDeployment.value++;
      }
    } catch (e) {
      dev.log(e.toString());
      error.value = true;
    }
    dataSourceDeployment.value = 0;
    filesDeployment.value = 0;
    deploying.value = false;
    deploymentDone.value = true;
  }
}
