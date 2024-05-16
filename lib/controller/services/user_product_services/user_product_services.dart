import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/model/product_model.dart';
import 'package:sukify/model/user_product_model.dart';
import 'package:uuid/uuid.dart';

class UsersProductService {
  static Future<List<ProductModel>> getProducts(String name) async {
    List<ProductModel> sellersProducts = [];
    if (name.isEmpty) {
      return sellersProducts;
    }
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('name')
          .startAt([name.toUpperCase()]).endAt(
              ['${name.toLowerCase()}\uf8ff']).get();

      snapshot.docs.forEach((element) {
        sellersProducts.add(ProductModel.fromMap(element.data()));
      });
      log(sellersProducts.toList().toString());
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    log(sellersProducts.toList().toString());
    return sellersProducts;
  }

  static Future addProductToCart({
    required BuildContext context,
    required UserProductModel productModel,
  }) async {
    try {
      await firestore
          .collection('Cart')
          .doc(auth.currentUser!.phoneNumber)
          .collection('myCart')
          .where('productID', isEqualTo: productModel.productID)
          .get()
          .then((value) async {
        if (value.size < 1) {
          await firestore
              .collection('Cart')
              .doc(auth.currentUser!.phoneNumber)
              .collection('myCart')
              .doc(productModel.productID)
              .set(productModel.toMap())
              .whenComplete(() {
            log('Data Added');

            showToast(context: context, message: 'Product Added Successful');
          });
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(context: context, message: e.toString());
    }
  }

  static Stream<List<UserProductModel>> fetchCartProducts() => firestore
      .collection('Cart')
      .doc(auth.currentUser!.phoneNumber)
      .collection('myCart')
      .orderBy('name', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            return UserProductModel.fromMap(doc.data());
          }).toList());

  static Future<void> updateCountCartProduct({
    required String productId,
    required int newCount,
    required BuildContext context,
  }) async {
    final collectionRef = firestore
        .collection('Cart')
        .doc(auth.currentUser!.phoneNumber)
        .collection('myCart');

    try {
      final snapshot =
          await collectionRef.where('productID', isEqualTo: productId).get();

      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs[0].id;
        await collectionRef.doc(docId).update({'itemCount': newCount});
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
  }

  static Future<void> removeProductfromCart({
    required String productId,
    required BuildContext context,
  }) async {
    final collectionRef = firestore
        .collection('Cart')
        .doc(auth.currentUser!.phoneNumber)
        .collection('myCart');

    try {
      final snapshot =
          await collectionRef.where('productID', isEqualTo: productId).get();

      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs[0].id;
        await collectionRef.doc(docId).delete();
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    }
  }

  static Future fetchProductBasedOnCategory({required String category}) async {
    List<ProductModel> sellersProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .where('category', isEqualTo: category)
          .get();
      snapshot.docs.forEach((element) {
        sellersProducts.add(ProductModel.fromMap(element.data()));
      });
      log(sellersProducts.toList().toString());
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    log(sellersProducts.toList().toString());
    return sellersProducts;
  }

  static Future addOrder({
    required BuildContext context,
    required UserProductModel productModel,
  }) async {
    try {
      Uuid uuid = Uuid();
      await firestore
          .collection('Orders')
          .doc(auth.currentUser!.phoneNumber)
          .collection('myOrders')
          .doc(productModel.productID! + uuid.v1())
          .set(productModel.toMap())
          .whenComplete(() {
        log('Data Added');

        showToast(context: context, message: 'Product Ordered Successful');
      });
    } catch (e) {
      log(e.toString());
      showToast(context: context, message: e.toString());
    }
  }

  static Future fetchCart() async {
    List<UserProductModel> sellersProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Cart')
          .doc(auth.currentUser!.phoneNumber)
          .collection('myCart')
          .get();
      snapshot.docs.forEach((element) {
        sellersProducts.add(UserProductModel.fromMap(element.data()));
      });
      log(sellersProducts.toList().toString());
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    log(sellersProducts.toList().toString());
    log(sellersProducts.toList().toString());
    return sellersProducts;
  }

  static Stream<List<UserProductModel>> fetchOrders() => firestore
      .collection('Orders')
      .doc(auth.currentUser!.phoneNumber)
      .collection('myOrders')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            return UserProductModel.fromMap(doc.data());
          }).toList());

  static Stream<List<UserProductModel>> fetchAllOrders() => firestore
      .collectionGroup('myOrders')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            return UserProductModel.fromMap(doc.data());
          }).toList());
}
