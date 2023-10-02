import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/services/app_info.dart';
import 'package:guatinidb/services/formats.dart';
import 'package:path/path.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).about),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          _background(),
          _content(context),
        ],
      ),
    );
  }

  Container _background() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(0, 0, 0, 0),
            Color.fromARGB(200, 0, 0, 0),
          ],
        ),
      ),
    );
  }

  ListView _content(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        const SizedBox(height: 30.0),
        Center(
          child: Text(
            '${AppLocalizations.of(context).informatonProvider}:',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            left: 20.0,
            right: 20.0,
            bottom: 15.0,
          ),
          child: Center(
            child: FutureBuilder(
              future: rootBundle.loadString(join('assets', 'db', 'provider')),
              builder: (_, AsyncSnapshot<String> snapshot) {
                final provider = snapshot.connectionState == ConnectionState.waiting
                    ? ''
                    : snapshot.data ?? AppLocalizations.of(context).unavailable;
                return Text(
                  provider,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                );
              },
            ),
          ),
        ),
        FutureBuilder(
          future: Future.any(List.generate(providerImageFormats.length, (i) {
            return rootBundle.load(join('assets', 'db', 'provider.${providerImageFormats[i]}'));
          })),
          builder: (_, AsyncSnapshot<ByteData> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }
            final data = snapshot.data!.buffer.asUint8List();
            return SizedBox(
              width: size.width * 0.35,
              height: size.width * 0.35,
              child: Image.memory(data),
            );
          },
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              '${AppLocalizations.of(context).developedBy}:\n${AppInfo().getDevelopers(context)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(150, 255, 255, 255),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.1,
          height: size.width * 0.15,
          child: Image.asset('assets/images/logo_cujae.png'),
        ),
        Text(
          '${AppInfo().getDepartment(context)}\n\n${AppInfo().getOrganization(context)}\n\n${AppInfo().organizationLite}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(150, 255, 255, 255),
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
