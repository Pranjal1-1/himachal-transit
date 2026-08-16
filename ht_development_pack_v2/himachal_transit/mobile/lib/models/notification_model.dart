import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    required String body,
    required bool read,
    required String type,
    @JsonKey(name: 'created_at') required int createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}

@freezed
class CreateNotificationRequest with _$CreateNotificationRequest {
  const factory CreateNotificationRequest({
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    required String body,
    required String type,
    @JsonKey(name: 'created_at') int? createdAt,
    bool? read,
  }) = _CreateNotificationRequest;

  factory CreateNotificationRequest.fromJson(Map<String, dynamic> json) => _$CreateNotificationRequestFromJson(json);
}