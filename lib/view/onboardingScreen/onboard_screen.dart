import 'package:flutter/material.dart';
import 'package:sukify/view/onboardingScreen/intropages/intropage1.dart';
import 'package:sukify/view/onboardingScreen/intropages/intropage2.dart';
import 'package:sukify/view/onboardingScreen/intropages/intropage3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ],
      ),
    );
  }
}
