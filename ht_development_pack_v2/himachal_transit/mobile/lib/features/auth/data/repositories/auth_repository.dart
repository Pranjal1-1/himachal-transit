import 'package:himachal_transit_mobile/models/user_model.dart';
import 'package:himachal_transit_mobile/core/services/api_service.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register(RegisterRequest request);
  Future<void> requestOtp(OtpRequest request);
  Future<void> verifyOtp(OtpVerifyRequest request);
  Future<void> forgotPassword(ForgotPasswordRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);
  Future<AuthResponse> driverVerify(DriverVerifyRequest request);
  Future<void> logout(String refreshToken);
  Future<User> getUserProfile(String userId);
  Future<AuthTokens> refreshTokens(String refreshToken);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;
  
  AuthRepositoryImpl(this._apiService);
  
  @override
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _apiService.post('/auth/login', data: request.toJson());
    if (response.statusCode == 200) {
      final data = response.data;
      final tokens = data['tokens'] ?? data;
      return AuthResponse(
        userId: data['userId'] ?? data['id'],
        role: data['role'] ?? 'PASSENGER',
        tokens: AuthTokens(
          access: tokens['access'],
          refresh: tokens['refresh'],
        ),
        driverId: data['driverId'],
      );
    }
    throw Exception(response.data?['error'] ?? 'Login failed');
  }
  
  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    final response = await _apiService.post('/auth/register', data: request.toJson());
    if (response.statusCode == 200) {
      final data = response.data;
      final tokens = data['tokens'] ?? data;
      return AuthResponse(
        userId: data['userId'] ?? data['id'],
        role: data['role'] ?? 'PASSENGER',
        tokens: AuthTokens(
          access: tokens['access'],
          refresh: tokens['refresh'],
        ),
      );
    }
    throw Exception(response.data?['error'] ?? 'Registration failed');
  }
  
  @override
  Future<void> requestOtp(OtpRequest request) async {
    final response = await _apiService.post('/auth/otp/request', data: request.toJson());
    if (response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Failed to send OTP');
    }
  }
  
  @override
  Future<void> verifyOtp(OtpVerifyRequest request) async {
    final response = await _apiService.post('/auth/otp/verify', data: request.toJson());
    if (response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Invalid or expired code');
    }
  }
  
  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    final response = await _apiService.post('/auth/forgot-password', data: request.toJson());
    if (response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Failed to process request');
    }
  }
  
  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    final response = await _apiService.post('/auth/reset-password', data: request.toJson());
    if (response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Failed to reset password');
    }
  }
  
  @override
  Future<AuthResponse> driverVerify(DriverVerifyRequest request) async {
    final response = await _apiService.post('/auth/driver/verify', data: request.toJson());
    if (response.statusCode == 200) {
      final data = response.data;
      final tokens = data['tokens'] ?? data;
      return AuthResponse(
        userId: data['userId'] ?? data['id'],
        role: data['role'] ?? 'DRIVER',
        tokens: AuthTokens(
          access: tokens['access'],
          refresh: tokens['refresh'],
        ),
        driverId: data['driverId'],
      );
    }
    throw Exception(response.data?['error'] ?? 'Driver verification failed');
  }
  
  @override
  Future<void> logout(String refreshToken) async {
    await _apiService.post('/auth/logout', data: {'refresh': refreshToken});
  }
  
  @override
  Future<User> getUserProfile(String userId) async {
    final response = await _apiService.get('/users/$userId');
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    throw Exception('Failed to fetch user profile');
  }
  
  @override
  Future<AuthTokens> refreshTokens(String refreshToken) async {
    final response = await _apiService.post('/auth/refresh', data: {'refresh': refreshToken});
    if (response.statusCode == 200) {
      final tokens = response.data['tokens'] ?? response.data;
      return AuthTokens(
        access: tokens['access'],
        refresh: tokens['refresh'],
      );
    }
    throw Exception('Token refresh failed');
  }
}

