import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileGreetings extends StatefulWidget {
  const ProfileGreetings({super.key});

  @override
  State<ProfileGreetings> createState() => _ProfileGreetingsState();
}

class _ProfileGreetingsState extends State<ProfileGreetings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Miles Morales',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('lib/assets/miles.jpg'),
          )
        ],
      ),
    );
  }
}
