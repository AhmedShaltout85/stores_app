import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../network_repos/remote_repos/app_api_service_impl.dart';

class ProductProvider with ChangeNotifier {
  final appApiServiceImpl = AppApiServiceImpl.getInstance;

  List<Product> newsList = [];
  List<String> categoryProductListWithRedundancy = ["All"];
  List<String> categoryProductList = [];
  List<Product> categoryProductListData = [];

  bool isLoading = false;

  Future<void> getProductData() async {
    newsList = await appApiServiceImpl.getProductData();
    for (var product in newsList) {
      debugPrint('Product Title: ${product.category}');
      categoryProductListWithRedundancy.add(product.category);
    }
    // log('Category List: $categoryProductListWithRedundancy');
    List<String> categoryProductList = categoryProductListWithRedundancy.toSet().toList();
    categoryProductListWithRedundancy = categoryProductList;
    log('Unique Category List: $categoryProductList');
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryProductData(String category) async {
    categoryProductListData =
        await appApiServiceImpl.getProductCategoryData(category);
    isLoading = true;
    notifyListeners();
  }

  void searchProduct(String query) {
    if (query.isEmpty || query == ' ') {
      getProductData();
    } else {
      newsList = newsList
          .where((product) =>
              product.title.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();

      notifyListeners();
    }
  }
}
