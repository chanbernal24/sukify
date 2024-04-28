import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/constants/constants.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({super.key});

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: bestSellingPhoto.length,
        itemBuilder: (content, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/best_selling/${bestSellingPhoto[index]}.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, .1),
              ),
            ),
            margin: const EdgeInsets.only(right: 14),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        bestSellingPhoto[index],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            '\$${bestSellingPrices[index]}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.star_border_outlined,
                            color: Color.fromRGBO(240, 240, 240, 1),
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            bestSellingRatings[index],
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
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
