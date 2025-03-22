import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizOwl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: Text('Начать квиз'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-question');
              },
              child: Text('Предложить свой вопрос'),
            ),
          ],
        ),
      ),
    );
  }
}