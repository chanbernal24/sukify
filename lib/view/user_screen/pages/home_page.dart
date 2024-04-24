// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/constants/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(82),
        child: SearchBarConfig(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
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
          ],
        ),
      ),
    );
  }

  Widget SearchBarConfig() {
    return Container(
      height: 82.0,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .88,
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
                    color: Color.fromRGBO(69, 137, 216, .5),
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

  Widget Categories() {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (content, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, .1),
              ),
            ),
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'lib/assets/categories/${categories[index]}.png',
                      ),
                      height: 72,
                    ),
                    Text(
                      categories[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        color: Color.fromRGBO(53, 53, 53, 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  } //Categories

  Widget Carousel() {
    return SizedBox(
      height: 130,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          //FIRST FEATURED PRODUCT
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * .52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/carousel_holder1.jpg'),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),

          //SECOND FEATURED PRODUCT
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * .52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/carousel_holder2.jpg'),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  } //Carousel
}
