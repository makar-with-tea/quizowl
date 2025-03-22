import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF7200B2),
        secondary: Color(0xFF66E3FF),
        brightness: brightness,
      ),
    );
    return theme;
  }
}
