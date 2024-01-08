import 'package:course_quiz/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:course_quiz/models/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Routes currentPage = Routes.homePage;
  Map<Routes, Widget>? routes;
  final List<String> answers = [];

  void navigateTo(Routes route) {
    setState(() {
      currentPage = route;
    });
  }

  void saveAnswer(String answer) {
    if (answers.length >= questions.length) {
      answers.clear();
    }
    answers.add(answer);
  }

  @override
  void initState() {
    initializeRouter();
    super.initState();
  }

  Future<void> initializeRouter() async {
    routes = router(
      navigateTo,
      saveAnswer,
      answers,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: initializeRouter(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return routes![currentPage] ?? Container();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}
