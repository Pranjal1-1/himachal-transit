import 'package:freezed_annotation/freezed_annotation.dart';
import 'bus_model.dart';
import 'route_model.dart';
import 'driver_model.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    @JsonKey(name: 'driver_id') String? driverId,
    @JsonKey(name: 'bus_id') String? busId,
    @JsonKey(name: 'route_id') String? routeId,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    required String status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    // Nested data
    @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus,
    @JsonKey(name: 'route', fromJson: _routeFromJson) Route? route,
    @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

Bus? _busFromJson(Map<String, dynamic>? json) => json != null ? Bus.fromJson(json) : null;
Route? _routeFromJson(Map<String, dynamic>? json) => json != null ? Route.fromJson(json) : null;
Driver? _driverFromJson(Map<String, dynamic>? json) => json != null ? Driver.fromJson(json) : null;

@freezed
class CreateTripRequest with _$CreateTripRequest {
  const factory CreateTripRequest({
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'bus_id') required String busId,
    @JsonKey(name: 'route_id') required String routeId,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    String? status,
  }) = _CreateTripRequest;

  factory CreateTripRequest.fromJson(Map<String, dynamic> json) => _$CreateTripRequestFromJson(json);
}

@freezed
class UpdateTripRequest with _$UpdateTripRequest {
  const factory UpdateTripRequest({
    @JsonKey(name: 'driver_id') String? driverId,
    @JsonKey(name: 'bus_id') String? busId,
    @JsonKey(name: 'route_id') String? routeId,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    String? status,
  }) = _UpdateTripRequest;

  factory UpdateTripRequest.fromJson(Map<String, dynamic> json) => _$UpdateTripRequestFromJson(json);
}

@freezed
class GpsLocation with _$GpsLocation {
  const factory GpsLocation({
    required String id,
    @JsonKey(name: 'trip_id') required String tripId,
    required double latitude,
    required double longitude,
    double? speed,
    double? heading,
    double? accuracy,
    @JsonKey(name: 'recorded_at') required String recordedAt,
    @JsonKey(name: 'geom') Map<String, dynamic>? geom,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _GpsLocation;

  factory GpsLocation.fromJson(Map<String, dynamic> json) => _$GpsLocationFromJson(json);
}

@freezed
class CreateGpsLocationRequest with _$CreateGpsLocationRequest {
  const factory CreateGpsLocationRequest({
    @JsonKey(name: 'trip_id') required String tripId,
    required double latitude,
    required double longitude,
    double? speed,
    double? heading,
    double? accuracy,
    @JsonKey(name: 'recorded_at') String? recordedAt,
  }) = _CreateGpsLocationRequest;

  factory CreateGpsLocationRequest.fromJson(Map<String, dynamic> json) => _$CreateGpsLocationRequestFromJson(json);
}