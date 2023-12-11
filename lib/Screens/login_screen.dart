import 'package:bastion23/Screens/auth_screen.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/Widgets/custom_textfield.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: AuthScreen(
          title: 'LOGIN TO YOUR PROFILE',
          subtitle:
              'Give your self time alone with the wonderful strory behind BASTION23',
          icon: 'shy',

          //body widgets
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 48),

                // TextFields
                //userNAme
                CustomTextField(
                  labelText: 'Username',
                  suffixIcon: Icons.person_outlined,
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

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

                // forgot psw
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // buttons
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Validation successful, implement login functionality
                    }
                  },
                  text: 'CONTINUE',
                  textColor: ThemeConfig.buttonColor,
                  buttonColor: ThemeConfig.primaryColor,
                ),
                const SizedBox(height: 8),

                // OR line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      width: width * 0.3,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 2,
                      width: width * 0.3,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Google login o kda
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Validation successful, implement login functionality
                    }
                  },
                  text: 'Login with google',
                  textColor: ThemeConfig.primaryColor,
                  buttonColor: ThemeConfig.backgroundColor,
                  icon: Icons.percent,
                ),

                // SignUp toggle
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        ' SignUp',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
