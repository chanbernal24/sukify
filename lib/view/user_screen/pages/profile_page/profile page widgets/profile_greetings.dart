import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/miles.jpg'),
          ),
          const SizedBox(height: 24),
          Text(
            'Hello, Miles Morales',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color.fromRGBO(0, 0, 0, .5),
                size: 25,
              ),
              SizedBox(width: 3),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      '123 Main Street, Anytown, Anywhere, USA, Pampanga, Muzon',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, .5)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
