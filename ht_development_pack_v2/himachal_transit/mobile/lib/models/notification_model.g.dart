// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      read: json['read'] as bool,
      type: json['type'] as String,
      createdAt: (json['created_at'] as num).toInt(),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'type': instance.type,
      'created_at': instance.createdAt,
    };

_$CreateNotificationRequestImpl _$$CreateNotificationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateNotificationRequestImpl(
      userId: json['user_id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      createdAt: (json['created_at'] as num?)?.toInt(),
      read: json['read'] as bool?,
    );

Map<String, dynamic> _$$CreateNotificationRequestImplToJson(
        _$CreateNotificationRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'created_at': instance.createdAt,
      'read': instance.read,
    };
