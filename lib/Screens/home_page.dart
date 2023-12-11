// import 'package:bastion23/Screens/login_screen.dart';
// import 'package:bastion23/Screens/forgot_password.dart';
import 'package:bastion23/Screens/forgot_password.dart';
import 'package:bastion23/Screens/login_screen.dart';
import 'package:bastion23/Screens/onboarding_screen.dart';
import 'package:bastion23/Screens/register_screen.dart';
import 'package:bastion23/Screens/reset_password.dart';
// import 'package:bastion23/Screens/reset_password.dart';
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
      body: 
      // Padding(
        // padding:  EdgeInsets.only(top: 48),
        // child: 
        OnboardingScreen(),
        // RegisterScreen()
        // LoginScreen()
        // ForgotPassword()
        // ResetPassword()
      // )
    );
  }
}
