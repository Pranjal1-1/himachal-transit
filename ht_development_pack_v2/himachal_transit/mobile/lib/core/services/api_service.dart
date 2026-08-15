import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';
import 'secure_storage_service.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;
  final dynamic data;
  
  ApiException({
    required this.statusCode,
    required this.message,
    this.data,
  });
  
  @override
  String toString() => 'ApiException($statusCode): $message';
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String message = 'Unauthorized', dynamic data})
      : super(statusCode: 401, message: message, data: data);
}

class ForbiddenException extends ApiException {
  ForbiddenException({String message = 'Forbidden', dynamic data})
      : super(statusCode: 403, message: message, data: data);
}

class NotFoundException extends ApiException {
  NotFoundException({String message = 'Not found', dynamic data})
      : super(statusCode: 404, message: message, data: data);
}

class ValidationException extends ApiException {
  ValidationException({String message = 'Validation error', dynamic data})
      : super(statusCode: 400, message: message, data: data);
}

class ServerException extends ApiException {
  ServerException({String message = 'Server error', dynamic data})
      : super(statusCode: 500, message: message, data: data);
}

class NetworkException extends ApiException {
  NetworkException({String message = 'Network error', dynamic data})
      : super(statusCode: 0, message: message, data: data);
}

class ApiService {
  late final Dio _dio;
  bool _isRefreshing = false;
  final _refreshCompleters = <Completer<String>>[];
  
  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) => status != null && status < 500,
    ));
    
    _setupInterceptors();
  }
  
  Dio get dio => _dio;
  
  void _setupInterceptors() {
    // Request interceptor - add auth token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await SecureStorageService.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        if (kDebugMode) {
          debugPrint('🌐 REQUEST: ${options.method} ${options.path}');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          debugPrint('✅ RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
        }
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        if (kDebugMode) {
          debugPrint('❌ ERROR: ${error.response?.statusCode} ${error.requestOptions.path} - ${error.message}');
        }
        
        // Handle 401 - try to refresh token
        if (error.response?.statusCode == 401 && 
            error.requestOptions.path != '/auth/refresh' &&
            error.requestOptions.path != '/auth/login' &&
            error.requestOptions.path != '/auth/register') {
          
          final refreshed = await _tryRefreshToken();
          if (refreshed) {
            // Retry the original request with new token
            final token = await SecureStorageService.getAccessToken();
            if (token != null) {
              error.requestOptions.headers['Authorization'] = 'Bearer $token';
            }
            try {
              final response = await _dio.fetch(error.requestOptions);
              return handler.resolve(response);
            } catch (e) {
              return handler.next(error);
            }
          } else {
            // Refresh failed - clear auth and redirect to login
            await SecureStorageService.clearAuthData();
            // Navigation will be handled by the router/auth state
          }
        }
        
        return handler.next(error);
      },
    ));
    
    // Logging interceptor for debug
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        error: true,
      ));
    }
  }
  
  Future<bool> _tryRefreshToken() async {
    // If already refreshing, wait for the existing refresh
    if (_isRefreshing) {
      final completer = Completer<String>();
      _refreshCompleters.add(completer);
      try {
        await completer.future;
        return true;
      } catch (_) {
        return false;
      }
    }
    
    _isRefreshing = true;
    
    try {
      final refreshToken = await SecureStorageService.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token');
      }
      
      final response = await _dio.post(
        '/auth/refresh',
        data: {'refresh': refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      
      if (response.statusCode == 200) {
        final data = response.data;
        final tokens = data['tokens'] ?? data;
        
        if (tokens['access'] != null && tokens['refresh'] != null) {
          await SecureStorageService.setAuthTokens(
            accessToken: tokens['access'],
            refreshToken: tokens['refresh'],
            userId: (await SecureStorageService.getUserId()) ?? '',
            role: (await SecureStorageService.getUserRole()) ?? 'PASSENGER',
          );
          
          // Resolve all waiting completers
          for (final c in _refreshCompleters) {
            c.complete(tokens['access']);
          }
          _refreshCompleters.clear();
          
          return true;
        }
      }
      
      throw Exception('Invalid refresh response');
    } catch (e) {
      // Reject all waiting completers
      for (final c in _refreshCompleters) {
        c.completeError(e);
      }
      _refreshCompleters.clear();
      return false;
    } finally {
      _isRefreshing = false;
    }
  }
  
  // Convenience methods
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
  
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
  
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
  
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
  
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

// Singleton instance
final apiService = ApiService();