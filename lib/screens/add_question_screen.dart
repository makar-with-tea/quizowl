import 'package:flutter/material.dart';
import 'package:quizowl/models/question_model.dart';

import '../services/owl_service.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _correctAnswerController = TextEditingController();
  final _wrongAnswer1Controller = TextEditingController();
  final _wrongAnswer2Controller = TextEditingController();
  final _wrongAnswer3Controller = TextEditingController();
  final _imageUrlController = TextEditingController();
  final OwlService _owlService = OwlService();


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final answers = [
        _correctAnswerController.text,
        _wrongAnswer1Controller.text,
        _wrongAnswer2Controller.text,
        _wrongAnswer3Controller.text,
      ];
      answers.shuffle();
      int correctAnswerId = answers.indexOf(_correctAnswerController.text);
      QuestionModel question = QuestionModel(
        question: _questionController.text,
        answers: answers,
        correctAnswerId: correctAnswerId,
        imageUrl: _imageUrlController.text,
      );
      _owlService.addQuestion(question);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Спасибо, мы рассмотрим ваш вопрос!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Предложить свой вопрос'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Вопрос'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите вопрос';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _correctAnswerController,
                decoration: InputDecoration(labelText: 'Правильный ответ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите правильный ответ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wrongAnswer1Controller,
                decoration: InputDecoration(labelText: 'Неверный ответ 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите неверный ответ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wrongAnswer2Controller,
                decoration: InputDecoration(labelText: 'Неверный ответ 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите неверный ответ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wrongAnswer3Controller,
                decoration: InputDecoration(labelText: 'Неверный ответ 3'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите неверный ответ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Ссылка на фото (по желанию)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}