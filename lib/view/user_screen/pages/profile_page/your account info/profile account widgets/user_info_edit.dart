import 'package:flutter/material.dart';

class UserInfoEdit extends StatefulWidget {
  const UserInfoEdit({super.key});

  @override
  State<UserInfoEdit> createState() => _UserInfoEditState();
}

class _UserInfoEditState extends State<UserInfoEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Name:',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color.fromRGBO(0, 0, 0, .5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              child: const TextField(
                cursorColor: Color.fromRGBO(69, 137, 216, 1),
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1)),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, .2)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(69, 137, 216, 1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Address:',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color.fromRGBO(0, 0, 0, .5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              child: const TextField(
                cursorColor: Color.fromRGBO(69, 137, 216, 1),
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1)),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, .2)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(69, 137, 216, 1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Phone No.:',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color.fromRGBO(0, 0, 0, .5)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              child: const TextField(
                cursorColor: Color.fromRGBO(69, 137, 216, 1),
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1)),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, .2)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(69, 137, 216, 1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
