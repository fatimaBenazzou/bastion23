import 'package:bastion23/Widgets/auth.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/Widgets/custom_textfield.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Forgot Password?',
      subtitle:
          'Dont’ worry it happens. Please enter the adress associated with your account. ',
      icon: 'question',
      //body widgets
      body: Form(
        // key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 48),

            // TextFields
            //Email
            CustomTextField(
              labelText: 'Email',
              suffixIcon: Icons.email_outlined,
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email Adress.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // buttons
            CustomElevatedButton(
              onPressed: () {
                // if (_formKey.currentState?.validate() ?? false) {
                // Validation successful, implement login functionality
                // }
              },
              text: 'CONTINUE',
              textColor: ThemeConfig.buttonColor,
              buttonColor: ThemeConfig.primaryColor,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
