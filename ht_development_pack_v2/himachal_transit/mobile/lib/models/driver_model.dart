import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'driver_model.freezed.dart';
part 'driver_model.g.dart';

@freezed
class Driver with _$Driver {
  const factory Driver({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'employee_id') String? employeeId,
    @JsonKey(name: 'verification_status') required String verificationStatus,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    // Nested user data
    User? user,
  }) = _Driver;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

@freezed
class CreateDriverRequest with _$CreateDriverRequest {
  const factory CreateDriverRequest({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'organization_id') required String organizationId,
    @JsonKey(name: 'employee_id') required String employeeId,
    @JsonKey(name: 'verification_status') String? verificationStatus,
  }) = _CreateDriverRequest;

  factory CreateDriverRequest.fromJson(Map<String, dynamic> json) => _$CreateDriverRequestFromJson(json);
}