import 'package:flutter/material.dart';
import 'package:quizowl/models/question_model.dart';
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
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Результаты'),
          content: Text('Вы ответили правильно на $_correctAnswersCount из ${_questions.length} вопросов.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
              },
              child: Text('ОК'),
            ),
          ],
        );
      },
    );
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