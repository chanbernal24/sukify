// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

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
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CarouselSlider.builder(
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
            )
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
      );
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
