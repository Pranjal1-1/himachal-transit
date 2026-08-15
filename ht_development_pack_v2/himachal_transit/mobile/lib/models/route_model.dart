import 'package:freezed_annotation/freezed_annotation.dart';
import 'stop_model.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

enum RouteStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inactive,
}

@freezed
class Route with _$Route {
  const factory Route({
    required String id,
    @JsonKey(name: 'organization_id') required String organizationId,
    required String name,
    String? origin,
    String? destination,
    String? geometry,
    required RouteStatus status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@freezed
class RouteStop with _$RouteStop {
  const factory RouteStop({
    required String id,
    @JsonKey(name: 'route_id') required String routeId,
    @JsonKey(name: 'stop_id') required String stopId,
    @JsonKey(name: 'stop_order') required int stopOrder,
    @JsonKey(name: 'created_at') String? createdAt,
    // Nested stop data
    @JsonKey(name: 'stop', fromJson: _stopFromJson) Stop? stop,
  }) = _RouteStop;

  factory RouteStop.fromJson(Map<String, dynamic> json) => _$RouteStopFromJson(json);
}

Stop? _stopFromJson(Map<String, dynamic>? json) => json != null ? Stop.fromJson(json) : null;

@freezed
class CreateRouteRequest with _$CreateRouteRequest {
  const factory CreateRouteRequest({
    @JsonKey(name: 'organization_id') required String organizationId,
    required String name,
    String? origin,
    String? destination,
    String? geometry,
    RouteStatus? status,
  }) = _CreateRouteRequest;

  factory CreateRouteRequest.fromJson(Map<String, dynamic> json) => _$CreateRouteRequestFromJson(json);
}

@freezed
class UpdateRouteRequest with _$UpdateRouteRequest {
  const factory UpdateRouteRequest({
    String? name,
    String? origin,
    String? destination,
    String? geometry,
    RouteStatus? status,
  }) = _UpdateRouteRequest;

  factory UpdateRouteRequest.fromJson(Map<String, dynamic> json) => _$UpdateRouteRequestFromJson(json);
}

@freezed
class CreateRouteStopRequest with _$CreateRouteStopRequest {
  const factory CreateRouteStopRequest({
    @JsonKey(name: 'route_id') required String routeId,
    @JsonKey(name: 'stop_id') required String stopId,
    @JsonKey(name: 'stop_order') required int stopOrder,
  }) = _CreateRouteStopRequest;

  factory CreateRouteStopRequest.fromJson(Map<String, dynamic> json) => _$CreateRouteStopRequestFromJson(json);
}