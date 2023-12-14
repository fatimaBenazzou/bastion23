import 'package:bastion23/Data/questions.dart';
import 'package:bastion23/Models/quiz_questions.dart';
import 'package:bastion23/Widgets/custom_bar.dart';
import 'package:bastion23/theme_config.dart';
import 'package:flutter/material.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  // List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          CustomBar(
            title: 'Quizzes',
          ),
          SizedBox(
            height: 20,
          ),
          ...questions
              .map((QuizQuestion qst) => Card(
                    color: ThemeConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                    // margin: const EdgeInsets.only(bottom: 20),
                    child: ExpansionTile(
                      iconColor: ThemeConfig.buttonColor,
                      tilePadding: const EdgeInsets.all(0),
                      title: Column(
                        children: [
                          ListTile(
                            leading: Image.asset('assets/images/quizz.png'),
                            title: Text(
                              'Quizz ${qst.id}',
                              style: ThemeConfig.caption.copyWith(
                                color: ThemeConfig.buttonColor,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'You are doing great in terms of levels solve more quizzes to earn rewards, keep it up !',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              color: ThemeConfig.backgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  qst.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  qst.question,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                ...qst.answers.map((answer) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      child: Text(
                                        answer,
                                        style: ThemeConfig.squirkButton
                                            .copyWith(fontSize: 12),
                                      ),
                                      onPressed: () {},
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
