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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(82),
          child: SearchBarConfig(),
        ),
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

  Widget SearchBarConfig() {
    return Container(
      height: 82.0,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 335.0,
            height: 52.0,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Search....',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, .2),
                  fontFamily: 'Inter',
                ),
                contentPadding: const EdgeInsets.all(18.0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  } //SearchBarConfig
}
