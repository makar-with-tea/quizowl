import 'package:flutter/material.dart';

class QuestionFormField extends StatelessWidget {
  final String question;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final bool isRequired;
  final String? errorText;

  const QuestionFormField({
    super.key,
    required this.question,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isRequired = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: isRequired ? (value) {
            if (value == null || value.isEmpty) {
              return errorText ?? 'Пожалуйста, заполните это поле.';
            }
            return null;
          } : null,
        ),
      ],
    );
  }
}