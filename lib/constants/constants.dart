import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonFunctions {}

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

List<String> categories = [
  'Dress',
  'Jeans',
  'T-shirts',
  'Shoes',
  'Suits',
];

List<String> carouselPhoto = [
  'carousel_holder1',
  'carousel_holder2',
];

List<String> newArrivalPhoto = [
  'newarrival1',
  'newarrival2',
  'newarrival3',
];

List<String> newArrivalPrices = [
  '0.0',
  '0.0',
  '0.0',
];

List<String> bestSellingPhoto = [
  'bestselling1',
  'bestselling2',
  'bestselling3',
];

List<String> bestSellingPrices = [
  '0.0',
  '0.0',
  '0.0',
];

List<String> bestSellingRatings = [
  '0.0',
  '0.0',
  '0.0',
];

List<String> cartImages = [
  'hanfu.jpg',
  'knitted_fashion.jpg',
  'leather_jacket.jpg',
  'pink_shoes.jpg',
  'USA_shirt_woman.jpg',
  'woman_jacket.jpg'
];

List<String> cartProductName = [
  'Hanfu (Pink)- for Woman',
  'Knitted Jacket - Woman Fashion',
  'Black Leather Jacket - Men',
  'Original Converse - Pink',
  'USA shirt - Woman',
  'Fashion Jacket - Woman'
];

List<String> cartProductBrand = [
  'Hayamusa',
  'Appari',
  'Unknown',
  'Converse',
  'Blue Corner',
  'Louis Vuitton',
];

List<String> cartProductSize = [
  'M',
  'L',
  'L',
  '9',
  'S',
  'XL',
];

List<String> cartProductQuantity = [
  '1',
  '1',
  '1',
  '1',
  '1',
  '1',
];

List<String> cartProductPrice = [
  '2140',
  '100',
  '99999999999',
  '401',
  '221',
  '50',
];

List<String> orderHistoryPhoto = [
  'lib/assets/order_history/black_leather.jpeg',
  'lib/assets/order_history/coat.jpg',
  'lib/assets/order_history/plain_black.jpg',
  'lib/assets/order_history/simple_T-shirt.jpg',
  'lib/assets/order_history/socker.jpg',
];

List<String> orderHistoryPrices = [
  '421',
  '1236',
  '7772',
  '4123',
  '2531',
];

List<String> orderHistoryProduct = [
  'Black Leather Jacket',
  'Stylish Coat',
  'Plain Black T-shirt',
  'T-shirt | Light Bulb',
  'Argentina Soccer Team T-shirt',
];

dynamic showToast({required BuildContext context, required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16);
}
