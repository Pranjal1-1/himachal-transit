import 'package:freezed_annotation/freezed_annotation.dart';
import 'driver_model.dart';
import 'bus_model.dart';

part 'assignment_model.freezed.dart';
part 'assignment_model.g.dart';

@freezed
class Assignment with _$Assignment {
  const factory Assignment({
    required String id,
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'bus_id') required String busId,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    required String status,
    @JsonKey(name: 'created_at') String? createdAt,
    // Nested data
    @JsonKey(name: 'driver', fromJson: _driverFromJson) Driver? driver,
    @JsonKey(name: 'bus', fromJson: _busFromJson) Bus? bus,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);
}

Driver? _driverFromJson(Map<String, dynamic>? json) => json != null ? Driver.fromJson(json) : null;
Bus? _busFromJson(Map<String, dynamic>? json) => json != null ? Bus.fromJson(json) : null;

@freezed
class CreateAssignmentRequest with _$CreateAssignmentRequest {
  const factory CreateAssignmentRequest({
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'bus_id') required String busId,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    String? status,
  }) = _CreateAssignmentRequest;

  factory CreateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$CreateAssignmentRequestFromJson(json);
}