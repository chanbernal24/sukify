// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/view/user_screen/pages/cart_page.dart';
import 'package:sukify/view/user_screen/pages/home_page.dart';
import 'package:sukify/view/user_screen/pages/menu_page.dart';
import 'package:sukify/view/user_screen/pages/profile_page.dart';

class NavbarPageMainPage extends StatefulWidget {
  const NavbarPageMainPage({super.key});

  @override
  State<NavbarPageMainPage> createState() => _NavbarPageMainPageState();
}

final List<Widget> pages = [
  HomePage(),
  ProfilePage(),
  CartPage(),
  MenuPage(),
];

class _NavbarPageMainPageState extends State<NavbarPageMainPage> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavBarConfig(),
      ),
    );
  }

//custom widgets
  Widget BottomNavBarConfig() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            )
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          iconSize: 25.0,
          selectedItemColor: const Color.fromRGBO(69, 137, 216, 1),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          currentIndex: selectedIndex,
          onTap: navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  } //BottomNavBarConfig


}
