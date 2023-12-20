import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bastion23/theme_config.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key});

  @override
  Widget build(BuildContext context) {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    // Display the user's name if available, otherwise use a default value
    String userName = user?.displayName ?? 'User';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Photo de profile
        SizedBox(
          child: Row(
            children: [
              Stack(
                children: [
                  // Rounded Progress Bar
                  const SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      backgroundColor: Colors.grey,
                      color: ThemeConfig.secondaryColor,
                      value: 0.5, // Adjust the value of the progress bar
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 12.0), // Spacer

              // Hello and Nom de l'utilisateur
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontFamily: 'Squirk',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      // letterSpacing: 0.6
                    ),
                  ),
                  Text(
                    userName, // Display the user's name here
                    style: TextStyle(
                      fontFamily: 'Squirk',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 12.0), // Spacer

        // Bell Icon for Notifications
        GestureDetector(
          onTap: () {
            // Handle notification icon tap
          },
          child: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
