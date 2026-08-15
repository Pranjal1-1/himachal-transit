import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_model.freezed.dart';
part 'stop_model.g.dart';

enum StopStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('MAINTENANCE')
  maintenance,
}

@freezed
class Stop with _$Stop {
  const factory Stop({
    required String id,
    required String name,
    double? latitude,
    double? longitude,
    String? address,
    required StopStatus status,
    @JsonKey(name: 'geom') Map<String, dynamic>? geom,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Stop;

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
}

@freezed
class CreateStopRequest with _$CreateStopRequest {
  const factory CreateStopRequest({
    required String name,
    required double latitude,
    required double longitude,
    String? address,
    StopStatus? status,
  }) = _CreateStopRequest;

  factory CreateStopRequest.fromJson(Map<String, dynamic> json) => _$CreateStopRequestFromJson(json);
}

@freezed
class UpdateStopRequest with _$UpdateStopRequest {
  const factory UpdateStopRequest({
    String? name,
    double? latitude,
    double? longitude,
    String? address,
    StopStatus? status,
  }) = _UpdateStopRequest;

  factory UpdateStopRequest.fromJson(Map<String, dynamic> json) => _$UpdateStopRequestFromJson(json);
}