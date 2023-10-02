import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/browser_page.dart';
import 'package:guatinidb/services/app_info.dart';
import 'package:guatinidb/services/permissions.dart';
import 'package:guatinidb/widgets/logo.dart';
import 'package:path/path.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).dataSource),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const GuatiniDbLogo(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    AppLocalizations.of(context).dataSourceInformation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                Text('${AppLocalizations.of(context).dsVersion}: ${AppInfo().version}'),
                FutureBuilder(
                  future: rootBundle.loadString(join('assets', 'db', 'language')),
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return const SizedBox();
                    }
                    final lang = snapshot.data!.split('\n').first.trim();
                    return Text('${AppLocalizations.of(context).dsLanguage}: $lang');
                  },
                ),
                FutureBuilder(
                  future: rootBundle.loadString(join('assets', 'db', 'topic')),
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return const SizedBox();
                    }
                    final topic = snapshot.data!.trim();
                    return Text('${AppLocalizations.of(context).dsTopic}: $topic');
                  },
                ),
                const SizedBox(height: 100.00),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.folder_open_rounded),
        label: Text(AppLocalizations.of(context).selectPath),
        onPressed: () => Permissions.check(
          context: context,
          permission: Permission.storage,
          function: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BrowserPage()),
          ),
        ),
      ),
    );
  }
}
