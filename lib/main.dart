import 'package:flutter/material.dart';
import 'package:eduvise/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:eduvise/src/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
