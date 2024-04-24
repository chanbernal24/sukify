import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String? phoneNumber;
  String? verificationId;
  String? otp;

  updatePhoneNumber({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  updateVerificationID({required String verificationID}) {
    verificationId = verificationID;
    notifyListeners();
  }
}
