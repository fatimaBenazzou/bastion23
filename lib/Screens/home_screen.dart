import 'package:bastion23/Widgets/chapters.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Library
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text("My Library"),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            // hadek te3 pourcentage
          ],
        ),
// chapters
        Chapters()

        //Rewards

        // Music
      ],
    );
  }
}
