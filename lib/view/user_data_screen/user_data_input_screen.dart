import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/services/user_crud_services/user_crud_services.dart';
import 'package:sukify/model/user_model.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputState();
}

class _UserDataInputState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mobileNumberController.text = auth.currentUser!.phoneNumber ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    nameField(),
                    mobileNumberField(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment(-1, .2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      UserModel userModel = UserModel(
                          name: nameController.text.trim(),
                          mobileNum: mobileNumberController.text.trim(),
                          userType: 'user');
                      await UserDataCRUD.addNewUSer(
                          context: context, userModel: userModel);
                    },
                    child: Text("Proceed"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextField(
      controller: nameController,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: "Name",
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

  Widget mobileNumberField() {
    return TextField(
      controller: mobileNumberController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: "Mobile number",
        hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        prefixIcon: Icon(
          Icons.call_end_outlined,
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
}
