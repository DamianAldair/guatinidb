import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/about_page.dart';
import 'package:guatinidb/pages/info_page.dart';
import 'package:guatinidb/widgets/logo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight),
        child: SafeArea(
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                tooltip: AppLocalizations.of(context).about,
                icon: const Icon(Icons.info_outline_rounded),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GuatiniDbLogo(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 50.0,
                ),
                child: Text(
                  AppLocalizations.of(context).welcomeText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 100.00),
            ],
          ),
        ),
      ),
      floatingActionButton: Transform.flip(
        flipX: true,
        child: FloatingActionButton.extended(
          icon: Transform.flip(
            flipX: true,
            child: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
          label: Transform.flip(
            flipX: true,
            child: Text(AppLocalizations.of(context).next),
          ),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const InfoPage()),
          ),
        ),
      ),
    );
  }
}
