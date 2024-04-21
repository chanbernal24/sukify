import 'package:flutter/material.dart';
import 'package:sukify/view/onboardingScreen/onboard_screen.dart';
import 'package:sukify/view/signup_screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sukify',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignupScreen(),
    );
  }
}
