// import 'package:bastion23/Screens/register_screen.dart';
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
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: const Text('Start',
                          style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

      // Stack(
      //   children: [
      //     // Background image
      //     Image.asset(
      //       'assets/images/bab.png',
      //       fit: BoxFit.cover,
      //     ),

      //     // Logo
      //     Center(
      //       child: Image.asset(
      //         'assets/icons/Logo.png',
      //         width: 200,
      //       ),
      //     ),

      //     // Text
      //     const Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Text(
      //         'It\'s Time To See the Story',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),

      //     // Button
      //     Positioned(
      //       bottom: 20,
      //       right: 20,
      //       child: ElevatedButton(
      //         onPressed: () {
      //           // Go to RegisterScreen

      //           // Navigator.pushNamed(context, '/register');
      //         },
      //         child: const Text('Start'),
      //       ),
      //     ),
      //   ],
      // ),
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
