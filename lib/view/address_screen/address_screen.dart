import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/services/user_crud_services/user_crud_services.dart';
import 'package:sukify/model/address_model.dart';
import 'package:sukify/view/address_screen/widgets/address_screen_textField.dart';
import 'package:uuid/uuid.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? mobileNumberController = TextEditingController();
  TextEditingController? houseNumberController = TextEditingController();
  TextEditingController? areaController = TextEditingController();
  TextEditingController? landmarkController = TextEditingController();
  TextEditingController? pincodeController = TextEditingController();
  TextEditingController? townController = TextEditingController();
  TextEditingController? cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AddressScreenTextField(
                    isNumber: false,
                    controller: nameController,
                    hintText: 'Name',
                    icon: Icon(Icons.person_outline,
                        color: Color.fromRGBO(0, 0, 0, .2)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AddressScreenTextField(
                    isNumber: true,
                    controller: mobileNumberController,
                    hintText: 'Mobile number',
                    icon: Icon(Icons.phone_enabled_outlined,
                        color: Color.fromRGBO(0, 0, 0, .2)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AddressScreenTextField(
                          isNumber: true,
                          controller: houseNumberController,
                          hintText: 'House number',
                          icon: Icon(Icons.numbers_rounded,
                              color: Color.fromRGBO(0, 0, 0, .2)),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AddressScreenTextField(
                          isNumber: true,
                          controller: pincodeController,
                          hintText: 'Postal code',
                          icon: Icon(
                            Icons.pin_drop_outlined,
                            color: Color.fromRGBO(0, 0, 0, .2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AddressScreenTextField(
                    isNumber: false,
                    controller: cityController,
                    hintText: 'City',
                    icon: Icon(
                      Icons.location_city_rounded,
                      color: Color.fromRGBO(0, 0, 0, .2),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Uuid uuid = Uuid();
                    String docID = uuid.v1();
                    AddressModel addressModel = AddressModel(
                      name: nameController!.text.trim(),
                      mobileNumber: mobileNumberController?.text.trim(),
                      authenticatedMobileNumber: auth.currentUser?.phoneNumber,
                      houseNumber: houseNumberController?.text.trim(),
                      pincode: pincodeController?.text.trim(),
                      city: cityController?.text.trim(),
                      docID: docID,
                      isDefault: true,
                    );

                    UserDataCRUD.addUserAddress(
                      docID: docID,
                      context: context,
                      addressModel: addressModel,
                    );
                  },
                  child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
