import 'package:course_quiz/pages/pages.dart';
import 'package:flutter/material.dart';

enum Routes {
  homePage,
  quizPage,
  resultsPage,
}

Map<Routes, Widget> router(void Function(Routes) navigationFunction,
    void Function(String) saveAnswer, List<String> answers) {
  return {
    Routes.homePage: StartPage(navigateTo: navigationFunction),
    Routes.quizPage:
        QuizPage(navigateTo: navigationFunction, saveAnswer: saveAnswer),
    Routes.resultsPage:
        ResultsPage(navigateTo: navigationFunction, userAnswers: answers),
  };
}
