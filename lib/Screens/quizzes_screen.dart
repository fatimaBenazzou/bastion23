import 'package:bastion23/Data/questions.dart';
import 'package:bastion23/Models/quiz_questions.dart';
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
        child: ExpansionPanelList.radio(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: questions.map<ExpansionPanelRadio>((QuizQuestion qst) {
            return ExpansionPanelRadio(
              value: qst.id,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Column(
                  children: [
                     ListTile(
                      title: Text('Quizz ${qst.id}'),
                    ),
                     const ListTile(
                      title: Text('You are doing great in terms of levels solve more quizzes to earn rewards, keep it up !'),
                    ),
                  ],
                );
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    qst.title,
                  ),
                  Text(
                    qst.question,
                  ),
                  const SizedBox(height: 30),
                  ...qst.shuffledAnswers.map((answer) {
                    return ElevatedButton(
                      child: Text(answer),
                      onPressed: () {},
                    );
                  }),
                ],
              ),

              // ListTile(
              //   title: Text(qst.answers[0]),
              // ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
