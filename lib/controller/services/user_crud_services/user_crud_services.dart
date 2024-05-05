import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/model/address_model.dart';
import 'package:sukify/model/user_model.dart';
import 'package:sukify/view/login_screen/signInLogic.dart';
import 'package:uuid/uuid.dart';

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

  static Future addUserAddress({
    required BuildContext context,
    required AddressModel addressModel,
    required docID,
  }) async {
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log("Data added");
        showToast(context: context, message: "Your address has been added.");
        log(auth.currentUser!.phoneNumber.toString());
        Navigator.pop(context);
      });
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUsersAddress() async {
    bool isAddressPresent = false;
    try {
      final querySnapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          // .where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber)
          .get();
      isAddressPresent = querySnapshot.size > 0;
      //     .then((value) {
      //   value.size < 0 ? isUserPresent = true : isUserPresent = false;
      // });
    } catch (e) {
      log(e.toString());
    }
    return isAddressPresent;
  }

  static Future<List<AddressModel>> getAllAddress() async {
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        allAddress.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      log('error found');
      log(e.toString());
    }
    for (var data in allAddress) {
      log(data.toMap().toString());
    }
    return allAddress;
  }

  static Future getCurrentSelectedAddress() async {
    AddressModel defaultAddress = AddressModel();

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      log('error found');
      log(e.toString());
    }
    return defaultAddress;
  }
}
