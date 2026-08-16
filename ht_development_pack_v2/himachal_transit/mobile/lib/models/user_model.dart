import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? fullName,
    String? phone,
    String? email,
    required String role,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String access,
    required String refresh,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String userId,
    required String role,
    required AuthTokens tokens,
    String? driverId,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String identifier,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String fullName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

@freezed
class OtpRequest with _$OtpRequest {
  const factory OtpRequest({
    required String identifier,
  }) = _OtpRequest;

  factory OtpRequest.fromJson(Map<String, dynamic> json) => _$OtpRequestFromJson(json);
}

@freezed
class OtpVerifyRequest with _$OtpVerifyRequest {
  const factory OtpVerifyRequest({
    required String identifier,
    required String code,
  }) = _OtpVerifyRequest;

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) => _$OtpVerifyRequestFromJson(json);
}

@freezed
class ForgotPasswordRequest with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({
    required String identifier,
  }) = _ForgotPasswordRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);
}

@freezed
class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String identifier,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestFromJson(json);
}

@freezed
class DriverVerifyRequest with _$DriverVerifyRequest {
  const factory DriverVerifyRequest({
    required String identifier,
    required String orgCode,
    required String password,
  }) = _DriverVerifyRequest;

  factory DriverVerifyRequest.fromJson(Map<String, dynamic> json) => _$DriverVerifyRequestFromJson(json);
}