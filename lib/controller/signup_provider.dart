
import 'package:flutter/material.dart';

import '../network_repos/remote_repos/app_api_service_impl.dart';

class SignupProvider extends ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String _usernameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Getters
  String get usernameError => _usernameError;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get confirmPasswordError => _confirmPasswordError;

  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  // Setters with validation
  void setUsername(String value) {
    _username = value.trim();
    _validateUsername();
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value.trim();
    _validateEmail();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _validatePassword();
    _validateConfirmPassword();
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    _validateConfirmPassword();
    notifyListeners();
  }

  // Validation methods
  void _validateUsername() {
    if (_username.isEmpty) {
      _usernameError = 'Username is required';
    } else if (_username.length < 3) {
      _usernameError = 'Username must be at least 3 characters';
    } else {
      _usernameError = '';
    }
  }

  void _validateEmail() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (_email.isEmpty) {
      _emailError = 'Email is required';
    } else if (!emailRegex.hasMatch(_email)) {
      _emailError = 'Please enter a valid email';
    } else {
      _emailError = '';
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

  void _validateConfirmPassword() {
    if (_confirmPassword.isEmpty) {
      _confirmPasswordError = 'Please confirm your password';
    } else if (_password != _confirmPassword) {
      _confirmPasswordError = 'Passwords do not match';
    } else {
      _confirmPasswordError = '';
    }
  }

  // Form validation
  bool isFormValid() {
    return _usernameError.isEmpty &&
        _emailError.isEmpty &&
        _passwordError.isEmpty &&
        _confirmPasswordError.isEmpty &&
        _username.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty;
  }

  // Visibility toggles
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  // Submit method
  Future<void> submitSignup(BuildContext context) async {
    if (!isFormValid()) return;

    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await AppApiServiceImpl.instance.signupUser();

      // Clear form
      _username = '';
      _email = '';
      _password = '';
      _confirmPassword = '';

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

      // Navigate to home or login
      // Navigator.pushReplacementNamed(context, '/home');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed: $error'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
