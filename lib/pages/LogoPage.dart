import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logo')),
      body: Center(
        child: Image.asset(
          'assets/images/logo_watchlist.png',
          width: 160,
        ),
      ),
    );
  }
}

