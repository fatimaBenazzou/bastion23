import 'package:bastion23/Screens/camera_screen.dart';
import 'package:bastion23/Screens/gallery_screen.dart';
import 'package:bastion23/Screens/home_screen.dart';
import 'package:bastion23/Screens/profile_screen.dart';
import 'package:bastion23/Screens/quizzes_screen.dart';
import 'package:bastion23/Widgets/app_bar.dart';
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
        title: Appbar()
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
