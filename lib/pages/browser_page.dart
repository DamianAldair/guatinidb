import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/deploy_page.dart';
import 'package:guatinidb/services/permissions.dart';
import 'package:guatinidb/widgets/placeholders.dart';
import 'package:path/path.dart' as p;

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  bool showStorageBanner = true;
  String? selected;
  String path = '';

  @override
  Widget build(BuildContext context) {
    List<Directory> content = [];
    try {
      content = Directory(path).listSync().whereType<Directory>().toList()
        ..sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));
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
                List<String> tree = p.split(path);
                tree.removeLast();
                path = p.joinAll(tree);
                if (path[0] != '/') path = '/$path';
              }
              setState(() {});
              return false;
            },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            tooltip: AppLocalizations.of(context).closeExplorer,
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(AppLocalizations.of(context).selectPath),
          centerTitle: true,
          actions: [
            if (path.isNotEmpty)
              IconButton(
                tooltip: AppLocalizations.of(context).levelUp,
                icon: const Icon(Icons.drive_folder_upload_outlined),
                onPressed: () => Navigator.maybePop(context),
              ),
          ],
          bottom: path.isEmpty
              ? null
              : PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Scrollbar(
                      thickness: 1.5,
                      radius: const Radius.circular(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final f in p.split(path)..removeWhere((e) => e == '/' || e == '\\'))
                              Row(
                                children: [
                                  Text(f),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: IconTheme.of(context).color?.withOpacity(0.5),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  return Column(
                    children: [
                      if (showStorageBanner)
                        MaterialBanner(
                          content: Text(AppLocalizations.of(context).androidPathPolicies),
                          actions: [
                            TextButton(
                              child: Text(AppLocalizations.of(context).ok),
                              onPressed: () => setState(() => showStorageBanner = !showStorageBanner),
                            )
                          ],
                        ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: storages.length,
                        itemBuilder: (_, int i) {
                          final storage = storages[i];
                          return ListTile(
                            leading: CircleAvatar(child: icon(storage)),
                            title: Text(storageName(storage)),
                            subtitle: Text(storage),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () => setState(() => path = storage),
                          );
                        },
                      ),
                    ],
                  );
                },
              )
            : content.isEmpty
                ? const EmptyFolderPlaceholder()
                : Scrollbar(
                    radius: const Radius.circular(10.0),
                    child: ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (_, int i) {
                        final dir = content[i];
                        final padding = selected == null || dir != content.last ? 0.0 : 100.0;
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
                  ),
        bottomNavigationBar: selected == null
            ? null
            : MaterialBanner(
                content: Text('${AppLocalizations.of(context).selectedPath}: $selected'),
                actions: [
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context).unselect,
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () => setState(() => selected = null),
                  )
                ],
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
      return 'Tarjeta SD';
    }
    return '';
  }

  Widget confirmation(BuildContext context, String path) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).warning),
      content: Text(
        AppLocalizations.of(context).deployConfirmationText,
        textAlign: TextAlign.justify,
      ),
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
