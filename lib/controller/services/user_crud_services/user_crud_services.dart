import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/model/user_model.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';

class UserDataCRUD {
  static Future addNewUSer({
    required BuildContext context,
    required UserModel userModel,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        showToast(context: context, message: "New user added");
        log(auth.currentUser!.phoneNumber.toString());
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: SignInLogic(), type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool isUserPresent = false;
    try {
      final querySnapshot = await firestore
          .collection('users')
          .where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber)
          .get();
      isUserPresent = querySnapshot.size > 0;
      //     .then((value) {
      //   value.size < 0 ? isUserPresent = true : isUserPresent = false;
      // });
    } catch (e) {
      log(e.toString());
    }
    return isUserPresent;
  }
}
