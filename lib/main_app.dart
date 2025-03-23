import 'package:flutter/material.dart';
import 'package:quizowl/screens/add_question_screen.dart';
import 'package:quizowl/screens/home_screen.dart';
import 'package:quizowl/screens/quiz_screen.dart';
import 'package:quizowl/screens/result_screen.dart';
import 'package:quizowl/tools/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      title: 'Quizowl',
      //theme: AppTheme.theme(false),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(),
        '/add-question': (context) => AddQuestionScreen(),
      },
    );
  }
}
