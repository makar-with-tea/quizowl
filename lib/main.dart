
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizowl/services/owl_service.dart';
import 'package:quizowl/tools/logger.dart';

import 'main_app.dart';

const String jsonString = '''
[
{
    "imageUrl": "",
    "question": "Насколько крупнее самка совы по сравнению с самцом?",
    "answers": ["10%", "75%", "50%", "25%"],
    "correctAnswerId": 3
  },
  
  {
  "imageUrl": "",
  "question": "Какой вид сов самый маленький?",
  "answers": ["Сипуха", "Полярная сова", "Сыч-эльф", "Филин"],
  "correctAnswerId": 2
  },
  {
    "imageUrl": "",
    "question": "Какая сова самая большая в мире?",
    "answers": ["Виргинский филин", "Рыбный филин", "Сипуха", "Филин"],
    "correctAnswerId": 1
  },
  {
    "imageUrl": "",
    "question": "Какой связанной со зрением функции нет у глаз совы?",
    "answers": ["Периферическое зрение", "Глазные яблоки", "Цветовое зрение", "Восприятие глубины"],
    "correctAnswerId": 1
  },
  {
    "imageUrl": "",
    "question": "Насколько совы могут поворачивать шею?",
    "answers": ["180 градусов", "270 градусов", "360 градусов", "90 градусов"],
    "correctAnswerId": 1
  },
  {
    "imageUrl": "",
    "question": "Какая богиня в греческой мифологии часто изображается с совой?",
    "answers": ["Артемида", "Гера", "Афина", "Афродита"],
    "correctAnswerId": 2
  },
  {
    "imageUrl": "",
    "question": "Сколько примерно видов сов существует?",
    "answers": ["50", "300", "150", "200"],
    "correctAnswerId": 3
  },
  {
    "imageUrl": "",
    "question": "Какой звук обычно издает сипуха?",
    "answers": ["Уханье", "Шипение", "Свист", "Щебетание"],
    "correctAnswerId": 1
  },
  {
    "imageUrl": "",
    "question": "В мифах некоторых народов говорится, что совы предсказывают…",
    "answers": ["Рождение", "Богатый урожай", "Смерть", "Свадьбу"],
    "correctAnswerId": 2
  },
  {
    "imageUrl": "",
    "question": "У сыча-эльфа есть уникальная привычка: он гнездится в…",
    "answers": ["Скалах", "Земляных норах", "Кактусах", "Водоемах"],
    "correctAnswerId": 2
  },
  {
    "imageUrl": "",
    "question": "Для чего многие фермеры используют сов?",
    "answers": ["Охрана скота", "Естественная борьба с вредителями", "Опыление", "Посадка деревьев"],
    "correctAnswerId": 1
  },
  {
    "imageUrl": "",
    "question": "Как живут совы?",
    "answers": ["Парами", "Стаями", "По одиночке", "Семьями"],
    "correctAnswerId": 0
  },
  {
    "imageUrl": "",
    "question": "Обладают ли птенцы сов слухом и зрением?",
    "answers": ["Нет", "Да", "Зависит от вида", "Обладают слухом, но не зрением"],
    "correctAnswerId": 0
  }
]
''';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  await Firebase.initializeApp();

  // final OwlService owlService = OwlService();
  // await owlService.clearQuestions();
  // await owlService.writeQuestionsToDB(jsonString);

  logger.info('firebase initialized; start main');
  runApp(MainApp());
}
