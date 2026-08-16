// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavouriteBus _$FavouriteBusFromJson(Map<String, dynamic> json) {
  return _FavouriteBus.fromJson(json);
}

/// @nodoc
mixin _$FavouriteBus {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get busId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  Bus? get bus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteBusCopyWith<FavouriteBus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteBusCopyWith<$Res> {
  factory $FavouriteBusCopyWith(
          FavouriteBus value, $Res Function(FavouriteBus) then) =
      _$FavouriteBusCopyWithImpl<$Res, FavouriteBus>;
  @useResult
  $Res call({String id, String userId, String busId, int createdAt, Bus? bus});

  $BusCopyWith<$Res>? get bus;
}

/// @nodoc
class _$FavouriteBusCopyWithImpl<$Res, $Val extends FavouriteBus>
    implements $FavouriteBusCopyWith<$Res> {
  _$FavouriteBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? busId = null,
    Object? createdAt = null,
    Object? bus = freezed,
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
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusCopyWith<$Res>? get bus {
    if (_value.bus == null) {
      return null;
    }

    return $BusCopyWith<$Res>(_value.bus!, (value) {
      return _then(_value.copyWith(bus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavouriteBusImplCopyWith<$Res>
    implements $FavouriteBusCopyWith<$Res> {
  factory _$$FavouriteBusImplCopyWith(
          _$FavouriteBusImpl value, $Res Function(_$FavouriteBusImpl) then) =
      __$$FavouriteBusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, String busId, int createdAt, Bus? bus});

  @override
  $BusCopyWith<$Res>? get bus;
}

/// @nodoc
class __$$FavouriteBusImplCopyWithImpl<$Res>
    extends _$FavouriteBusCopyWithImpl<$Res, _$FavouriteBusImpl>
    implements _$$FavouriteBusImplCopyWith<$Res> {
  __$$FavouriteBusImplCopyWithImpl(
      _$FavouriteBusImpl _value, $Res Function(_$FavouriteBusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? busId = null,
    Object? createdAt = null,
    Object? bus = freezed,
  }) {
    return _then(_$FavouriteBusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteBusImpl implements _FavouriteBus {
  const _$FavouriteBusImpl(
      {required this.id,
      required this.userId,
      required this.busId,
      required this.createdAt,
      this.bus});

  factory _$FavouriteBusImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteBusImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String busId;
  @override
  final int createdAt;
  @override
  final Bus? bus;

  @override
  String toString() {
    return 'FavouriteBus(id: $id, userId: $userId, busId: $busId, createdAt: $createdAt, bus: $bus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteBusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bus, bus) || other.bus == bus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, busId, createdAt, bus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteBusImplCopyWith<_$FavouriteBusImpl> get copyWith =>
      __$$FavouriteBusImplCopyWithImpl<_$FavouriteBusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteBusImplToJson(
      this,
    );
  }
}

abstract class _FavouriteBus implements FavouriteBus {
  const factory _FavouriteBus(
      {required final String id,
      required final String userId,
      required final String busId,
      required final int createdAt,
      final Bus? bus}) = _$FavouriteBusImpl;

  factory _FavouriteBus.fromJson(Map<String, dynamic> json) =
      _$FavouriteBusImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get busId;
  @override
  int get createdAt;
  @override
  Bus? get bus;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteBusImplCopyWith<_$FavouriteBusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
