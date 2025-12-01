import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static const _storage = FlutterSecureStorage();

  static const _keyToken = 'auth_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyUser = 'user_data';

  // Save tokens
  static Future<void> saveTokens({
    required String token,
    required String refreshToken,
    required String userData,
  }) async {
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
    await _storage.write(key: _keyUser, value: userData);
  }

  // Get token
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  // Get user data
  static Future<String?> getUserData() async {
    return await _storage.read(key: _keyUser);
  }

  // Clear all tokens
  static Future<void> clearTokens() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyUser);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
