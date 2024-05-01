import 'package:flutter/material.dart';
import 'package:sukify/view/user_screen/pages/profile_page/profile%20page%20widgets/profile_greetings.dart';
import 'package:sukify/view/user_screen/pages/profile_page/profile%20page%20widgets/profileButtons.dart';
import 'package:sukify/view/user_screen/pages/profile_page/profile%20page%20widgets/profile_order_history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileGreetings(),
              SizedBox(height: 21),
              YourButtons(),
              SizedBox(height: 31),
              OrderHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
