import 'package:flutter/material.dart';
import 'package:my_first_app/constants/app-images.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logo')),
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 160,
        ),
      ),
    );
  }
}

