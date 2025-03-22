import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizowl/models/question_model.dart';
import 'package:quizowl/tools/logger.dart';

class OwlService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<QuestionModel>> getAllQuestions() async {
    final snapshot = await _db.collection('questions').get();
    logger.info('Questions: ${snapshot.docs
        .map((doc) => doc.data())
        .toList()}');

    final questions = snapshot.docs
        .map((doc) => QuestionModel.fromJson(doc.data()))
        .toList();
    return questions;
  }

  Future<void> addQuestion(QuestionModel question) async {
    final docRef = _db.collection('suggestions').doc();
    await docRef.set(question.toJson());
  }


  // Debug methods:

  Future<void> writeQuestionsToDB(String jsonString) async {
    final List<dynamic> jsonData = json.decode(jsonString);
    final batch = _db.batch();

    for (var questionData in jsonData) {
      final question = QuestionModel.fromJson(questionData);
      final docRef = _db.collection('questions').doc();
      batch.set(docRef, question.toJson());
    }

    await batch.commit();
  }

  Future<void> clearQuestions() async {
    final snapshot = await _db.collection('questions').get();
    final batch = _db.batch();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }



}