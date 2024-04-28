import 'package:flutter/material.dart';

class YourAccSaveInfo extends StatefulWidget {
  const YourAccSaveInfo({super.key});

  @override
  State<YourAccSaveInfo> createState() => YourAccSaveInfoState();
}

class YourAccSaveInfoState extends State<YourAccSaveInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(69, 137, 216, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {},
          child: const Text(
            'SAVE',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(240, 240, 240, 1)),
          )),
    );
  }
}
