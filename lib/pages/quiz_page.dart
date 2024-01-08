import 'package:course_quiz/data/questions.dart';
import 'package:course_quiz/models/routes.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.navigateTo,
    required this.saveAnswer,
  });

  final void Function(Routes) navigateTo;
  final void Function(String) saveAnswer;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;

  void nextQuestion() {
    setState(() {
      currentQuestion++;
    });
  }

  void saveAndContinue(String answer) {
    widget.saveAnswer(answer);

    if (currentQuestion < questions.length - 1) {
      nextQuestion();
    } else {
      widget.navigateTo(Routes.resultsPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: const TextStyle(
                color: Color.fromARGB(255, 20, 146, 250),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...question.getShuffle().map((answer) {
                    return FilledButton(
                      onPressed: () {
                        saveAndContinue(answer);
                      },
                      child: Text(answer),
                      style: FilledButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 20, 146, 250),
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
