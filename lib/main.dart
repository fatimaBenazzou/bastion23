import 'package:bastion23/Screens/layout_screen.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      // darkTheme: ThemeConfig().,
      home:  LayoutScreen(),
    );
  }
}
