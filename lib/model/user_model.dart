import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? address;
  String? userType;

  UserModel({this.name, this.address, this.userType});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'userType': userType,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      address: map['address'],
      userType: map['userType'],
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
