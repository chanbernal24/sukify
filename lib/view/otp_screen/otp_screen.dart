import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {
  String mobileNumber;

  OTPScreen({super.key, required this.mobileNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Image(
        //   image: AssetImage("lib/assets/sukify_logo_colored.png"),
        //   height: MediaQuery.of(context).size.height * .10,
        // ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "lib/assets/otp_picture.jpg",
                width: MediaQuery.of(context).size.width * .6,
              ),
            ),
            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter the OTP sent to ",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, .4)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.mobileNumber,
                    style: const TextStyle(
                        color: Color.fromRGBO(69, 137, 216, 1),
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            PinCodeTextField(
              defaultBorderColor: Colors.black26,
              hasTextBorderColor: Color.fromRGBO(69, 137, 216, 1),
              pinBoxRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
