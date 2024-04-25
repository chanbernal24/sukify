// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_best_selling.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_carousel.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_categories.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_new_arrival.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_search_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StickyHeader(
              header: SearchBarConfig(),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Carousel(),
                  const SizedBox(height: 34),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Categories(),
                  const SizedBox(height: 22),
                  NewArrivalText(),
                  const SizedBox(height: 26),
                  NewArrival(),
                  const SizedBox(height: 30),
                  BestSellingText(),
                  const SizedBox(height: 26),
                  BestSelling(),
                  const SizedBox(height: 20)
                ], //children
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget NewArrivalText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'New Arrival',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, .2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  } //NewArrivalText

  Widget BestSellingText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Best Selling',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, .2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  } //BestSellingText
}
