import 'package:flutter/material.dart';

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
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          //FIRST BEST SELLING PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/best_selling/bestselling1.png'),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ProductName',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$00',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star_border_outlined,
                      color: Color.fromRGBO(240, 240, 240, 1),
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '0.0',
                      style: TextStyle(
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
          const SizedBox(
            width: 14,
          ),

          //SECOND BEST SELLING PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/best_selling/bestselling2.png'),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ProductName',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$00',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star_border_outlined,
                      color: Color.fromRGBO(240, 240, 240, 1),
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '0.0',
                      style: TextStyle(
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
          const SizedBox(
            width: 14,
          ),

          //THIRD BEST SELLING PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/best_selling/bestselling3.png'),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ProductName',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$00',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star_border_outlined,
                      color: Color.fromRGBO(240, 240, 240, 1),
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '0.0',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
