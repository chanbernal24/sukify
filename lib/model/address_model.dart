import 'dart:convert';

class AddressModel {
  String? name;
  String? mobileNumber;
  String? authenticatedMobileNumber;
  String? houseNumber;
  String? pincode;
  String? city;
  String? docID;
  bool? isDefault;

  AddressModel(
      {this.name,
      this.mobileNumber,
      this.authenticatedMobileNumber,
      this.houseNumber,
      this.pincode,
      this.city,
      this.docID,
      this.isDefault});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNumber': mobileNumber,
      'authenticatedMobileNumber': authenticatedMobileNumber,
      'houseNumber': houseNumber,
      'pincode': pincode,
      'city': city,
      'docID': docID,
      'isDefault': isDefault
    };
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'],
      mobileNumber: map['mobileNumber'],
      authenticatedMobileNumber: map['authenticatedMobileNumber'],
      houseNumber: map['houseNumber'],
      pincode: map['pincode'],
      city: map['city'],
      docID: map['docID'],
      isDefault: map['isDefault'],
    );
  }

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
