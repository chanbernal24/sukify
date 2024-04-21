import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sukify/view/login_screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String currentCountryCode = "+63";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 82,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(78, 0, 78, 0),
                child: SizedBox(
                  width: 217,
                  height: 217,
                  child: Image.asset("lib/assets/sukify_logo_colored.png"),
                ),
              ),
              userField(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  countryPicker(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .68,
                      child: numberField()),
                ],
              ),
              loginRow(),
              const SizedBox(
                height: 30,
              ),
              enrollText(),
              const SizedBox(
                height: 16,
              ),
              createButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget backButton() {
  //   return IconButton(
  //       padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  //       color: Colors.black,
  //       onPressed: () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: ((context) => LoginScreen()),
  //             ));
  //       },
  //       icon: const Icon(Icons.arrow_back));
  // } //backButton

  Widget countryPicker() {
    return InkWell(
      onTap: () {
        showCountryPicker(
            context: context,
            onSelect: (val) {
              setState(() {
                currentCountryCode = '+${val.phoneCode}';
              });
            });
      },
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .06,
        width: MediaQuery.of(context).size.width * .22,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(69, 137, 246, 1),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        ),
        child: Text(
          currentCountryCode,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 28),
        ),
      ),
    );
  } //countryPicker

  Widget numberField() {
    return const TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: "Phone number",
        hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        prefixIcon: Icon(
          Icons.phone_outlined,
          color: Color.fromRGBO(0, 0, 0, .2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, .2),
          ),
        ),
      ),
    );
  } //numberField

  Widget userField() {
    return const TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: "Username",
        hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        prefixIcon: Icon(
          Icons.person_2_outlined,
          color: Color.fromRGBO(0, 0, 0, .2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, .2),
          ),
        ),
      ),
    );
  }

  Widget createButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FilledButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(69, 137, 216, 1))),
        onPressed: () {},
        child: const Text(
          "Sign up",
        ),
      ),
    ); //userField
  }

  Widget enrollText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "By enrolling your mobile phone number, you consent to receive automated security notifications via text message from Sukify.",
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
      ),
    );
  }

  Widget loginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => LoginScreen()),
                  ));
            },
            child: const Text(
              "Log In",
              style: TextStyle(color: Color.fromRGBO(69, 137, 216, 1)),
            ))
      ],
    );
  }
}
