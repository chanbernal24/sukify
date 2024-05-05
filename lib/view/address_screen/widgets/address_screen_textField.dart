import 'package:flutter/material.dart';

class AddressScreenTextField extends StatelessWidget {
  AddressScreenTextField({
    super.key,
    this.hintText,
    this.controller,
    this.icon,
    this.isNumber,
  });
  TextEditingController? controller = TextEditingController();
  String? hintText;
  Icon? icon;
  bool? isNumber;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isNumber! ? TextInputType.number : TextInputType.name,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(69, 137, 216, 1),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
        prefixIcon: icon,
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
