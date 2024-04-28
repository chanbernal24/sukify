import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/view/user_screen/pages/profile_page/your%20account%20info/profile%20account%20widgets/user_avatar.dart';
import 'package:sukify/view/user_screen/pages/profile_page/your%20account%20info/profile%20account%20widgets/user_edit_save.dart';
import 'package:sukify/view/user_screen/pages/profile_page/your%20account%20info/profile%20account%20widgets/user_info_edit.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        centerTitle: true,
        toolbarHeight: 82,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              UserAvatar(),
              SizedBox(height: 32),
              Text(
                'Basic Information',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              SizedBox(height: 28),
              UserInfoEdit(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: YourAccSaveInfo(),
      ),
    );
  }
}
