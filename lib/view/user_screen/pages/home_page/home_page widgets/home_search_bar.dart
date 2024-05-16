import 'package:flutter/material.dart';
import 'package:sukify/view/user_screen/search_product_display_screen/search_product_display_screen.dart';

class SearchBarConfig extends StatefulWidget {
  const SearchBarConfig({super.key});

  @override
  State<SearchBarConfig> createState() => _SearchBarConfigState();
}

class _SearchBarConfigState extends State<SearchBarConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, .2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FilledButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(255, 255, 255, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDisplayScreen()));
          },
          icon: const Icon(Icons.search_outlined,
              color: Color.fromRGBO(0, 0, 0, .2)),
          label: const Text(
            'Search...',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, .2)),
          )),
    );
  } //SearchBarConfig;
}
