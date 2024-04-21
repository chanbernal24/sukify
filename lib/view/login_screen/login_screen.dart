import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sukify/view/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  String currentCountryCode = "+63";

  bool isEyeTapped = true;
  void setEye() {
    setState(
      () {
        isEyeTapped = !isEyeTapped;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Text(""),
        toolbarHeight: 82,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Container(
                width: 217,
                height: 217,
                child: Image.asset("lib/assets/sukify_logo_colored.png"),
              ),
              Row(
                children: [
                  countryPicker(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .68,
                      child: emailTextField())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              loginButton(),
              signUpRow(),
              const SizedBox(
                height: 50,
              ),
              connectRow(),
              const SizedBox(
                height: 22,
              ),
              googleAndFacebookButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
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
  }

  Widget passwordTextField() {
    return TextField(
      obscureText: isEyeTapped ? true : false,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: "Password",
        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: Color.fromRGBO(0, 0, 0, .2),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setEye();
          },
          icon: isEyeTapped
              ? Icon(Icons.visibility_outlined)
              : Icon(Icons.visibility_off_outlined),
          color: const Color.fromRGBO(0, 0, 0, .2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, .2),
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordButton() {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 47,
      child: FilledButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(69, 137, 216, 1))),
        onPressed: () {},
        child: Text(
          "Login",
        ),
      ),
    );
  }

  Widget signUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SignupScreen()),
                  ));
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Color.fromRGBO(69, 137, 216, 1)),
            ))
      ],
    );
  }

  Widget connectRow() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color.fromRGBO(194, 194, 194, .4),
          ),
        ),
        Text(
          "or connect with",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        ),
        Expanded(
          child: Divider(
            color: Color.fromRGBO(194, 194, 194, .4),
          ),
        ),
      ],
    );
  }

  Widget googleAndFacebookButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 28),
            height: 40,
            child: Image.asset("lib/assets/googlelogo.png"),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(30)),
          ),
          onTap: () {},
        ),
        IconButton.filled(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromRGBO(69, 137, 216, 1))),
          onPressed: () {},
          icon: const Icon(Icons.facebook_rounded, color: Colors.white),
        )
      ],
    );
  }

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
        decoration: BoxDecoration(
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
  }
}
