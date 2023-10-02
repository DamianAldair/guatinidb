import 'package:flutter/material.dart';

class GuatiniDbLogo extends StatelessWidget {
  final double? wigth;

  const GuatiniDbLogo({
    super.key,
    this.wigth,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image.asset(
        'assets/icons/android_icon.png',
        width: wigth ?? MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
