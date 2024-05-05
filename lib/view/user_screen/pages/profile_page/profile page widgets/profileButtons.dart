import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';

class YourButtons extends StatefulWidget {
  const YourButtons({super.key});

  @override
  State<YourButtons> createState() => _YourButtonsState();
}

class _YourButtonsState extends State<YourButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(239, 82, 82, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {
            auth.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: SignInLogic(), type: PageTransitionType.rightToLeft),
                (route) => false);
          },
          icon: const Icon(Icons.person_outline,
              color: Color.fromRGBO(240, 240, 240, 1)),
          label: const Text(
            'Logout',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(240, 240, 240, 1)),
          )),
    );
  }
}
