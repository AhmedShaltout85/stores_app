import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:store_app/network_repos/remote_repos/app_api_service_impl.dart';
import '../models/login_model.dart';

class LoginProvider with ChangeNotifier {
  // API Service
  // final AppApiService _appApiServiceapiService;

  // Form fields
  String _username = '';
  String _password = '';

  // Validation states
  String _usernameError = '';
  String _passwordError = '';
  String _apiError = '';

  // UI states
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Success data
  Login? _loginResponse;
  String? _token;

  // Getters
  String get username => _username;
  String get password => _password;
  String get usernameError => _usernameError;
  String get passwordError => _passwordError;
  String get apiError => _apiError;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;
  bool get hasErrors =>
      _usernameError.isNotEmpty ||
      _passwordError.isNotEmpty ||
      _apiError.isNotEmpty;
  Login? get loginResponse => _loginResponse;
  String? get token => _token;

  // LoginProvider({required AppApiService appApiService})
  //     : _appApiServiceapiService = appApiService;

  // Setters with validation
  void setUsername(String value) {
    _username = value.trim();
    _validateUsername();
    _clearApiError();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _validatePassword();
    _clearApiError();
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Validation methods
  void _validateUsername() {
    if (_username.isEmpty) {
      _usernameError = 'Username is required';
    } else if (_username.length < 3) {
      _usernameError = 'Username must be at least 3 characters';
    // } else if (!_isValidEmail(_username)) {
    //   _usernameError = 'Please enter a valid email address';
    } else {
      _usernameError = '';
    }
  }

  void _validatePassword() {
    if (_password.isEmpty) {
      _passwordError = 'Password is required';
    } else if (_password.length < 6) {
      _passwordError = 'Password must be at least 6 characters';
    } else {
      _passwordError = '';
    }
  }

  // bool _isValidEmail(String email) {
  //   final emailRegex =
  //       RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  //   return emailRegex.hasMatch(email);
  // }

  void _clearApiError() {
    if (_apiError.isNotEmpty) {
      _apiError = '';
    }
  }

  void _setApiError(String error) {
    _apiError = error;
    notifyListeners();
  }

  // Form submission
  Future<LoginResult> submitLogin() async {
    _validateUsername();
    _validatePassword();

    if (hasErrors) {
      return LoginResult(
        success: false,
        error: 'Please fix validation errors',
      );
    }

    _isLoading = true;
    _clearApiError();
    notifyListeners();

    try {
      final response = await AppApiServiceImpl.instance.loginUser(
        userName: _username,
        password: _password,
      );

      _loginResponse = response;
      _token = response.token;

      // Clear sensitive data from memory
      _password = '';
      _isPasswordVisible = false;

      return LoginResult(
        success: true,
        loginResponse: response,
        message: 'Login successful!',
      );
    } on Login catch (e) {
      log(e.toString());

      return LoginResult(
        success: false,
        error: e.toString(),
      );
    } catch (e) {
      final errorMessage = e.toString().contains('timeout')
          ? 'Connection timeout. Please check your network.'
          : 'Network error. Please try again.';

      _setApiError(errorMessage);
      return LoginResult(
        success: false,
        error: errorMessage,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear form
  void clearForm() {
    _username = '';
    _password = '';
    _usernameError = '';
    _passwordError = '';
    _apiError = '';
    _isPasswordVisible = false;
    _loginResponse = null;
    _token = null;
    notifyListeners();
  }

  // Reset validation
  void resetValidation() {
    _usernameError = '';
    _passwordError = '';
    _apiError = '';
    notifyListeners();
  }

  // Check if form is valid
  bool isFormValid() {
    return _username.isNotEmpty &&
        _password.isNotEmpty &&
        _usernameError.isEmpty &&
        _passwordError.isEmpty;
  }
}

class LoginResult {
  final bool success;
  final String? message;
  final String? error;
  final Login? loginResponse;

  LoginResult({
    required this.success,
    this.message,
    this.error,
    this.loginResponse,
  });
}
