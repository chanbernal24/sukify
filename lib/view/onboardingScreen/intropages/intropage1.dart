import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
                  image: AssetImage('lib/assets/onboardingScreen1.png'),
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
        Column(children: [
          const SizedBox(
            height: 414.0,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Text(
              'Discover Your Style',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
                'Explore a vast collection of trendy outfits tailored to your taste and preferences.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color.fromRGBO(214, 214, 214, 1),
                )),
          ),
          const SizedBox(
            height: 97,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(69, 137, 216, 1),
                        padding: const EdgeInsets.fromLTRB(61, 14, 61, 14),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14)))),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          )
        ])
      ],
    )
    );
  }
}
