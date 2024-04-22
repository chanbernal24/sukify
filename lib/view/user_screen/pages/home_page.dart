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
  final carouselImages = [
    'lib/assets/carousel_holder1.jpg',
    'lib/assets/carousel_holder2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(82),
        child: SearchBarConfig(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              ProductCarousel(),
              const SizedBox(height: 34),
              const Text(
                'Categories',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 18),
              Categories(),
              const SizedBox(height: 22),
            ],
          ),
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

  Widget ProductCarousel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 130,
        disableCenter: true,
        enableInfiniteScroll: false,
      ),
      itemCount: carouselImages.length,
      itemBuilder: (context, index, realIndex) {
        final carouselImage = carouselImages[index];

        return buildImage(carouselImage, index);
      },
    ); //ProductCarousel
  }

  Widget buildImage(String carouselImage, int index) => Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Image.asset(
          carouselImage,
          fit: BoxFit.cover,
        ),
      ); //buildImage | carousel display configs

  Widget Categories() {
    return SizedBox(
      height: 105,
      child: ListView.builder(
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
            child: Column(
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
          );
        },
      ),
    );
  }
}





// Widget ProductCarousel() {
//   return
// } //ProductCarousel

// return CarouselSlider(
//   options: CarouselOptions(
//     height: 130.0,
//     disableCenter: true,
//     enableInfiniteScroll: false,
//   ),
//   items: carouselList.map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: const EdgeInsets.symmetric(horizontal: 8.0),
//           decoration: BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: AssetImage('lib/assets/carousel_slides/${i}'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//     );
//   }).toList(),
// );
