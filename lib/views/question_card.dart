import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String imageUrl;
  final String question;
  final List<String> options;
  final int correctAnswerId;
  final int? selectedAnswerId;
  final Function(int) onOptionSelected;
  final int questionIndex;

  const QuestionCard({super.key,
    required this.imageUrl,
    required this.question,
    required this.options,
    required this.correctAnswerId,
    required this.selectedAnswerId,
    required this.onOptionSelected,
    required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrl.isNotEmpty)
          Image.network(imageUrl),
        Text('Вопрос ${questionIndex + 1}'),
        Text(question),
        ...options.asMap().entries.map((entry) {
          int idx = entry.key;
          String text = entry.value;
          return RadioListTile<int>(
            title: Text(text),
            value: idx,
            groupValue: selectedAnswerId,
            onChanged: (int? value) {
              if (value != null) {
                onOptionSelected(value);
              }
            },
          );
        }),
      ],
    );
  }
}