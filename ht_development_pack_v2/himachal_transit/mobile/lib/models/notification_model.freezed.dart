// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String title,
      String body,
      bool read,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? body = null,
    Object? read = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String title,
      String body,
      bool read,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? body = null,
    Object? read = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      required this.title,
      required this.body,
      required this.read,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String title;
  @override
  final String body;
  @override
  final bool read;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'Notification(id: $id, userId: $userId, title: $title, body: $body, read: $read, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, title, body, read, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          required final String title,
          required final String body,
          required final bool read,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String get title;
  @override
  String get body;
  @override
  bool get read;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateNotificationRequest _$CreateNotificationRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateNotificationRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateNotificationRequest {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNotificationRequestCopyWith<CreateNotificationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNotificationRequestCopyWith<$Res> {
  factory $CreateNotificationRequestCopyWith(CreateNotificationRequest value,
          $Res Function(CreateNotificationRequest) then) =
      _$CreateNotificationRequestCopyWithImpl<$Res, CreateNotificationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String title,
      String body,
      bool? read});
}

/// @nodoc
class _$CreateNotificationRequestCopyWithImpl<$Res,
        $Val extends CreateNotificationRequest>
    implements $CreateNotificationRequestCopyWith<$Res> {
  _$CreateNotificationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = null,
    Object? body = null,
    Object? read = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNotificationRequestImplCopyWith<$Res>
    implements $CreateNotificationRequestCopyWith<$Res> {
  factory _$$CreateNotificationRequestImplCopyWith(
          _$CreateNotificationRequestImpl value,
          $Res Function(_$CreateNotificationRequestImpl) then) =
      __$$CreateNotificationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String title,
      String body,
      bool? read});
}

/// @nodoc
class __$$CreateNotificationRequestImplCopyWithImpl<$Res>
    extends _$CreateNotificationRequestCopyWithImpl<$Res,
        _$CreateNotificationRequestImpl>
    implements _$$CreateNotificationRequestImplCopyWith<$Res> {
  __$$CreateNotificationRequestImplCopyWithImpl(
      _$CreateNotificationRequestImpl _value,
      $Res Function(_$CreateNotificationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = null,
    Object? body = null,
    Object? read = freezed,
  }) {
    return _then(_$CreateNotificationRequestImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNotificationRequestImpl implements _CreateNotificationRequest {
  const _$CreateNotificationRequestImpl(
      {@JsonKey(name: 'user_id') this.userId,
      required this.title,
      required this.body,
      this.read});

  factory _$CreateNotificationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateNotificationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String title;
  @override
  final String body;
  @override
  final bool? read;

  @override
  String toString() {
    return 'CreateNotificationRequest(userId: $userId, title: $title, body: $body, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotificationRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, title, body, read);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotificationRequestImplCopyWith<_$CreateNotificationRequestImpl>
      get copyWith => __$$CreateNotificationRequestImplCopyWithImpl<
          _$CreateNotificationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNotificationRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateNotificationRequest implements CreateNotificationRequest {
  const factory _CreateNotificationRequest(
      {@JsonKey(name: 'user_id') final String? userId,
      required final String title,
      required final String body,
      final bool? read}) = _$CreateNotificationRequestImpl;

  factory _CreateNotificationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateNotificationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String get title;
  @override
  String get body;
  @override
  bool? get read;
  @override
  @JsonKey(ignore: true)
  _$$CreateNotificationRequestImplCopyWith<_$CreateNotificationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
