import 'package:bastion23/Widgets/chapter.dart';
import 'package:flutter/material.dart';

class Chapters extends StatelessWidget {
  const Chapters({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
      
      Container(
        width: 160,
        color: Colors.blue,
      ),
      Container(
        width: 160,
        color: Colors.green,
      ),
      Container(
        width: 160,
        color: Colors.yellow,
      ),
      Container(
        width: 160,
        color: Colors.orange,
      ),
      ],
    ),
    );
  }
}