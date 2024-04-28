import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/constants/constants.dart';

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
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: carouselPhoto.length,
        itemBuilder: (content, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .52,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/carousel/${carouselPhoto[index]}.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Featured',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        carouselPhoto[index],
                        style: const TextStyle(
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
        },
      ),
    );
  }
}
