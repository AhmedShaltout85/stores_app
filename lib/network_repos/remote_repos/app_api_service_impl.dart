import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/app_constants.dart';

import 'app_api_service.dart';

class AppApiServiceImpl implements AppApiService {
  late Dio dio;

  // Private constructor
  AppApiServiceImpl._() {
    dio = Dio();
  }

  static final AppApiServiceImpl _instance = AppApiServiceImpl._();
  static final AppApiServiceImpl getInstance = AppApiServiceImpl._();
  // Factory constructor returns the same instance
  factory AppApiServiceImpl() => _instance;

  @override
  Future<List<Product>> getProductCategoryData(String category) async {
    try {
      Response response = await dio.get('$baseUrl/category/$category');
      if (response.statusCode == 200) {
        var jsonData = response.data;
        log('Category Products Data: $jsonData');
        List<Product> products = (jsonData as List).map((productJson) => Product.fromJson(productJson)).toList();

        return products;
      }
    } catch (e) {
      throw Exception('Failed to load category products: $e');
    }
    // throw UnimplementedError();
    return [];
  }

  @override
  Future<List<Product>> getProductData() async{
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        var jsonData = response.data;
        // log('Products Data: ${jsonData[0]['title']}');
        List<Product> products = (jsonData as List).map((productJson) => Product.fromJson(productJson)).toList();
     
        return products;
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProductData(String query)async {
    try {
      Response response = await dio.get('$baseUrl/search', queryParameters: {'q': query});
      if (response.statusCode == 200) {
        var jsonData = response.data;
        log('Search Products Data: $jsonData');
        List<Product> products = (jsonData as List).map((productJson) => Product.fromJson(productJson)).toList();

        return products;
      }
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
    throw UnimplementedError();

   
  }
}
