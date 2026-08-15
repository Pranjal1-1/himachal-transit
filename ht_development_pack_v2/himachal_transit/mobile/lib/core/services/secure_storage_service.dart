import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  
  // Auth tokens
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userIdKey = 'user_id';
  static const _userRoleKey = 'user_role';
  
  // User preferences
  static const _onboardingCompletedKey = 'onboarding_completed';
  static const _lastKnownLocationKey = 'last_known_location';
  static const _activeTripIdKey = 'active_trip_id';
  static const _offlineGpsQueueKey = 'gps_offline_queue';
  
  // Getters
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }
  
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }
  
  static Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }
  
  static Future<String?> getUserRole() async {
    return await _storage.read(key: _userRoleKey);
  }
  
  static Future<bool> getOnboardingCompleted() async {
    final value = await _storage.read(key: _onboardingCompletedKey);
    return value == 'true';
  }
  
  static Future<String?> getLastKnownLocation() async {
    return await _storage.read(key: _lastKnownLocationKey);
  }

  static Future<String?> getActiveTripId() async {
    return await _storage.read(key: _activeTripIdKey);
  }

  static Future<String?> getOfflineGpsQueue() async {
    return await _storage.read(key: _offlineGpsQueueKey);
  }
  
  // Setters
  static Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }
  
  static Future<void> setRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }
  
  static Future<void> setUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }
  
  static Future<void> setUserRole(String role) async {
    await _storage.write(key: _userRoleKey, value: role);
  }
  
  static Future<void> setAuthTokens({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String role,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
      _storage.write(key: _userIdKey, value: userId),
      _storage.write(key: _userRoleKey, value: role),
    ]);
  }
  
  static Future<void> setOnboardingCompleted(bool completed) async {
    await _storage.write(
      key: _onboardingCompletedKey,
      value: completed.toString(),
    );
  }
  
  static Future<void> setLastKnownLocation(String locationJson) async {
    await _storage.write(key: _lastKnownLocationKey, value: locationJson);
  }

  static Future<void> setActiveTripId(String tripId) async {
    await _storage.write(key: _activeTripIdKey, value: tripId);
  }

  static Future<void> clearActiveTripId() async {
    await _storage.delete(key: _activeTripIdKey);
  }

  static Future<void> setOfflineGpsQueue(String queueJson) async {
    await _storage.write(key: _offlineGpsQueueKey, value: queueJson);
  }
  
  // Clear all auth data (logout)
  static Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _userIdKey),
      _storage.delete(key: _userRoleKey),
      _storage.delete(key: _activeTripIdKey),
      _storage.delete(key: _offlineGpsQueueKey),
    ]);
  }
  
  // Clear everything
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}