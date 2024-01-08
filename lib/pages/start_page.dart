import 'package:course_quiz/models/routes.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.navigateTo});

  final void Function(Routes) navigateTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: Colors.blueAccent,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: () {
            navigateTo(Routes.quizPage);
          },
          icon: const Icon(Icons.chevron_right_rounded),
          label: const Text("Start Quiz"),
          style: FilledButton.styleFrom(
            foregroundColor: Colors.blueAccent,
          ),
        )
      ],
    );
  }
}
