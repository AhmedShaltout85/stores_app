import 'package:flutter/material.dart';

import '../models/signup_response.dart';
import '../network_repos/remote_repos/app_api_service_impl.dart';

class SignupProvider with ChangeNotifier {
  // Form fields
  String _username = '';
  String _email = '';
  String _password = '';

  // Validation states
  String _usernameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _apiError = '';

  // UI states
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Getters
  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get usernameError => _usernameError;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get apiError => _apiError;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;
  bool get hasErrors =>
      _usernameError.isNotEmpty ||
      _emailError.isNotEmpty ||
      _passwordError.isNotEmpty ||
      _apiError.isNotEmpty;

  // Setters with validation
  void setUsername(String value) {
    _username = value.trim();
    _validateUsername();
    _clearApiError();
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value.trim();
    _validateEmail();
    _clearApiError();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value.trim();
    _validatePassword();
    _clearApiError();
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _validateUsername() {
    if (_username.isEmpty) {
      _usernameError = 'Username cannot be empty';
    } else if (_username.length < 3) {
      _usernameError = 'Username must be at least 3 characters long';
    } else {
      _usernameError = '';
    }
  }

  void _validateEmail() {
    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
    } else if (!_email.contains('@')) {
      _emailError = 'Enter a valid email address';
    } else {
      _emailError = '';
    }
  }

  void _validatePassword() {
    if (_password.isEmpty) {
      _passwordError = 'Password cannot be empty';
    } else if (_password.length < 6) {
      _passwordError = 'Password must be at least 6 characters long';
    } else {
      _passwordError = '';
    }
  }

  void _clearApiError() {
    _apiError = '';
  }

  void setApiError(String error) {
    _apiError = error;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> resetForm() async {
    _username = '';
    _email = '';
    _password = '';
    _usernameError = '';
    _emailError = '';
    _passwordError = '';
    _apiError = '';
    _isPasswordVisible = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> submitSignup() async {
    _validateUsername();
    _validateEmail();
    _validatePassword();
    if (hasErrors) {
      return;
    }
    setLoading(true);
    try {
      SignupResponse signupResponse = SignupResponse(
        username: _username,
        email: _email,
        password: _password,
      );
      await AppApiServiceImpl.instance
          .signupUser(signupResponse: signupResponse);
      await resetForm();
    } catch (e) {
      setApiError('Signup failed: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
