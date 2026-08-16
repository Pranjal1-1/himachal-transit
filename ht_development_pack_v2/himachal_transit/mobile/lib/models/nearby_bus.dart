import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:himachal_transit_mobile/models/bus_model.dart';
import 'package:himachal_transit_mobile/models/route_model.dart';
import 'package:himachal_transit_mobile/models/trip_model.dart';

part 'nearby_bus.freezed.dart';
part 'nearby_bus.g.dart';

@freezed
class NearbyBus with _$NearbyBus {
  const factory NearbyBus({
    required Bus bus,
    Route? route,
    Trip? trip,
    required double distance,
    GpsLocation? lastLocation,
  }) = _NearbyBus;

  factory NearbyBus.fromJson(Map<String, dynamic> json) => _$NearbyBusFromJson(json);
}

// Simple GpsLocation model for nearby buses
@freezed
class GpsLocation with _$GpsLocation {
  const factory GpsLocation({
    required String id,
    required String tripId,
    required double latitude,
    required double longitude,
    double? speed,
    double? heading,
    double? accuracy,
    required int recordedAt,
  }) = _GpsLocation;

  factory GpsLocation.fromJson(Map<String, dynamic> json) => _$GpsLocationFromJson(json);
}