import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sukify/view/user_screen/pages/profile_page/your%20account%20info/user_account_settings.dart';

class YourButtons extends StatefulWidget {
  const YourButtons({super.key});

  @override
  State<YourButtons> createState() => _YourButtonsState();
}

class _YourButtonsState extends State<YourButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 47,
            width: MediaQuery.of(context).size.width * .43,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(69, 137, 216, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
                ),
                onPressed: () {},
                child: const Text(
                  'Your Orders',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(240, 240, 240, 1)),
                )),
          ),
          SizedBox(
            height: 47,
            width: MediaQuery.of(context).size.width * .43,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(69, 137, 216, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountInfo(),
                    ),
                  );
                },
                child: const Text(
                  'Your Account',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(240, 240, 240, 1)),
                )),
          ),
        ],
      ),
    );
  }
}
