

import 'package:store_app/models/login_model.dart';
import 'package:store_app/models/product_model.dart';

abstract class AppApiService {

  Future<List<Product>> getProductData();
  Future<List<Product>> getProductCategoryData(String category);
  Future<List<Product>> searchProductData(String query);
  Future<Login> loginUser({required String userName, required String password});
}