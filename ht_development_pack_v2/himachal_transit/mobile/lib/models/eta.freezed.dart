// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EtaResult _$EtaResultFromJson(Map<String, dynamic> json) {
  return _EtaResult.fromJson(json);
}

/// @nodoc
mixin _$EtaResult {
  double get distanceToNextStopKm => throw _privateConstructorUsedError;
  int get etaMinutes => throw _privateConstructorUsedError;
  double get currentSpeedKmh => throw _privateConstructorUsedError;
  EtaNextStop? get nextStop => throw _privateConstructorUsedError;
  int get remainingStops => throw _privateConstructorUsedError;
  double get totalRemainingDistanceKm => throw _privateConstructorUsedError;
  int get etaToDestinationMinutes => throw _privateConstructorUsedError;
  int get currentRouteIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtaResultCopyWith<EtaResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtaResultCopyWith<$Res> {
  factory $EtaResultCopyWith(EtaResult value, $Res Function(EtaResult) then) =
      _$EtaResultCopyWithImpl<$Res, EtaResult>;
  @useResult
  $Res call(
      {double distanceToNextStopKm,
      int etaMinutes,
      double currentSpeedKmh,
      EtaNextStop? nextStop,
      int remainingStops,
      double totalRemainingDistanceKm,
      int etaToDestinationMinutes,
      int currentRouteIndex});

  $EtaNextStopCopyWith<$Res>? get nextStop;
}

/// @nodoc
class _$EtaResultCopyWithImpl<$Res, $Val extends EtaResult>
    implements $EtaResultCopyWith<$Res> {
  _$EtaResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceToNextStopKm = null,
    Object? etaMinutes = null,
    Object? currentSpeedKmh = null,
    Object? nextStop = freezed,
    Object? remainingStops = null,
    Object? totalRemainingDistanceKm = null,
    Object? etaToDestinationMinutes = null,
    Object? currentRouteIndex = null,
  }) {
    return _then(_value.copyWith(
      distanceToNextStopKm: null == distanceToNextStopKm
          ? _value.distanceToNextStopKm
          : distanceToNextStopKm // ignore: cast_nullable_to_non_nullable
              as double,
      etaMinutes: null == etaMinutes
          ? _value.etaMinutes
          : etaMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentSpeedKmh: null == currentSpeedKmh
          ? _value.currentSpeedKmh
          : currentSpeedKmh // ignore: cast_nullable_to_non_nullable
              as double,
      nextStop: freezed == nextStop
          ? _value.nextStop
          : nextStop // ignore: cast_nullable_to_non_nullable
              as EtaNextStop?,
      remainingStops: null == remainingStops
          ? _value.remainingStops
          : remainingStops // ignore: cast_nullable_to_non_nullable
              as int,
      totalRemainingDistanceKm: null == totalRemainingDistanceKm
          ? _value.totalRemainingDistanceKm
          : totalRemainingDistanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      etaToDestinationMinutes: null == etaToDestinationMinutes
          ? _value.etaToDestinationMinutes
          : etaToDestinationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentRouteIndex: null == currentRouteIndex
          ? _value.currentRouteIndex
          : currentRouteIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EtaNextStopCopyWith<$Res>? get nextStop {
    if (_value.nextStop == null) {
      return null;
    }

    return $EtaNextStopCopyWith<$Res>(_value.nextStop!, (value) {
      return _then(_value.copyWith(nextStop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EtaResultImplCopyWith<$Res>
    implements $EtaResultCopyWith<$Res> {
  factory _$$EtaResultImplCopyWith(
          _$EtaResultImpl value, $Res Function(_$EtaResultImpl) then) =
      __$$EtaResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double distanceToNextStopKm,
      int etaMinutes,
      double currentSpeedKmh,
      EtaNextStop? nextStop,
      int remainingStops,
      double totalRemainingDistanceKm,
      int etaToDestinationMinutes,
      int currentRouteIndex});

  @override
  $EtaNextStopCopyWith<$Res>? get nextStop;
}

/// @nodoc
class __$$EtaResultImplCopyWithImpl<$Res>
    extends _$EtaResultCopyWithImpl<$Res, _$EtaResultImpl>
    implements _$$EtaResultImplCopyWith<$Res> {
  __$$EtaResultImplCopyWithImpl(
      _$EtaResultImpl _value, $Res Function(_$EtaResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceToNextStopKm = null,
    Object? etaMinutes = null,
    Object? currentSpeedKmh = null,
    Object? nextStop = freezed,
    Object? remainingStops = null,
    Object? totalRemainingDistanceKm = null,
    Object? etaToDestinationMinutes = null,
    Object? currentRouteIndex = null,
  }) {
    return _then(_$EtaResultImpl(
      distanceToNextStopKm: null == distanceToNextStopKm
          ? _value.distanceToNextStopKm
          : distanceToNextStopKm // ignore: cast_nullable_to_non_nullable
              as double,
      etaMinutes: null == etaMinutes
          ? _value.etaMinutes
          : etaMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentSpeedKmh: null == currentSpeedKmh
          ? _value.currentSpeedKmh
          : currentSpeedKmh // ignore: cast_nullable_to_non_nullable
              as double,
      nextStop: freezed == nextStop
          ? _value.nextStop
          : nextStop // ignore: cast_nullable_to_non_nullable
              as EtaNextStop?,
      remainingStops: null == remainingStops
          ? _value.remainingStops
          : remainingStops // ignore: cast_nullable_to_non_nullable
              as int,
      totalRemainingDistanceKm: null == totalRemainingDistanceKm
          ? _value.totalRemainingDistanceKm
          : totalRemainingDistanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      etaToDestinationMinutes: null == etaToDestinationMinutes
          ? _value.etaToDestinationMinutes
          : etaToDestinationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      currentRouteIndex: null == currentRouteIndex
          ? _value.currentRouteIndex
          : currentRouteIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EtaResultImpl implements _EtaResult {
  const _$EtaResultImpl(
      {required this.distanceToNextStopKm,
      required this.etaMinutes,
      required this.currentSpeedKmh,
      this.nextStop,
      required this.remainingStops,
      required this.totalRemainingDistanceKm,
      required this.etaToDestinationMinutes,
      required this.currentRouteIndex});

  factory _$EtaResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtaResultImplFromJson(json);

  @override
  final double distanceToNextStopKm;
  @override
  final int etaMinutes;
  @override
  final double currentSpeedKmh;
  @override
  final EtaNextStop? nextStop;
  @override
  final int remainingStops;
  @override
  final double totalRemainingDistanceKm;
  @override
  final int etaToDestinationMinutes;
  @override
  final int currentRouteIndex;

  @override
  String toString() {
    return 'EtaResult(distanceToNextStopKm: $distanceToNextStopKm, etaMinutes: $etaMinutes, currentSpeedKmh: $currentSpeedKmh, nextStop: $nextStop, remainingStops: $remainingStops, totalRemainingDistanceKm: $totalRemainingDistanceKm, etaToDestinationMinutes: $etaToDestinationMinutes, currentRouteIndex: $currentRouteIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtaResultImpl &&
            (identical(other.distanceToNextStopKm, distanceToNextStopKm) ||
                other.distanceToNextStopKm == distanceToNextStopKm) &&
            (identical(other.etaMinutes, etaMinutes) ||
                other.etaMinutes == etaMinutes) &&
            (identical(other.currentSpeedKmh, currentSpeedKmh) ||
                other.currentSpeedKmh == currentSpeedKmh) &&
            (identical(other.nextStop, nextStop) ||
                other.nextStop == nextStop) &&
            (identical(other.remainingStops, remainingStops) ||
                other.remainingStops == remainingStops) &&
            (identical(
                    other.totalRemainingDistanceKm, totalRemainingDistanceKm) ||
                other.totalRemainingDistanceKm == totalRemainingDistanceKm) &&
            (identical(
                    other.etaToDestinationMinutes, etaToDestinationMinutes) ||
                other.etaToDestinationMinutes == etaToDestinationMinutes) &&
            (identical(other.currentRouteIndex, currentRouteIndex) ||
                other.currentRouteIndex == currentRouteIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      distanceToNextStopKm,
      etaMinutes,
      currentSpeedKmh,
      nextStop,
      remainingStops,
      totalRemainingDistanceKm,
      etaToDestinationMinutes,
      currentRouteIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EtaResultImplCopyWith<_$EtaResultImpl> get copyWith =>
      __$$EtaResultImplCopyWithImpl<_$EtaResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtaResultImplToJson(
      this,
    );
  }
}

abstract class _EtaResult implements EtaResult {
  const factory _EtaResult(
      {required final double distanceToNextStopKm,
      required final int etaMinutes,
      required final double currentSpeedKmh,
      final EtaNextStop? nextStop,
      required final int remainingStops,
      required final double totalRemainingDistanceKm,
      required final int etaToDestinationMinutes,
      required final int currentRouteIndex}) = _$EtaResultImpl;

  factory _EtaResult.fromJson(Map<String, dynamic> json) =
      _$EtaResultImpl.fromJson;

  @override
  double get distanceToNextStopKm;
  @override
  int get etaMinutes;
  @override
  double get currentSpeedKmh;
  @override
  EtaNextStop? get nextStop;
  @override
  int get remainingStops;
  @override
  double get totalRemainingDistanceKm;
  @override
  int get etaToDestinationMinutes;
  @override
  int get currentRouteIndex;
  @override
  @JsonKey(ignore: true)
  _$$EtaResultImplCopyWith<_$EtaResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EtaNextStop _$EtaNextStopFromJson(Map<String, dynamic> json) {
  return _EtaNextStop.fromJson(json);
}

/// @nodoc
mixin _$EtaNextStop {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get stopOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EtaNextStopCopyWith<EtaNextStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtaNextStopCopyWith<$Res> {
  factory $EtaNextStopCopyWith(
          EtaNextStop value, $Res Function(EtaNextStop) then) =
      _$EtaNextStopCopyWithImpl<$Res, EtaNextStop>;
  @useResult
  $Res call({String name, double latitude, double longitude, int stopOrder});
}

/// @nodoc
class _$EtaNextStopCopyWithImpl<$Res, $Val extends EtaNextStop>
    implements $EtaNextStopCopyWith<$Res> {
  _$EtaNextStopCopyWithImpl(this._value, this._then);

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
    Object? stopOrder = null,
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
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EtaNextStopImplCopyWith<$Res>
    implements $EtaNextStopCopyWith<$Res> {
  factory _$$EtaNextStopImplCopyWith(
          _$EtaNextStopImpl value, $Res Function(_$EtaNextStopImpl) then) =
      __$$EtaNextStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double latitude, double longitude, int stopOrder});
}

/// @nodoc
class __$$EtaNextStopImplCopyWithImpl<$Res>
    extends _$EtaNextStopCopyWithImpl<$Res, _$EtaNextStopImpl>
    implements _$$EtaNextStopImplCopyWith<$Res> {
  __$$EtaNextStopImplCopyWithImpl(
      _$EtaNextStopImpl _value, $Res Function(_$EtaNextStopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? stopOrder = null,
  }) {
    return _then(_$EtaNextStopImpl(
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
      stopOrder: null == stopOrder
          ? _value.stopOrder
          : stopOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EtaNextStopImpl implements _EtaNextStop {
  const _$EtaNextStopImpl(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.stopOrder});

  factory _$EtaNextStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtaNextStopImplFromJson(json);

  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int stopOrder;

  @override
  String toString() {
    return 'EtaNextStop(name: $name, latitude: $latitude, longitude: $longitude, stopOrder: $stopOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtaNextStopImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.stopOrder, stopOrder) ||
                other.stopOrder == stopOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, latitude, longitude, stopOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EtaNextStopImplCopyWith<_$EtaNextStopImpl> get copyWith =>
      __$$EtaNextStopImplCopyWithImpl<_$EtaNextStopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EtaNextStopImplToJson(
      this,
    );
  }
}

abstract class _EtaNextStop implements EtaNextStop {
  const factory _EtaNextStop(
      {required final String name,
      required final double latitude,
      required final double longitude,
      required final int stopOrder}) = _$EtaNextStopImpl;

  factory _EtaNextStop.fromJson(Map<String, dynamic> json) =
      _$EtaNextStopImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get stopOrder;
  @override
  @JsonKey(ignore: true)
  _$$EtaNextStopImplCopyWith<_$EtaNextStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
