import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../network_repos/remote_repos/app_api_service_impl.dart';

class ProductProvider with ChangeNotifier {
  List<Product> productList = [];
  List<String> categoryProductList = [
    "All",
    "men's clothing",
    "jewelery",
    "electronics",
    "women's clothing"
  ];

  bool isLoading = false;

  Future<void> getProductData() async {
    productList = await AppApiServiceImpl.instance.getProductData();

    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryProductData(String category) async {
    if (category == "All") {
      getProductData();
      return;
    }
    productList =
        await AppApiServiceImpl.instance.getProductCategoryData(category);
    isLoading = true;
    notifyListeners();
  }

  void searchProduct(String query) {
    if (query.isEmpty || query == ' ') {
      getProductData();
    } else {
      productList = productList
          .where((product) =>
              product.title.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();

      notifyListeners();
    }
  }
}
