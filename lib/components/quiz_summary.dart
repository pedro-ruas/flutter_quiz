import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map(
                (answer) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 27.5,
                            height: 27.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: answer["userAnswer"] == answer["correctAnswer"]
                                  ? Colors.blueAccent
                                  : Colors.amber[700],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              (answer["displayIndex"]).toString(),
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              answer["questionText"].toString(),
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              answer["userAnswer"].toString(),
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Text(
                              answer["correctAnswer"].toString(),
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
