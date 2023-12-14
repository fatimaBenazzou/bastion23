import 'package:bastion23/Screens/2d_screen.dart';
import 'package:bastion23/Screens/3d_screen.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Nombre d'onglets
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: [
              Tab(text: 'Images'),
              Tab(text: '3D Models'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            DScreen(),
            ModelScreen(),
          ],
        ),
      ),
    );
  }
}