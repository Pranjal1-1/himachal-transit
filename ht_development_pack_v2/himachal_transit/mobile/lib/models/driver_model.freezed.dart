// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return _Driver.fromJson(json);
}

/// @nodoc
mixin _$Driver {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  String? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String get verificationStatus => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt =>
      throw _privateConstructorUsedError; // Nested user data
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverCopyWith<Driver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverCopyWith<$Res> {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) then) =
      _$DriverCopyWithImpl<$Res, Driver>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'organization_id') String? organizationId,
      @JsonKey(name: 'employee_id') String? employeeId,
      @JsonKey(name: 'verification_status') String verificationStatus,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$DriverCopyWithImpl<$Res, $Val extends Driver>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? organizationId = freezed,
    Object? employeeId = freezed,
    Object? verificationStatus = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverImplCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$$DriverImplCopyWith(
          _$DriverImpl value, $Res Function(_$DriverImpl) then) =
      __$$DriverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'organization_id') String? organizationId,
      @JsonKey(name: 'employee_id') String? employeeId,
      @JsonKey(name: 'verification_status') String verificationStatus,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$DriverImplCopyWithImpl<$Res>
    extends _$DriverCopyWithImpl<$Res, _$DriverImpl>
    implements _$$DriverImplCopyWith<$Res> {
  __$$DriverImplCopyWithImpl(
      _$DriverImpl _value, $Res Function(_$DriverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? organizationId = freezed,
    Object? employeeId = freezed,
    Object? verificationStatus = null,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$DriverImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverImpl implements _Driver {
  const _$DriverImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'organization_id') this.organizationId,
      @JsonKey(name: 'employee_id') this.employeeId,
      @JsonKey(name: 'verification_status') required this.verificationStatus,
      this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      this.user});

  factory _$DriverImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  @override
  @JsonKey(name: 'employee_id')
  final String? employeeId;
  @override
  @JsonKey(name: 'verification_status')
  final String verificationStatus;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
// Nested user data
  @override
  final User? user;

  @override
  String toString() {
    return 'Driver(id: $id, userId: $userId, organizationId: $organizationId, employeeId: $employeeId, verificationStatus: $verificationStatus, status: $status, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, organizationId,
      employeeId, verificationStatus, status, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      __$$DriverImplCopyWithImpl<_$DriverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverImplToJson(
      this,
    );
  }
}

abstract class _Driver implements Driver {
  const factory _Driver(
      {required final String id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'organization_id') final String? organizationId,
      @JsonKey(name: 'employee_id') final String? employeeId,
      @JsonKey(name: 'verification_status')
      required final String verificationStatus,
      final String? status,
      @JsonKey(name: 'created_at') final String? createdAt,
      final User? user}) = _$DriverImpl;

  factory _Driver.fromJson(Map<String, dynamic> json) = _$DriverImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'organization_id')
  String? get organizationId;
  @override
  @JsonKey(name: 'employee_id')
  String? get employeeId;
  @override
  @JsonKey(name: 'verification_status')
  String get verificationStatus;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override // Nested user data
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDriverRequest _$CreateDriverRequestFromJson(Map<String, dynamic> json) {
  return _CreateDriverRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateDriverRequest {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  String get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String? get verificationStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateDriverRequestCopyWith<CreateDriverRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDriverRequestCopyWith<$Res> {
  factory $CreateDriverRequestCopyWith(
          CreateDriverRequest value, $Res Function(CreateDriverRequest) then) =
      _$CreateDriverRequestCopyWithImpl<$Res, CreateDriverRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'employee_id') String employeeId,
      @JsonKey(name: 'verification_status') String? verificationStatus});
}

/// @nodoc
class _$CreateDriverRequestCopyWithImpl<$Res, $Val extends CreateDriverRequest>
    implements $CreateDriverRequestCopyWith<$Res> {
  _$CreateDriverRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? organizationId = null,
    Object? employeeId = null,
    Object? verificationStatus = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateDriverRequestImplCopyWith<$Res>
    implements $CreateDriverRequestCopyWith<$Res> {
  factory _$$CreateDriverRequestImplCopyWith(_$CreateDriverRequestImpl value,
          $Res Function(_$CreateDriverRequestImpl) then) =
      __$$CreateDriverRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'organization_id') String organizationId,
      @JsonKey(name: 'employee_id') String employeeId,
      @JsonKey(name: 'verification_status') String? verificationStatus});
}

/// @nodoc
class __$$CreateDriverRequestImplCopyWithImpl<$Res>
    extends _$CreateDriverRequestCopyWithImpl<$Res, _$CreateDriverRequestImpl>
    implements _$$CreateDriverRequestImplCopyWith<$Res> {
  __$$CreateDriverRequestImplCopyWithImpl(_$CreateDriverRequestImpl _value,
      $Res Function(_$CreateDriverRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? organizationId = null,
    Object? employeeId = null,
    Object? verificationStatus = freezed,
  }) {
    return _then(_$CreateDriverRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDriverRequestImpl implements _CreateDriverRequest {
  const _$CreateDriverRequestImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'organization_id') required this.organizationId,
      @JsonKey(name: 'employee_id') required this.employeeId,
      @JsonKey(name: 'verification_status') this.verificationStatus});

  factory _$CreateDriverRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDriverRequestImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'organization_id')
  final String organizationId;
  @override
  @JsonKey(name: 'employee_id')
  final String employeeId;
  @override
  @JsonKey(name: 'verification_status')
  final String? verificationStatus;

  @override
  String toString() {
    return 'CreateDriverRequest(userId: $userId, organizationId: $organizationId, employeeId: $employeeId, verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDriverRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, organizationId, employeeId, verificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDriverRequestImplCopyWith<_$CreateDriverRequestImpl> get copyWith =>
      __$$CreateDriverRequestImplCopyWithImpl<_$CreateDriverRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDriverRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateDriverRequest implements CreateDriverRequest {
  const factory _CreateDriverRequest(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'organization_id') required final String organizationId,
      @JsonKey(name: 'employee_id') required final String employeeId,
      @JsonKey(name: 'verification_status')
      final String? verificationStatus}) = _$CreateDriverRequestImpl;

  factory _CreateDriverRequest.fromJson(Map<String, dynamic> json) =
      _$CreateDriverRequestImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'organization_id')
  String get organizationId;
  @override
  @JsonKey(name: 'employee_id')
  String get employeeId;
  @override
  @JsonKey(name: 'verification_status')
  String? get verificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$CreateDriverRequestImplCopyWith<_$CreateDriverRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
