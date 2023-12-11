import 'package:bastion23/Widgets/auth.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/Widgets/custom_textfield.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: AuthScreen(
          title: 'Create new account',
          subtitle:
              'Give your self time alone with the wonderful strory behind BASTION23',
          icon: 'verified',

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

                // checkBox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      activeColor: ThemeConfig.secondaryColor,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By checking, you’ve read and agree to the ',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
                          Text(
                            'Terms and conditions of service.',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ThemeConfig.secondaryColor,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // button
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Validation successful, implement login functionality
                    }
                  },
                  text: 'REGISTER',
                  textColor: ThemeConfig.buttonColor,
                  buttonColor: ThemeConfig.primaryColor,
                ),
                const SizedBox(height: 8),

                // Login toggle
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        ' Login',
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
