import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        const CircleAvatar(
          radius: 37,
          backgroundColor: Color.fromRGBO(212, 212, 212, 1),
        ),
        Positioned(
            top: 11,
            left: 12,
            child: IconButton(
                iconSize: 35,
                onPressed: () {},
                icon: Icon(Icons.add_photo_alternate_outlined)))
      ]),
    );
  }
}
