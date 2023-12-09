import 'package:bastion23/Screens/onboarding_screen.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/icons/Logo.png',
        ),
      ),
      body: OnboardingScreen()
    );
  }
}
