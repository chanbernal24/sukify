import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/view/onboardingScreen/onboard_screen.dart';

class SellerMenuScreen extends StatefulWidget {
  const SellerMenuScreen({super.key});

  @override
  State<SellerMenuScreen> createState() => _SellerMenuScreenState();
}

class _SellerMenuScreenState extends State<SellerMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 32),
          SellerMenuGreet(),
          const SizedBox(height: 50),
          SellerAboutBtn(context),
          const SizedBox(height: 135),
          SellerLogoutBtn(context),
        ],
      ),
    );
  }

  Widget SellerMenuGreet() {
    return const Center(
      child: Column(
        children: [
          CircleAvatar(
              radius: 27, backgroundImage: AssetImage('lib/assets/miles.jpg')),
          SizedBox(height: 12),
          Text(
            'Felicorps',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, .5)),
          ),
        ],
      ),
    );
  }

  Widget SellerAboutBtn(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, .5),
          ),
          borderRadius: BorderRadius.circular(14)),
      child: FilledButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(255, 255, 255, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {},
          icon: const Icon(Icons.info_outline,
              color: Color.fromRGBO(0, 0, 0, .5)),
          label: const Text(
            'About',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, .5)),
          )),
    );
  }

  Widget SellerLogoutBtn(BuildContext context) {
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
                    child: OnboardingScreen(),
                    type: PageTransitionType.leftToRight),
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
