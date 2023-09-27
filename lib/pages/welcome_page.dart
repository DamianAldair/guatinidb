import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guatinidb/pages/info_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
