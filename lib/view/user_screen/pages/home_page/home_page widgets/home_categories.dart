import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: MediaQuery.of(context).size.width,
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
  }
}
