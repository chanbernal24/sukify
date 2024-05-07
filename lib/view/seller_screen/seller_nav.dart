import 'package:flutter/material.dart';
import 'package:sukify/view/seller_screen/seller_pages/seller_home.dart';
import 'package:sukify/view/seller_screen/seller_pages/seller_menu.dart';

class SellerNavBar extends StatefulWidget {
  const SellerNavBar({super.key});

  @override
  State<SellerNavBar> createState() => _SellerNavBarState();
}

final List<Widget> pages = [
  SellerHomeScreen(),
  SellerMenuScreen(),
];

class _SellerNavBarState extends State<SellerNavBar> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: SellerNav(),
    );
  }

  Widget SellerNav() {
    return Container(
      clipBehavior: Clip.hardEdge,
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
        clipBehavior: Clip.hardEdge,
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
              icon: Icon(Icons.menu_outlined),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
