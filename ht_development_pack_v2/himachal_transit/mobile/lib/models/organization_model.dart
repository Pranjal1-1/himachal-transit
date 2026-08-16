import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String code,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
}

@freezed
class CreateOrganizationRequest with _$CreateOrganizationRequest {
  const factory CreateOrganizationRequest({
    required String name,
    required String code,
  }) = _CreateOrganizationRequest;

  factory CreateOrganizationRequest.fromJson(Map<String, dynamic> json) => _$CreateOrganizationRequestFromJson(json);
}