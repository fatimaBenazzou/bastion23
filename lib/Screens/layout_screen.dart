import 'package:bastion23/Screens/camera_screen.dart';
import 'package:bastion23/Screens/gallery_screen.dart';
import 'package:bastion23/Screens/home_screen.dart';
import 'package:bastion23/Screens/profile_screen.dart';
import 'package:bastion23/Screens/quizzes.dart';
import 'package:bastion23/Widgets/custom_nav.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedPageIndex = 0;


void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

 Widget _buildBody() {
    switch (_selectedPageIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return GalleryScreen();
      case 2:
        return CameraScreen();
      case 3:
        return QuizzesScreen();
      case 4:
        return ProfileScreen();
      default:
        return Container();
    }
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Bastion 23'),
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTabSelect: _selectPage
      ),
    );
  }
}


