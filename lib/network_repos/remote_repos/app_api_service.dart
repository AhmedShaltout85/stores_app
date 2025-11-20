

import 'package:store_app/models/product_model.dart';

abstract class AppApiService {

  Future<List<Product>> getProductData();
  Future<List<Product>> getProductCategoryData(String category);
  Future<List<Product>> searchProductData(String query);
}