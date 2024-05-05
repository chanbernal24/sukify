import 'dart:convert';

class AddressModel {
  String? name;
  String? mobileNumber;
  String? houseNumber;
  String? area;
  String? landmark;
  String? pincode;
  String? town;
  String? city;
  String? isDefault;

  AddressModel(
      {this.name,
      this.mobileNumber,
      this.houseNumber,
      this.area,
      this.landmark,
      this.pincode,
      this.town,
      this.city,
      this.isDefault});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNumber': mobileNumber,
      'houseNumber': houseNumber,
      'area': area,
      'landmark': landmark,
      'pincode': pincode,
      'town': town,
      'city': city,
      'isDefault': isDefault
    };
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'],
      mobileNumber: map['mobileNumber'],
      houseNumber: map['houseNumber'],
      area: map['area'],
      landmark: map['landmark'],
      pincode: map['pincode'],
      town: map['town'],
      city: map['city'],
      isDefault: map['isDefault'],
    );
  }

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
