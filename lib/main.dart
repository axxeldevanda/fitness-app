import 'package:fitness_app/screens/Onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xffFF236F)
        )
      ),
    );
  }
}
