import 'package:bastion23/Models/chapter.dart';
import 'package:bastion23/Screens/library_detail.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({super.key, required this.chapter});
  final ChapterModel chapter;

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    // box/card
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const LibraryDetailScreen()));
      },
      child: Container(
        width: 163,
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3313111F),
              blurRadius: 8,
              offset: Offset(2, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Container(
              width: 163,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.chapter.image),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            // chapitre + durée
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // chapitre
                    Text(
                      'Chapter ${widget.chapter.chapter}',
                      style: const TextStyle(
                        color: ThemeConfig.textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //durée
                    const Text(
                      '01:25',
                      style: TextStyle(
                        color: ThemeConfig.textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // progress bar + pourcentage
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 117,
                      height: 5,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 117,
                              height: 5,
                              decoration: ShapeDecoration(
                                color: const Color(0xB2D9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 32.57,
                              height: 5,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF6851B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${widget.chapter.avancement}%',
                      style: const TextStyle(
                        color: ThemeConfig.textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
