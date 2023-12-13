import 'package:bastion23/Data/questions.dart';
import 'package:bastion23/Models/quiz_questions.dart';
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
      margin: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ExpansionPanelList.radio(
            elevation: 1,
            expandIconColor: Colors.white,
            expandedHeaderPadding: const EdgeInsets.all(0),
            children: questions.map((QuizQuestion qst) {
              return ExpansionPanelRadio(
                backgroundColor: ThemeConfig.primaryColor,
                value: qst.id,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Column(
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
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    ],
                  );
                },
                body: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: ThemeConfig.backgroundColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        qst.title,
                      ),
                      Text(
                        qst.question,
                      ),
                      const SizedBox(height: 30),
                      ...qst.shuffledAnswers.map((answer) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
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
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
