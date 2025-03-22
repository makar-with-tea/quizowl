import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswersCount;
  final int totalQuestionsCount;

  const ResultScreen({super.key, required this.correctAnswersCount, required this.totalQuestionsCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Вы ответили правильно на $correctAnswersCount из $totalQuestionsCount вопросов.'),
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

              },
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}