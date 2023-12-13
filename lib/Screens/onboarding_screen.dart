// import 'package:bastion23/Screens/register_screen.dart';
import 'package:bastion23/Widgets/custom_button.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bab.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'It\'s Time To see  the story',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
              onPressed: () {
                // if (_formKey.currentState?.validate() ?? false) {
                // Validation successful, implement login functionality
                // }
              },
              text: 'Start',
              textColor: ThemeConfig.buttonColor,
              buttonColor: ThemeConfig.primaryColor,
            ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Onboarding screen transition
  @override
  void dispose() {
    // Blur the background image when transitioning to RegisterScreen
    _scaffoldKey.currentState?.setState(() {
      // Set the background image to a blurred version of itself
      // (Note: ImageFilter.blur is not directly available for this use case)
      // You may want to use a BackdropFilter for a similar effect.
      // BackdropFilter(filter: ImageFilter.blur())
    });
    super.dispose();
  }
}
