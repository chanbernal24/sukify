import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  bool isLastpage = false;
  bool isFirstPage = true;

  Function()? onNext() {
    setState(() {
      _controller.nextPage(
          duration: Duration(milliseconds: 800), curve: Easing.legacy);
    });
  }

  Function()? onPrevious() {
    setState(() {
      _controller.previousPage(
          duration: Duration(milliseconds: 800), curve: Easing.legacy);
    });
  }

  List Pages = [
    IntroPage1(),
    IntroPage2(),
    IntroPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                isLastpage = (value == 2);
                isFirstPage = (value == 0);
              });
            },
            controller: _controller,
            itemCount: Pages.length,
            itemBuilder: (context, index) {
              return Pages[index];
            },
          ),
          Container(
            alignment: const Alignment(0, 0.6),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  spacing: 6,
                  dotWidth: 10,
                  dotHeight: 4,
                  activeDotColor: Color.fromRGBO(69, 137, 216, 1)),
              controller: _controller,
              count: Pages.length,
            ),
          ),
          Container(
            alignment: const Alignment(0, .9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 159,
                  height: 47,
                  child: isFirstPage
                      ? Text("")
                      : TextButton(
                          onPressed: onPrevious,
                          child: Text(
                            isFirstPage ? "" : "Previous",
                            style: TextStyle(
                                color: Color.fromRGBO(69, 137, 216, 1)),
                          ),
                        ),
                ),
                SizedBox(
                  width: 159,
                  height: 47,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(69, 137, 216, 1),
                      ),
                    ),
                    onPressed: onNext,
                    child: Text(
                      isLastpage ? "Done" : "Next",
                      style: const TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
