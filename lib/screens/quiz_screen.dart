import 'package:flutter/material.dart';
import 'package:quizowl/models/question_model.dart';
import 'package:quizowl/screens/result_screen.dart';
import 'package:quizowl/services/owl_service.dart';
import 'package:quizowl/views/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final OwlService _owlService = OwlService();
  List<QuestionModel> _questions = [];
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  int? _selectedAnswerId;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    List<QuestionModel> questions = await _owlService.getAllQuestions();
    setState(() {
      _questions = questions;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_selectedAnswerId == _questions[_currentQuestionIndex].correctAnswerId) {
        _correctAnswersCount++;
      }
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswerId = null;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              correctAnswersCount: _correctAnswersCount,
              totalQuestionsCount: _questions.length,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          QuestionCard(
            imageUrl: currentQuestion.imageUrl,
            question: currentQuestion.question,
            options: currentQuestion.answers,
            correctAnswerId: currentQuestion.correctAnswerId,
            selectedAnswerId: _selectedAnswerId,
            onOptionSelected: (int selectedId) {
              setState(() {
                _selectedAnswerId = selectedId;
              });
            },
            questionIndex: _currentQuestionIndex,
          ),
          ElevatedButton(
            onPressed: _nextQuestion,
            child: Text(_currentQuestionIndex < _questions.length - 1 ? "Далее" : "Завершить"),
          ),
        ],
      ),
    );
  }
}