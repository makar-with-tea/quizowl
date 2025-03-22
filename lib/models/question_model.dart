class QuestionModel {
  String imageUrl;
  String question;
  List<String> answers;
  int correctAnswerId;

  QuestionModel({required this.imageUrl,
    required this.question,
    required this.answers,
    required this.correctAnswerId
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      imageUrl: json['imageUrl'],
      question: json['question'],
      answers: json['answers'].cast<String>(),
      correctAnswerId: json['correctAnswerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'question': question,
      'answers': answers,
      'correctAnswerId': correctAnswerId,
    };
  }
}