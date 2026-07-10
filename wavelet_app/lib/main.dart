import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'package:Wavelet/pages/home_page.dart';
import 'package:Wavelet/theme/theme.dart';
import 'package:Wavelet/pages/splash_page.dart';

void main() {
  runApp(const WaveletApp());
}

class WaveletApp extends StatefulWidget {
  const WaveletApp({super.key});


  @override
  State<WaveletApp> createState() => _WaveletAppState();
}

class _WaveletAppState extends State<WaveletApp> {

  ThemeMode _themeMode = ThemeMode.dark; // dark by default

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:      WaveletTheme.light,
      darkTheme:  WaveletTheme.dark,
      themeMode:  _themeMode,
      home: SplashPage(toggleTheme: toggleTheme),
      debugShowCheckedModeBanner: false,
    );
}
}
