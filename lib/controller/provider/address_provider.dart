import 'package:flutter/material.dart';
import 'package:sukify/controller/services/user_crud_services/user_crud_services.dart';
import 'package:sukify/model/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];

  AddressModel currentSelectedAddress = AddressModel();

  bool? fetchedCurrentSelectedAddress = false;

  bool? fetchedAllAddress = false;

  bool addressPresent = false;

  getAllAddress() async {
    allAddressModel = await UserDataCRUD.getAllAddress();
    fetchedAllAddress = true;

    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
    addressPresent = await UserDataCRUD.checkUsersAddress();
    fetchedCurrentSelectedAddress = true;
    notifyListeners();
  }
}
