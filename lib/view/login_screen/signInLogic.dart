import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sukify/controller/services/auth_services/auth_services.dart';
import 'package:sukify/view/login_screen/login_screen.dart';
import 'package:sukify/view/user_screen/navbar_main.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthentication() {
    bool? isUserAuthenticated = Authservices.isUserAuthenticated();
    isUserAuthenticated
        ? Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: NavbarPageMainPage(),
                type: PageTransitionType.rightToLeft),
            (route) => false,
          )
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: LoginScreen(), type: PageTransitionType.rightToLeft),
            (route) => false,
          );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
