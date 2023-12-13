import 'package:bastion23/Screens/camera_screen.dart';
import 'package:bastion23/Screens/gallery_screen.dart';
import 'package:bastion23/Screens/home_screen.dart';
import 'package:bastion23/Screens/profile_screen.dart';
import 'package:bastion23/Screens/quizzes_screen.dart';
import 'package:bastion23/Widgets/custom_nav.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedPageIndex = 0;
  bool playMusic = true;
  String music = 'On';

  void toggleMusic() {
    setState(() {
      playMusic = !playMusic;

      playMusic ? music = 'On' : music = 'Off';
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedPageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const GalleryScreen();
      case 2:
        return const CameraScreen();
      case 3:
        return const QuizzesScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
                  const Column(
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
                        'Fatima',
                        style: TextStyle(
                          fontFamily: 'Squirk',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8
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
        ),
      ),
      floatingActionButton: Positioned(
        bottom: 16.0,
        right: 16.0,
        child: ElevatedButton.icon(
          onPressed: toggleMusic,
          label: Text(
            'Music $music',
            style: ThemeConfig.squirkButton,
          ),
          icon: const Icon(Icons.music_note_rounded,
              color: ThemeConfig.buttonColor),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24), // Ajustez le radius ici
            ),
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedPageIndex, onTabSelect: _selectPage),
    );
  }
}
