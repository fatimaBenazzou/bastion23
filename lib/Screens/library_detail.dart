import 'package:bastion23/Models/chapter.dart';
import 'package:flutter/material.dart';
import 'package:bastion23/Widgets/app_bar.dart';
import 'package:bastion23/theme_config.dart';

class LibraryDetailScreen extends StatefulWidget {
  const LibraryDetailScreen({Key? key, required this.chapter})
      : super(key: key);

  final ChapterModel chapter;

  @override
  State<LibraryDetailScreen> createState() => _LibraryDetailScreenState();
}

class _LibraryDetailScreenState extends State<LibraryDetailScreen> {
  bool playMusic = true;

  void toggleMusic() {
    setState(() {
      playMusic = !playMusic;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chapter = widget.chapter;

    return Scaffold(
      body: Stack(
        children: [
          // Image en arrière-plan
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(chapter.image),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const Appbar(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),

          // Contenu principal
          Positioned(
            top: AppBar().preferredSize.height,
            left: 0,
            right: 0,
            bottom: 0,
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.1,
              maxChildSize: 1,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28.0),
                      topRight: Radius.circular(28.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                chapter.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: toggleMusic,
                              label: Text(
                                'Narrator ${playMusic ? 'On' : 'Off'}',
                                style: ThemeConfig.squirkButton.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              icon: const Icon(Icons.music_note_rounded,
                                  color: ThemeConfig.buttonColor),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          chapter.description,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ThemeConfig.textColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
