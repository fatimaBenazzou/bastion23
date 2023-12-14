import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const AuthScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.body});

  final String title;
  final String subtitle;
  final String icon;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 8),
                    Image.asset('assets/icons/$icon.png'),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                body,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
