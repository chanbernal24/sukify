import 'package:flutter/material.dart';
import 'package:sukify/controller/services/product_services/product_services.dart';
import 'package:sukify/model/product_model.dart';

import '../../services/user_product_services/user_product_services.dart';

class UsersProductProvider extends ChangeNotifier {
  List<ProductModel> searchedProducts = [];

  List<ProductModel> userProducts = [];

  bool productsFetched = false;
  bool userFetched = false;

  emptySearchedProductsList() {
    searchedProducts = [];
    notifyListeners();
  }

  getSearchedProducts({required String name}) async {
    searchedProducts = await UsersProductService.getProducts(name);
    productsFetched = true;
    notifyListeners();
  }

  getTheProducts({required String name}) async {
    searchedProducts = await ProductServices.getSellersProductsToUser();
    userFetched = true;
    notifyListeners();
  }
}
