import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/deploy_page.dart';
import 'package:guatinidb/services/permissions.dart';
import 'package:path/path.dart' as p;

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  String? selected;
  String path = '';

  @override
  Widget build(BuildContext context) {
    List<FileSystemEntity> content = [];
    try {
      content = Directory(path).listSync()
        ..sort((a, b) {
          final aDir = a is Directory;
          final bDir = b is Directory;
          if (aDir && !bDir) {
            return -1;
          } else if (!aDir && bDir) {
            return 1;
          } else {
            return a.path.toLowerCase().compareTo(b.path.toLowerCase());
          }
        });
    } catch (_) {
      path = '';
    }

    return WillPopScope(
      onWillPop: path.isEmpty
          ? () async => true
          : () async {
              final storages = await ExternalPath.getExternalStorageDirectories();
              if (storages.contains(path)) {
                path = '';
              } else {
                List<String> tree = path.split('/');
                tree.removeLast();
                path = p.joinAll(tree);
                if (path[0] != '/') path = '/$path';
              }
              setState(() {});
              return false;
            },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).selectPath),
          centerTitle: true,
        ),
        body: path.isEmpty
            ? FutureBuilder(
                future: ExternalPath.getExternalStorageDirectories(),
                builder: (_, AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Hubo un error al cargar el almacenamiento'),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  final storages = snapshot.data!;
                  return ListView.builder(
                    itemCount: storages.length,
                    itemBuilder: (_, int i) {
                      final storage = storages[i];
                      return ListTile(
                        leading: CircleAvatar(child: icon(storage)),
                        title: Text(storageName(storage)),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => setState(() => path = storage),
                      );
                    },
                  );
                },
              )
            : ListView.builder(
                itemCount: Directory(path).listSync().length,
                itemBuilder: (_, int i) {
                  final dir = content[i];
                  final padding = selected == null || dir != content.last ? 0.0 : 100.0;
                  if (dir is! Directory) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: padding),
                      child: const SizedBox(),
                    );
                  }
                  final name = p.basename(dir.path);
                  return Padding(
                    padding: EdgeInsets.only(bottom: padding),
                    child: ListTile(
                      leading: const Icon(Icons.folder_rounded),
                      title: Text(name),
                      trailing: Checkbox(
                        value: selected == dir.path,
                        onChanged: (_) => setState(() {
                          if (selected == dir.path) {
                            selected = null;
                          } else {
                            selected = dir.path;
                          }
                        }),
                      ),
                      onTap: () => setState(() => path = p.join(path, name)),
                    ),
                  );
                },
              ),
        bottomNavigationBar: selected == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${AppLocalizations.of(context).selectedPath}: $selected'),
              ),
        floatingActionButton: path.isEmpty || selected == null
            ? null
            : FloatingActionButton.extended(
                icon: const Icon(Icons.save_alt_rounded),
                label: Text(AppLocalizations.of(context).deploy),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => confirmation(context, selected!),
                ),
              ),
      ),
    );
  }

  Icon icon(String path) {
    if (path == '/storage/emulated/0') {
      return const Icon(Icons.phone_android_rounded);
    }
    if (path.startsWith('/storage/') && path.split('/').length == 3) {
      return const Icon(Icons.sd_card_rounded);
    }
    return const Icon(Icons.folder_rounded);
  }

  String storageName(String storage) {
    if (storage == '/storage/emulated/0') {
      return 'Almacenamiento interno';
    }
    if (storage.startsWith('/storage/') && storage.split('/').length == 3) {
      return 'Tarjeta SD (${p.basename(storage)})';
    }
    return '';
  }

  Widget confirmation(BuildContext context, String path) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).warning),
      content: Text(AppLocalizations.of(context).deployConfirmationText),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context).no),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(AppLocalizations.of(context).yes),
          onPressed: () {
            Navigator.pop(context);
            Permissions.check(
              context: context,
              permission: Permission.storage,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DeployPage(path)),
              ),
            );
          },
        ),
      ],
    );
  }
}
