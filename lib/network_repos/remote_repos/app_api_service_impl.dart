import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/models/login_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/signup_response.dart';
import 'package:store_app/utils/app_constants.dart';

import 'app_api_service.dart';

class AppApiServiceImpl implements AppApiService {
  static late Dio dio;

  static AppApiServiceImpl instance = AppApiServiceImpl();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  @override
  Future<List<Product>> getProductCategoryData(String category) async {
    try {
      Response response = await dio.get('$baseUrl/category/$category');
      if (response.statusCode == 200) {
        var jsonData = response.data;
        log('Category Products Data: $jsonData');
        List<Product> products = (jsonData as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        return products;
      }
    } catch (e) {
      throw Exception('Failed to load category products: $e');
    }
    // throw UnimplementedError();
    return [];
  }

  @override
  Future<List<Product>> getProductData() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        var jsonData = response.data;
        // log('Products Data: ${jsonData[0]['title']}');
        List<Product> products = (jsonData as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        return products;
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProductData(String query) async {
    try {
      Response response =
          await dio.get('$baseUrl/search', queryParameters: {'q': query});
      if (response.statusCode == 200) {
        var jsonData = response.data;
        log('Search Products Data: $jsonData');
        List<Product> products = (jsonData as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();

        return products;
      }
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
    throw UnimplementedError();
  }

  @override
  Future<Login> loginUser(
      {required String userName, required String password}) async {
    try {
      Response response = await dio.post(
        loginUrl,
        data: {
          'username': userName,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        var jsonData = response.data;
        log('Login BODY Data: $jsonData');
        Login login = Login.fromJson(jsonData);
        log(login.token ?? '');

        return login;
      }
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
    throw UnimplementedError();
  }

  @override
  Future<void> signupUser({SignupResponse? signupResponse}) async {
    try {
      Response response = await dio.post(
        signupUrl,
        data: {
          // 'username': 'abc123',
          // 'email': 'abc123@example.com',
          // 'password': 'password123',
          'username': signupResponse?.username,
          'email': signupResponse?.email,
          'password': signupResponse?.password,
        },
      ) as Response<Object?>;
      if (response.statusCode == 201) {
        var jsonData = response.data;
        log('Signup BODY Data: $jsonData');
        log('User signed up successfully ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to signup user: $e');
    }
  }
}
