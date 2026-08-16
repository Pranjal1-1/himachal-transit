import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:himachal_transit_mobile/models/user_model.dart';
import 'package:himachal_transit_mobile/core/services/api_service.dart';
import 'package:himachal_transit_mobile/core/services/secure_storage_service.dart';
import 'package:himachal_transit_mobile/core/config/app_config.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    String? userId,
    String? userRole,
    User? user,
    String? error,
  }) = _AuthState;
  
  const AuthState._();
  
  // Convenience getters
  bool get isPassenger => userRole == 'PASSENGER';
  bool get isDriver => userRole == 'DRIVER';
  bool get isAdmin => userRole == 'ADMIN' || userRole == 'MANAGER';
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());
  
  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
    try {
      final accessToken = await SecureStorageService.getAccessToken();
      final userId = await SecureStorageService.getUserId();
      final userRole = await SecureStorageService.getUserRole();
      
      if (accessToken != null && userId != null && userRole != null) {
        // Validate token by fetching user profile
        final response = await apiService.get('/users/$userId');
        if (response.statusCode == 200) {
          final user = User.fromJson(response.data);
          state = AuthState(
            isLoggedIn: true,
            isLoading: false,
            userId: userId,
            userRole: userRole,
            user: user,
          );
          return;
        }
      }
      // Token invalid or missing - clear storage
      await SecureStorageService.clearAuthData();
      state = const AuthState(isLoading: false);
    } catch (e) {
      await SecureStorageService.clearAuthData();
      state = const AuthState(isLoading: false);
    }
  }
  
  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/login', data: {
        'identifier': identifier,
        'password': password,
      });
      
      if (response.statusCode == 200) {
        final data = response.data;
        final tokens = data['tokens'] ?? data;
final role = data['role'] ?? 'PASSENGER';
        final userId = data['userId'] ?? data['id'];
        final _driverId = data['driverId'];
        
        if (tokens['access'] == null || tokens['refresh'] == null) {
          throw Exception('Invalid token response');
        }
        
        await SecureStorageService.setAuthTokens(
          accessToken: tokens['access'],
          refreshToken: tokens['refresh'],
          userId: userId,
          role: role,
        );
        
        // Fetch user profile
        final userResponse = await apiService.get('/users/$userId');
        User? user;
        if (userResponse.statusCode == 200) {
          user = User.fromJson(userResponse.data);
        }
        
        state = AuthState(
          isLoggedIn: true,
          isLoading: false,
          userId: userId,
          userRole: role,
          user: user,
        );
      } else {
        final error = response.data?['error'] ?? 'Login failed';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> register({
    required String fullName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/register', data: {
        'fullName': fullName,
        'phone': phone,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      });
      
      if (response.statusCode == 200) {
        final data = response.data;
        final tokens = data['tokens'] ?? data;
        final role = data['role'] ?? 'PASSENGER';
        final userId = data['userId'] ?? data['id'];
        
        if (tokens['access'] == null || tokens['refresh'] == null) {
          throw Exception('Invalid token response');
        }
        
        await SecureStorageService.setAuthTokens(
          accessToken: tokens['access'],
          refreshToken: tokens['refresh'],
          userId: userId,
          role: role,
        );
        
        final userResponse = await apiService.get('/users/$userId');
        User? user;
        if (userResponse.statusCode == 200) {
          user = User.fromJson(userResponse.data);
        }
        
        state = AuthState(
          isLoggedIn: true,
          isLoading: false,
          userId: userId,
          userRole: role,
          user: user,
        );
      } else {
        final error = response.data?['error'] ?? 'Registration failed';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> requestOtp(String identifier) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/otp/request', data: {
        'identifier': identifier,
      });
      
      if (response.statusCode == 200) {
        state = state.copyWith(isLoading: false);
        // In debug mode, backend returns the code
        if (AppConfig.isDevelopment && response.data['debug_code'] != null) {
          // Could show debug code in dev mode
        }
      } else {
        final error = response.data?['error'] ?? 'Failed to send OTP';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> verifyOtp({
    required String identifier,
    required String code,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/otp/verify', data: {
        'identifier': identifier,
        'code': code,
      });
      
      if (response.statusCode == 200) {
        state = state.copyWith(isLoading: false);
      } else {
        final error = response.data?['error'] ?? 'Invalid or expired code';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> forgotPassword(String identifier) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/forgot-password', data: {
        'identifier': identifier,
      });
      
      if (response.statusCode == 200) {
        state = state.copyWith(isLoading: false);
      } else {
        final error = response.data?['error'] ?? 'Failed to process request';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> resetPassword({
    required String identifier,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/reset-password', data: {
        'identifier': identifier,
        'code': code,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      });
      
      if (response.statusCode == 200) {
        state = state.copyWith(isLoading: false);
      } else {
        final error = response.data?['error'] ?? 'Failed to reset password';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> driverVerify({
    required String identifier,
    required String orgCode,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await apiService.post('/auth/driver/verify', data: {
        'identifier': identifier,
        'orgCode': orgCode,
        'password': password,
      });
      
      if (response.statusCode == 200) {
        final data = response.data;
        final tokens = data['tokens'] ?? data;
final role = data['role'] ?? 'DRIVER';
        final userId = data['userId'] ?? data['id'];
        final _driverId = data['driverId'];
        
        if (tokens['access'] == null || tokens['refresh'] == null) {
          throw Exception('Invalid token response');
        }
        
        await SecureStorageService.setAuthTokens(
          accessToken: tokens['access'],
          refreshToken: tokens['refresh'],
          userId: userId,
          role: role,
        );
        
        final userResponse = await apiService.get('/users/$userId');
        User? user;
        if (userResponse.statusCode == 200) {
          user = User.fromJson(userResponse.data);
        }
        
        state = AuthState(
          isLoggedIn: true,
          isLoading: false,
          userId: userId,
          userRole: role,
          user: user,
        );
      } else {
        final error = response.data?['error'] ?? 'Driver verification failed';
        state = state.copyWith(isLoading: false, error: error.toString());
        throw Exception(error);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
  
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    try {
      final refreshToken = await SecureStorageService.getRefreshToken();
      if (refreshToken != null) {
        await apiService.post('/auth/logout', data: {'refresh': refreshToken});
      }
    } catch (_) {
      // Ignore logout errors
    } finally {
      await SecureStorageService.clearAuthData();
      state = const AuthState();
    }
  }
  
  void clearError() {
    state = state.copyWith(error: null);
  }
  
  void updateUser(User user) {
    state = state.copyWith(user: user);
  }
}

// Provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Convenience providers
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).isLoggedIn;
});

final userRoleProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).userRole;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).user;
});

final authLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).isLoading;
});

final authErrorProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).error;
});


