import 'package:bastion23/Models/chapter.dart';
import 'package:bastion23/Widgets/story_card.dart';
import 'package:flutter/material.dart';

class Chapter extends StatelessWidget {
  const Chapter({super.key, required this.chapter});
  final ChapterModel chapter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoryCard(chapter: chapter),
        SizedBox(
            width: 163,
            child: Text(
              chapter.sujet,
              style: Theme.of(context).textTheme.headlineMedium,
            )),
        Text(
          'Palais ${chapter.palais}',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
