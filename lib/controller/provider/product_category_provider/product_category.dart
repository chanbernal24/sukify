import 'package:flutter/cupertino.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/product_model.dart';

class ProductBasedOnCategoryProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool productsFetched = false;

  fetchProducts({required String category}) async {
    products = [];
    products = await UsersProductService.fetchProductBasedOnCategory(
        category: category);
    productsFetched = true;
    notifyListeners();
  }
}
