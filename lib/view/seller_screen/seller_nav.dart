import 'package:flutter/material.dart';
import 'package:sukify/view/seller_screen/seller_pages/seller_home/seller_home.dart';
import 'package:sukify/view/seller_screen/seller_pages/seller_home/seller_home_upload.dart';
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
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: SellerNav(),
        floatingActionButton: ExtendedFAB(),
      ),
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

  Widget ExtendedFAB() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 65,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, .1)),
      ),
      child: FloatingActionButton.extended(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SellerUpload()));
        },
        backgroundColor: Color.fromRGBO(69, 137, 216, 1),
        label: const Text(
          'Add',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        icon: Icon(Icons.add_sharp, color: Color.fromRGBO(255, 255, 255, 1)),
      ),
    );
  }
}
