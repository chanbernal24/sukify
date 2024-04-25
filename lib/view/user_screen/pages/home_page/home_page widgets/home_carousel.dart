import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          //FIRST FEATURED PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
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
            padding: const EdgeInsets.all(10),
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
  }
}
