import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  Function()? onNext;
  Function()? onPrevious;
  IntroPage3({super.key, this.onNext, this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/onboardingScreen3.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(0, 0, 0, 0),
            Color.fromRGBO(0, 0, 0, 0),
            Color.fromRGBO(0, 0, 0, 0),
            Color.fromRGBO(0, 0, 0, 0),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        const Column(children: [
          SizedBox(
            height: 414.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Text(
              'Fashion Updates',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
                'Follow your favorite brands, receive exclusive offers, and stay updated with the latest fashion trends.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color.fromRGBO(214, 214, 214, 1),
                )),
          ),
          SizedBox(
            height: 97,
          ),
        ])
      ],
    ));
  }
}
