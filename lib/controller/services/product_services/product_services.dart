import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/provider/product_provider/product_provider.dart';
import 'package:sukify/model/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      showToast(context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static uploadImageToFirebaseStorage({
    required List<File> images,
    required BuildContext context,
  }) async {
    List<String> imagesURL = [];
    String sellerUID = auth.currentUser!.phoneNumber!;
    Uuid uuid = const Uuid();

    await Future.forEach(images, (image) async {
      String imageName = '$sellerUID${uuid.v1().toString()}';
      Reference ref = storage.ref().child('Product_Images').child(imageName);
      await ref.putFile(File(image.path));
      String imageURL = await ref.getDownloadURL();
      imagesURL.add(imageURL);
    });
    log(imagesURL.toList().toString());
    context
        .read<SellerProductProvider>()
        .updateProductImagesURL(imageURLs: imagesURL);
  }

  static Future addProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection('Products')
          .doc(productModel.productID)
          .set(productModel.toMap())
          .whenComplete(() {
        log('Data Added');
        context.read<SellerProductProvider>().fecthSellerProducts();
        Navigator.pop(context);

        showToast(context: context, message: 'Product Added Successful');
      });
    } catch (e) {
      log(e.toString());
      showToast(context: context, message: e.toString());
    }
  }

  static Future<List<ProductModel>> getSellersProducts() async {
    List<ProductModel> sellersProducts = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('uploadedAt', descending: true)
          .where('productSellerID', isEqualTo: auth.currentUser!.phoneNumber)
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

  static Future<List<ProductModel>> getSellersProductsToUser() async {
    List<ProductModel> sellersProducts = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('uploadedAt', descending: true)
          .where('productSellerID', isEqualTo: "+639638527411")
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
}
