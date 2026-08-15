// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$AuthTokensImpl _$$AuthTokensImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokensImpl(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$$AuthTokensImplToJson(_$AuthTokensImpl instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      userId: json['userId'] as String,
      role: json['role'] as String,
      tokens: AuthTokens.fromJson(json['tokens'] as Map<String, dynamic>),
      driverId: json['driverId'] as String?,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
      'tokens': instance.tokens,
      'driverId': instance.driverId,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      identifier: json['identifier'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
    };

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };

_$OtpRequestImpl _$$OtpRequestImplFromJson(Map<String, dynamic> json) =>
    _$OtpRequestImpl(
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$$OtpRequestImplToJson(_$OtpRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
    };

_$OtpVerifyRequestImpl _$$OtpVerifyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerifyRequestImpl(
      identifier: json['identifier'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$OtpVerifyRequestImplToJson(
        _$OtpVerifyRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'code': instance.code,
    };

_$ForgotPasswordRequestImpl _$$ForgotPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordRequestImpl(
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$$ForgotPasswordRequestImplToJson(
        _$ForgotPasswordRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
    };

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordRequestImpl(
      identifier: json['identifier'] as String,
      code: json['code'] as String,
      newPassword: json['newPassword'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
        _$ResetPasswordRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'code': instance.code,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };

_$DriverVerifyRequestImpl _$$DriverVerifyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverVerifyRequestImpl(
      identifier: json['identifier'] as String,
      orgCode: json['orgCode'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$DriverVerifyRequestImplToJson(
        _$DriverVerifyRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'orgCode': instance.orgCode,
      'password': instance.password,
    };
