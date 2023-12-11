import 'package:bastion23/Screens/auth_screen.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/Widgets/custom_textfield.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Reset Password',
      subtitle:
          'Dont’ worry it happens. Stay logged in the app so you dont need to retype the password again',
      icon: 'lock',
      //body widgets
      body: Form(
        // key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 48),

            // TextFields
            //psw
            CustomTextField(
              labelText: 'Password',
              suffixIcon: Icons.lock,
              isPassword: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // consfirm psw
            CustomTextField(
              labelText: 'Confirm Password',
              suffixIcon: Icons.lock,
              isPassword: true,
              controller: _cpasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
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
              text: 'Confirm',
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
