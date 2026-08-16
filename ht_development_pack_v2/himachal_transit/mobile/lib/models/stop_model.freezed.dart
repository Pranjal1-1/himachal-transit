// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Stop _$StopFromJson(Map<String, dynamic> json) {
  return _Stop.fromJson(json);
}

/// @nodoc
mixin _$Stop {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  StopStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopCopyWith<Stop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopCopyWith<$Res> {
  factory $StopCopyWith(Stop value, $Res Function(Stop) then) =
      _$StopCopyWithImpl<$Res, Stop>;
  @useResult
  $Res call(
      {String id,
      String name,
      double? latitude,
      double? longitude,
      String? address,
      StopStatus status,
      @JsonKey(name: 'geom') Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$StopCopyWithImpl<$Res, $Val extends Stop>
    implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? status = null,
    Object? geom = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus,
      geom: freezed == geom
          ? _value.geom
          : geom // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> implements $StopCopyWith<$Res> {
  factory _$$StopImplCopyWith(
          _$StopImpl value, $Res Function(_$StopImpl) then) =
      __$$StopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? latitude,
      double? longitude,
      String? address,
      StopStatus status,
      @JsonKey(name: 'geom') Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$StopCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? status = null,
    Object? geom = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$StopImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus,
      geom: freezed == geom
          ? _value._geom
          : geom // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StopImpl implements _Stop {
  const _$StopImpl(
      {required this.id,
      required this.name,
      this.latitude,
      this.longitude,
      this.address,
      required this.status,
      @JsonKey(name: 'geom') final Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') this.createdAt})
      : _geom = geom;

  factory _$StopImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;
  @override
  final StopStatus status;
  final Map<String, dynamic>? _geom;
  @override
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom {
    final value = _geom;
    if (value == null) return null;
    if (_geom is EqualUnmodifiableMapView) return _geom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'Stop(id: $id, name: $name, latitude: $latitude, longitude: $longitude, address: $address, status: $status, geom: $geom, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._geom, _geom) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      address, status, const DeepCollectionEquality().hash(_geom), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      __$$StopImplCopyWithImpl<_$StopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StopImplToJson(
      this,
    );
  }
}

abstract class _Stop implements Stop {
  const factory _Stop(
      {required final String id,
      required final String name,
      final double? latitude,
      final double? longitude,
      final String? address,
      required final StopStatus status,
      @JsonKey(name: 'geom') final Map<String, dynamic>? geom,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$StopImpl;

  factory _Stop.fromJson(Map<String, dynamic> json) = _$StopImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get address;
  @override
  StopStatus get status;
  @override
  @JsonKey(name: 'geom')
  Map<String, dynamic>? get geom;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateStopRequest _$CreateStopRequestFromJson(Map<String, dynamic> json) {
  return _CreateStopRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateStopRequest {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  StopStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateStopRequestCopyWith<CreateStopRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStopRequestCopyWith<$Res> {
  factory $CreateStopRequestCopyWith(
          CreateStopRequest value, $Res Function(CreateStopRequest) then) =
      _$CreateStopRequestCopyWithImpl<$Res, CreateStopRequest>;
  @useResult
  $Res call(
      {String name,
      double latitude,
      double longitude,
      String? address,
      StopStatus? status});
}

/// @nodoc
class _$CreateStopRequestCopyWithImpl<$Res, $Val extends CreateStopRequest>
    implements $CreateStopRequestCopyWith<$Res> {
  _$CreateStopRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStopRequestImplCopyWith<$Res>
    implements $CreateStopRequestCopyWith<$Res> {
  factory _$$CreateStopRequestImplCopyWith(_$CreateStopRequestImpl value,
          $Res Function(_$CreateStopRequestImpl) then) =
      __$$CreateStopRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double latitude,
      double longitude,
      String? address,
      StopStatus? status});
}

/// @nodoc
class __$$CreateStopRequestImplCopyWithImpl<$Res>
    extends _$CreateStopRequestCopyWithImpl<$Res, _$CreateStopRequestImpl>
    implements _$$CreateStopRequestImplCopyWith<$Res> {
  __$$CreateStopRequestImplCopyWithImpl(_$CreateStopRequestImpl _value,
      $Res Function(_$CreateStopRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CreateStopRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateStopRequestImpl implements _CreateStopRequest {
  const _$CreateStopRequestImpl(
      {required this.name,
      required this.latitude,
      required this.longitude,
      this.address,
      this.status});

  factory _$CreateStopRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStopRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? address;
  @override
  final StopStatus? status;

  @override
  String toString() {
    return 'CreateStopRequest(name: $name, latitude: $latitude, longitude: $longitude, address: $address, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStopRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, latitude, longitude, address, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStopRequestImplCopyWith<_$CreateStopRequestImpl> get copyWith =>
      __$$CreateStopRequestImplCopyWithImpl<_$CreateStopRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStopRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateStopRequest implements CreateStopRequest {
  const factory _CreateStopRequest(
      {required final String name,
      required final double latitude,
      required final double longitude,
      final String? address,
      final StopStatus? status}) = _$CreateStopRequestImpl;

  factory _CreateStopRequest.fromJson(Map<String, dynamic> json) =
      _$CreateStopRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get address;
  @override
  StopStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateStopRequestImplCopyWith<_$CreateStopRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateStopRequest _$UpdateStopRequestFromJson(Map<String, dynamic> json) {
  return _UpdateStopRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateStopRequest {
  String? get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  StopStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStopRequestCopyWith<UpdateStopRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStopRequestCopyWith<$Res> {
  factory $UpdateStopRequestCopyWith(
          UpdateStopRequest value, $Res Function(UpdateStopRequest) then) =
      _$UpdateStopRequestCopyWithImpl<$Res, UpdateStopRequest>;
  @useResult
  $Res call(
      {String? name,
      double? latitude,
      double? longitude,
      String? address,
      StopStatus? status});
}

/// @nodoc
class _$UpdateStopRequestCopyWithImpl<$Res, $Val extends UpdateStopRequest>
    implements $UpdateStopRequestCopyWith<$Res> {
  _$UpdateStopRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStopRequestImplCopyWith<$Res>
    implements $UpdateStopRequestCopyWith<$Res> {
  factory _$$UpdateStopRequestImplCopyWith(_$UpdateStopRequestImpl value,
          $Res Function(_$UpdateStopRequestImpl) then) =
      __$$UpdateStopRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      double? latitude,
      double? longitude,
      String? address,
      StopStatus? status});
}

/// @nodoc
class __$$UpdateStopRequestImplCopyWithImpl<$Res>
    extends _$UpdateStopRequestCopyWithImpl<$Res, _$UpdateStopRequestImpl>
    implements _$$UpdateStopRequestImplCopyWith<$Res> {
  __$$UpdateStopRequestImplCopyWithImpl(_$UpdateStopRequestImpl _value,
      $Res Function(_$UpdateStopRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateStopRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StopStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateStopRequestImpl implements _UpdateStopRequest {
  const _$UpdateStopRequestImpl(
      {this.name, this.latitude, this.longitude, this.address, this.status});

  factory _$UpdateStopRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateStopRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;
  @override
  final StopStatus? status;

  @override
  String toString() {
    return 'UpdateStopRequest(name: $name, latitude: $latitude, longitude: $longitude, address: $address, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStopRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, latitude, longitude, address, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStopRequestImplCopyWith<_$UpdateStopRequestImpl> get copyWith =>
      __$$UpdateStopRequestImplCopyWithImpl<_$UpdateStopRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStopRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateStopRequest implements UpdateStopRequest {
  const factory _UpdateStopRequest(
      {final String? name,
      final double? latitude,
      final double? longitude,
      final String? address,
      final StopStatus? status}) = _$UpdateStopRequestImpl;

  factory _UpdateStopRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateStopRequestImpl.fromJson;

  @override
  String? get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get address;
  @override
  StopStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$UpdateStopRequestImplCopyWith<_$UpdateStopRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
