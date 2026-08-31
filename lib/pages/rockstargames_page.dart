import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/constants/app-images.dart';

class Rockstargames extends StatelessWidget {
  const Rockstargames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rockstar Games SVG')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            AppImages.Rockstar,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(Black),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
