import 'package:course_quiz/data/questions.dart';
import 'package:course_quiz/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:course_quiz/components/quiz_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key, required this.navigateTo, required this.userAnswers});

  final void Function(Routes) navigateTo;
  final List<String> userAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add(
        {
          'questionIndex': i,
          'questionText': questions[i].text,
          'correctAnswer': questions[i].answers[0],
          'userAnswer': userAnswers[i],
          'displayIndex': i + 1,
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final rightAnswers = summary
        .where((element) => element['correctAnswer'] == element['userAnswer'])
        .length;
    final numberOfQuestions = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You got $rightAnswers right out of $numberOfQuestions.",
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            QuizSummary(
              summary: summary,
            ),
            const SizedBox(
              height: 75,
            ),
            OutlinedButton.icon(
              onPressed: () {
                navigateTo(Routes.homePage);
              },
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text("Try Again"),
              style: FilledButton.styleFrom(
                foregroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
