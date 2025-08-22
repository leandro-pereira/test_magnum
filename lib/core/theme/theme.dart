import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0066CC);
  static const Color secondaryColor = Color(0xFFFFAA00);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Colors.black87;

  static const String fontFamily = 'Roboto';

  static const double fontSmall = 8.0;
  static const double fontMedium = 16.0;
  static const double fontLarge = 24.0;

  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        background: backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: fontLarge, fontWeight: FontWeight.bold, color: textColor),
        bodyLarge: TextStyle(fontSize: fontLarge, color: textColor),
        bodyMedium: TextStyle(fontSize: fontMedium, color: textColor),
        bodySmall: TextStyle(fontSize: fontSmall, color: textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: fontMedium, fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          background: Color(0xFF121212),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineLarge:
              TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: fontLarge),
          bodyMedium: TextStyle(fontSize: fontMedium),
          bodySmall: TextStyle(fontSize: fontSmall),
        ),
      );
}
