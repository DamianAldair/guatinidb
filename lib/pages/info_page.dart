import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/deploy_page.dart';
import 'package:guatinidb/services/permissions.dart';
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
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/icons/android_icon.png',
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
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
                FutureBuilder(
                  future: rootBundle.loadString(join('assets', 'db', 'version')),
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return const SizedBox();
                    }
                    final version = snapshot.data!.trim();
                    return Text('${AppLocalizations.of(context).dsVersion}: $version');
                  },
                ),
                FutureBuilder(
                  future: rootBundle.loadString(join('assets', 'db', 'language')),
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return const SizedBox();
                    }
                    final lang = snapshot.data!.trim().split('\\\\\\').last;
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
        icon: const Icon(Icons.save_alt_rounded),
        label: Text(AppLocalizations.of(context).deploy),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => confirmation(context),
        ),
      ),
    );
  }

  Widget confirmation(BuildContext context) {
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
                MaterialPageRoute(builder: (_) => const DeployPage()),
              ),
            );
          },
        ),
      ],
    );
  }
}
