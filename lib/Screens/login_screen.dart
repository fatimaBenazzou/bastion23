import 'dart:io';
import 'package:bastion23/Screens/forgot_password.dart';
import 'package:bastion23/Screens/layout_screen.dart';
import 'package:bastion23/Widgets/auth.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/Widgets/custom_textfield.dart';
import 'package:bastion23/Widgets/user_image_picker.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  final cameras;

  const LoginScreen(this.cameras, {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;

  File? _selectedImage;
  var _isAuthenticating = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameontroller = TextEditingController();

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid || !_isLogin && _selectedImage == null) {
      // show error message ...
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _userNameontroller.text,
          'email': _emailController.text,
          'image_url': imageUrl,
        });
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LayoutScreen(widget.cameras),
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        // ...
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/icons/Logo.png',
        ),
        actions: [],
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal:20),
        child: AuthScreen(
          title: _isLogin ? 'LOGIN TO YOUR PROFILE' : 'Create new account',
          subtitle:
              'Give your self time alone with the wonderful strory behind BASTION23',
          icon: _isLogin ? 'shy' : 'verified',

          //body widgets
          body: Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                if (!_isLogin)
                  UserImagePicker(
                    onPickImage: (pickedImage) {
                      _selectedImage = pickedImage;
                    },
                  ),
                CustomTextField(
                  labelText: 'Email Address',
                  suffixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                if (!_isLogin)
                  CustomTextField(
                    labelText: 'Username',
                    suffixIcon: Icons.person_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 4) {
                        return 'Please enter at least 4 characters.';
                      }
                      return null;
                    },
                    controller: _userNameontroller,
                  ),
                const SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Password',
                  suffixIcon: Icons.lock,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
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
                if (_isAuthenticating) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ] else ...[
                  CustomElevatedButton(
                    onPressed: _submit,
                    text: _isLogin ? 'CONTINUE' : 'Signup',
                    textColor: ThemeConfig.buttonColor,
                    buttonColor: ThemeConfig.primaryColor,
                  ),
                ],
                const SizedBox(height: 8),
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
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Login with google',
                  textColor: ThemeConfig.primaryColor,
                  buttonColor: ThemeConfig.backgroundColor,
                  icon: Icons.percent,
                ),
                if (!_isAuthenticating)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: _isLogin
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                ' SignUp',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.red,
                                    ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                ' Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
