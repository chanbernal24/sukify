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
      resizeToAvoidBottomInset: false,
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
            imageOTP(),
            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            OTPnumber(),
            SizedBox(
              height: 10,
            ),
            pincodeField(),
            SizedBox(
              height: 30,
            ),
            verifyButton(),
          ],
        ),
      ),
    );
  }

  Widget imageOTP() {
    return Center(
      child: Image.asset(
        "lib/assets/otp_picture.jpg",
        width: MediaQuery.of(context).size.width * .6,
      ),
    );
  }

  Widget OTPnumber() {
    return Row(
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
    );
  }

  Widget pincodeField() {
    return const PinCodeTextField(
      defaultBorderColor: Colors.black26,
      hasTextBorderColor: Color.fromRGBO(69, 137, 216, 1),
      pinBoxRadius: 10,
      pinTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget verifyButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .64,
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        child: const Text("Verify"),
      ),
    );
  }
}
