import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sukify/controller/provider/auth_provider/auth_provider.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';
import 'package:sukify/view/otp_screen/otp_screen.dart';

class Authservices {
  static bool isUserAuthenticated() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(BuildContext context, String mobileNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
          phoneNumber: mobileNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            log(credential.toString());
          },
          verificationFailed: (FirebaseAuthException exception) {
            log(exception.toString());
          },
          codeSent: (String verificationID, int? resendToken) {
            context.read<Authprovider>().updateVerificationID(
                  verificationID: verificationID,
                );
            context.read<Authprovider>().updatePhoneNumber(
                  num: mobileNumber,
                );
            Navigator.push(
                context,
                PageTransition(
                    child: OTPScreen(mobileNumber: mobileNumber),
                    type: PageTransitionType.rightToLeft));
          },
          codeAutoRetrievalTimeout: (String verificationID) {});
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, String? otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: context.read<Authprovider>().verificationId!,
          smsCode: otp!);
      await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          PageTransition(
              child: SignInLogic(), type: PageTransitionType.rightToLeft));
    } catch (e) {}
  }
}
