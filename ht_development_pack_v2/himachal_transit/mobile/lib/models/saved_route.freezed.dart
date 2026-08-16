// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedRoute _$SavedRouteFromJson(Map<String, dynamic> json) {
  return _SavedRoute.fromJson(json);
}

/// @nodoc
mixin _$SavedRoute {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  Route? get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedRouteCopyWith<SavedRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedRouteCopyWith<$Res> {
  factory $SavedRouteCopyWith(
          SavedRoute value, $Res Function(SavedRoute) then) =
      _$SavedRouteCopyWithImpl<$Res, SavedRoute>;
  @useResult
  $Res call(
      {String id, String userId, String routeId, int createdAt, Route? route});

  $RouteCopyWith<$Res>? get route;
}

/// @nodoc
class _$SavedRouteCopyWithImpl<$Res, $Val extends SavedRoute>
    implements $SavedRouteCopyWith<$Res> {
  _$SavedRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? routeId = null,
    Object? createdAt = null,
    Object? route = freezed,
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
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteCopyWith<$Res>? get route {
    if (_value.route == null) {
      return null;
    }

    return $RouteCopyWith<$Res>(_value.route!, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedRouteImplCopyWith<$Res>
    implements $SavedRouteCopyWith<$Res> {
  factory _$$SavedRouteImplCopyWith(
          _$SavedRouteImpl value, $Res Function(_$SavedRouteImpl) then) =
      __$$SavedRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String userId, String routeId, int createdAt, Route? route});

  @override
  $RouteCopyWith<$Res>? get route;
}

/// @nodoc
class __$$SavedRouteImplCopyWithImpl<$Res>
    extends _$SavedRouteCopyWithImpl<$Res, _$SavedRouteImpl>
    implements _$$SavedRouteImplCopyWith<$Res> {
  __$$SavedRouteImplCopyWithImpl(
      _$SavedRouteImpl _value, $Res Function(_$SavedRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? routeId = null,
    Object? createdAt = null,
    Object? route = freezed,
  }) {
    return _then(_$SavedRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedRouteImpl implements _SavedRoute {
  const _$SavedRouteImpl(
      {required this.id,
      required this.userId,
      required this.routeId,
      required this.createdAt,
      this.route});

  factory _$SavedRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedRouteImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String routeId;
  @override
  final int createdAt;
  @override
  final Route? route;

  @override
  String toString() {
    return 'SavedRoute(id: $id, userId: $userId, routeId: $routeId, createdAt: $createdAt, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, routeId, createdAt, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedRouteImplCopyWith<_$SavedRouteImpl> get copyWith =>
      __$$SavedRouteImplCopyWithImpl<_$SavedRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedRouteImplToJson(
      this,
    );
  }
}

abstract class _SavedRoute implements SavedRoute {
  const factory _SavedRoute(
      {required final String id,
      required final String userId,
      required final String routeId,
      required final int createdAt,
      final Route? route}) = _$SavedRouteImpl;

  factory _SavedRoute.fromJson(Map<String, dynamic> json) =
      _$SavedRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get routeId;
  @override
  int get createdAt;
  @override
  Route? get route;
  @override
  @JsonKey(ignore: true)
  _$$SavedRouteImplCopyWith<_$SavedRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
