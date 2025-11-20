
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../network_repos/remote_repos/app_api_service_impl.dart';

class ProductProvider with ChangeNotifier {
  final appApiServiceImpl = AppApiServiceImpl.getInstance;

  List<Product> productList = [];
  List<String> categoryProductList = ["All", "men's clothing", "jewelery", "electronics", "women's clothing"];
  // List<Product> categoryProductListData = [];

  bool isLoading = false;

  Future<void> getProductData() async {
    productList = await appApiServiceImpl.getProductData();
    // for (var product in productList) {
    //   debugPrint('Product Title: ${product.category}');
    //   categoryProductListWithRedundancy.add(product.category);
    // }
    // // log('Category List: $categoryProductListWithRedundancy');
    // List<String> categoryProductList = categoryProductListWithRedundancy.toSet().toList();
    // categoryProductListWithRedundancy = categoryProductList;
    // log('Unique Category List: $categoryProductList');
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryProductData(String category) async {
    if (category == "All") {
      getProductData();
      return;
      
    }
    productList =
        await appApiServiceImpl.getProductCategoryData(category);
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
