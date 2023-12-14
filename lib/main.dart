import 'package:bastion23/Screens/layout_screen.dart';
import 'package:bastion23/Screens/onboarding_screen.dart';
import 'package:bastion23/Screens/splash_screen.dart';
import 'package:bastion23/theme_config.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<CameraDescription> cameras=[];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }

            if (snapshot.hasData) {
              return  LayoutScreen(cameras);
            }

            return  OnboardingScreen(cameras);
          }),
    );
      
      
      
       
    
  }
}
