import 'package:flutter/material.dart';
import 'colors.dart';

class WaveletTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Dark.background,
    colorScheme: ColorScheme.dark(
      primary:   Dark.primary,
      surface:   Dark.surface,
      error:     Dark.error,
    ),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Light.background,
    colorScheme: ColorScheme.light(
      primary:   Light.primary,
      surface:   Light.surface,
      error:     Light.error,
    ),
  );

  static ThemeData font = ThemeData(
  fontFamily: 'Nunito', // default font for everything
  textTheme: TextTheme(
    displayLarge:  TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontFamily: 'Nunito', fontSize: 24, fontWeight: FontWeight.bold),
    bodyLarge:     TextStyle(fontFamily: 'Inter',  fontSize: 16),
    bodyMedium:    TextStyle(fontFamily: 'Inter',  fontSize: 14),
    bodySmall:     TextStyle(fontFamily: 'Inter',  fontSize: 12),
    labelLarge:    TextStyle(fontFamily: 'Inter',  fontSize: 14, fontWeight: FontWeight.bold),
  ),
  // ... rest of your theme
);
}

