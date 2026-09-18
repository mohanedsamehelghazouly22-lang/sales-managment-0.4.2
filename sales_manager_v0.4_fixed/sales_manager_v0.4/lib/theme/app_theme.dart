import 'package:flutter/material.dart';

class AppTheme {
  static const bg = Color(0xFF061A2F);
  static const panel = Color(0xFF0B2744);
  static const panel2 = Color(0xFF10365B);
  static const primary = Color(0xFF16A8FF);
  static const accent = Color(0xFF7B5CFF);
  static const text = Color(0xFFF4F8FC);
  static const muted = Color(0xFF91A9C0);

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bg,
    fontFamily: 'Arial',
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: accent,
      surface: panel,
    ),
    cardTheme: CardThemeData(
      color: panel,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: panel,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: muted),
    ),
  );
}
