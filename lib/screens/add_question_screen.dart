import 'package:flutter/material.dart';
import 'package:quizowl/models/question_model.dart';
import 'package:quizowl/views/question_form_field.dart';

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
              QuestionFormField(question: 'Ваш вопрос', controller: _questionController, isRequired: true, errorText: 'Пожалуйста, введите вопрос.', maxLines: 3),
              QuestionFormField(question: 'Правильный ответ', controller: _correctAnswerController, isRequired: true, errorText: 'Пожалуйста, введите правильный ответ.'),
              QuestionFormField(question: 'Неправильный ответ 1', controller: _wrongAnswer1Controller, isRequired: true, errorText: 'Пожалуйста, введите неправильный ответ.'),
              QuestionFormField(question: 'Неправильный ответ 2', controller: _wrongAnswer2Controller, isRequired: true, errorText: 'Пожалуйста, введите неправильный ответ.'),
              QuestionFormField(question: 'Неправильный ответ 3', controller: _wrongAnswer3Controller, isRequired: true, errorText: 'Пожалуйста, введите неправильный ответ.'),
              QuestionFormField(question: 'Ссылка на изображение', controller: _imageUrlController),
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