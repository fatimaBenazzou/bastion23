import 'package:bastion23/Data/chapters.dart';
import 'package:bastion23/Widgets/chapter.dart';
import 'package:bastion23/Widgets/custom_bar.dart';
import 'package:flutter/material.dart';

const List<String> rewards = ['Investor1', 'Investor2', 'Investor3', 'Investor2', 'Investor3'];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // bar
          const CustomBar(title: 'My Library'),

          const SizedBox(height: 20),

          // carrousel
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...chapters.map((chap) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Chapter(chapter: chap),
                )).toList(),
              ],
            ),
          ),

          const SizedBox(height: 20),

          //Rewards
          Text(
            "REWARDS",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...rewards
                    .map(
                      (reward) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 24, 20),
                        child: Image.asset(
                          'assets/images/$reward.png',
                          fit: BoxFit.cover,
                                        
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
