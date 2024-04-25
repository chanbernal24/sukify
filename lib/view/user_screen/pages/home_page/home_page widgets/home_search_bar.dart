import 'package:flutter/material.dart';

class SearchBarConfig extends StatefulWidget {
  const SearchBarConfig({super.key});

  @override
  State<SearchBarConfig> createState() => _SearchBarConfigState();
}

class _SearchBarConfigState extends State<SearchBarConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.0,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .88,
            height: 52.0,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 1),
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
  } //SearchBarConfig;
}
