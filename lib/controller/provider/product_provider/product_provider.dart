import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sukify/controller/services/product_services/product_services.dart';
import 'package:sukify/model/product_model.dart';

class SellerProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesURL = [];
  List<ProductModel> products = [];
  List<ProductModel> userProducts = [];
  bool sellerProductsFetched = false;
  bool userProductsFetched = false;

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  uploadProductImagesToFirebaseStorage(
      {required BuildContext context, required List<File> images}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  updateProductImagesURL({required List<String> imageURLs}) async {
    productImagesURL = imageURLs;
    notifyListeners();
  }

  fecthSellerProducts() async {
    products = await ProductServices.getSellersProducts();
    sellerProductsFetched = true;
    notifyListeners();
  }

  fecthSellerProductsToUser() async {
    userProducts = await ProductServices.getSellersProductsToUser();
    userProductsFetched = true;
    notifyListeners();
  }

  emptyProductImagesList() {
    productImages = [];
    notifyListeners();
  }
}
