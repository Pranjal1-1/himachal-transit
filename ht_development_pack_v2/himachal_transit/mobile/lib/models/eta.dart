import 'package:freezed_annotation/freezed_annotation.dart';

part 'eta.freezed.dart';
part 'eta.g.dart';

@freezed
class EtaResult with _$EtaResult {
  const factory EtaResult({
    required double distanceToNextStopKm,
    required int etaMinutes,
    required double currentSpeedKmh,
    EtaNextStop? nextStop,
    required int remainingStops,
    required double totalRemainingDistanceKm,
    required int etaToDestinationMinutes,
    required int currentRouteIndex,
  }) = _EtaResult;

  factory EtaResult.fromJson(Map<String, dynamic> json) => _$EtaResultFromJson(json);
}

@freezed
class EtaNextStop with _$EtaNextStop {
  const factory EtaNextStop({
    required String name,
    required double latitude,
    required double longitude,
    required int stopOrder,
  }) = _EtaNextStop;

  factory EtaNextStop.fromJson(Map<String, dynamic> json) => _$EtaNextStopFromJson(json);
}