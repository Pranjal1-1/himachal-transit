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
    NearbyBusGpsLocation? lastLocation,
  }) = _NearbyBus;

  factory NearbyBus.fromJson(Map<String, dynamic> json) => _$NearbyBusFromJson(json);
}

// Simple GpsLocation model for nearby buses
@freezed
class NearbyBusGpsLocation with _$NearbyBusGpsLocation {
  const factory NearbyBusGpsLocation({
    required String id,
    required String tripId,
    required double latitude,
    required double longitude,
    double? speed,
    double? heading,
    double? accuracy,
    required int recordedAt,
  }) = _NearbyBusGpsLocation;

  factory NearbyBusGpsLocation.fromJson(Map<String, dynamic> json) => _$NearbyBusGpsLocationFromJson(json);
}