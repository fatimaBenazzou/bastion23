import 'package:bastion23/Widgets/custom_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool enableMusic = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const CustomBar(title: 'Settings'),
          const SizedBox(height: 28),
          Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(
                  'assets/images/Group_33.png',
                ),
                title: const Text(
                  'Personal Info',
                  style: TextStyle(
                    fontWeight: FontWeight.w500, // Make the text bold
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF0B1C3F),
                  size: 34.0,
                ),
                onTap: () {
                  // Add your action here
                  print('Language tile pressed!');
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 2),
                width: double.infinity,
                height: 2,
                color: Colors.grey.shade300,
              ),
              SwitchListTile(
                activeColor: const Color(0xFFB38DE8),
                value: enableMusic,
                secondary: Image.asset(
                  'assets/images/Group_34.png',
                ),
                title: const Text(
                  'Enable Music',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onChanged: (bool value) {
                  enableMusic = !value;

                  print('Enable Music switch toggled to: $value');
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 2),
                width: double.infinity,
                height: 2,
                color: Colors.grey.shade300,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/Group.png',
                ),
                title: const Text(
                  'Support & Questions',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF0B1C3F), // Set the desired color
                  size: 34.0, // Set the desired size
                ),
                onTap: () {
                  // Add your action here
                  print('Language tile pressed!');
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 2),
                width: double.infinity,
                height: 2,
                color: Colors.grey.shade300,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/logout.png',
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  // Add your action here
                  print('Im loggin out');
                },
              )
            ],
          ),
          const SizedBox(height: 50),
          Image.asset(
            'assets/images/setting_bg.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    ));
  }
}
