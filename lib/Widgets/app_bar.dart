import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
   Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          // Photo de profile
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'assets/images/profile.png',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Rounded Progress Bar
          const SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              backgroundColor: Colors.grey,
              value: 0.5, // Adjust the value of the progress bar
            ),
          ),
          const SizedBox(width: 12.0), // Spacer

          // Hello and Nom de l'utilisateur
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Fatima',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12.0), // Spacer

          // Bell Icon for Notifications
          GestureDetector(
            onTap: () {
              // Handle notification icon tap
            },
            child: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
