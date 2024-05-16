import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProductModel {
  final List<String>? imagesURL;
  final String? name;
  final String? category;
  final String? description;
  final String? brandName;
  final String? countryOfOrigin;
  final String? price;
  final String? productID;
  final String? productSellerID;
  final bool? inStock;
  final int? itemCount;
  final DateTime? uploadedAt;
  UserProductModel({
    this.imagesURL,
    this.name,
    this.category,
    this.description,
    this.brandName,
    this.countryOfOrigin,
    this.price,
    this.productID,
    this.productSellerID,
    this.inStock,
    this.itemCount,
    this.uploadedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagesURL': imagesURL,
      'name': name,
      'category': category,
      'description': description,
      'brandName': brandName,
      'countryOfOrigin': countryOfOrigin,
      'price': price,
      'productID': productID,
      'productSellerID': productSellerID,
      'inStock': inStock,
      'itemCount': itemCount,
      'uploadedAt': uploadedAt?.millisecondsSinceEpoch,
    };
  }

  factory UserProductModel.fromMap(Map<String, dynamic> map) {
    return UserProductModel(
      imagesURL: map['imagesURL'] != null
          ? List<String>.from((map['imagesURL'] as List<dynamic>)).toList()
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      brandName: map['brandName'] != null ? map['brandName'] as String : null,
      countryOfOrigin: map['countryOfOrigin'] != null
          ? map['countryOfOrigin'] as String
          : null,
      price: map['price'] != null ? map['price'] as String : null,
      productID: map['productID'] != null ? map['productID'] as String : null,
      productSellerID: map['productSellerID'] != null
          ? map['productSellerID'] as String
          : null,
      inStock: map['inStock'] != null ? map['inStock'] as bool : null,
      itemCount: map['itemCount'] != null ? map['itemCount'] as int : null,
      uploadedAt: map['uploadedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['uploadedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProductModel.fromJson(String source) =>
      UserProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
