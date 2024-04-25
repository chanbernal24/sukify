import 'package:flutter/material.dart';

class NewArrival extends StatefulWidget {
  const NewArrival({super.key});

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          //FIRST NEW ARRIVAL PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/new_arrivals/newarrival1.png'),
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
                Text(
                  '\$00',
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
            width: 14,
          ),

          //SECOND NEW ARRIVAL PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/new_arrivals/newarrival2.png'),
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
                Text(
                  '\$00',
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
            width: 14,
          ),

          //THIRD NEW ARRIVAL PRODUCT
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/new_arrivals/newarrival3.png'),
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
                Text(
                  '\$00',
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
