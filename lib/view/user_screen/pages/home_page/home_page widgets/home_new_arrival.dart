import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';

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
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: newArrivalPhoto.length,
        itemBuilder: (content, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/new_arrivals/${newArrivalPhoto[index]}.png'),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      newArrivalPhoto[index],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                    ),
                    Text(
                      '\$${newArrivalPrices[index]}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Color.fromRGBO(240, 240, 240, 1),
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
  }
}
