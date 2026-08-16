// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedRouteImpl _$$SavedRouteImplFromJson(Map<String, dynamic> json) =>
    _$SavedRouteImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      routeId: json['routeId'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      route: json['route'] == null
          ? null
          : Route.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SavedRouteImplToJson(_$SavedRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'routeId': instance.routeId,
      'createdAt': instance.createdAt,
      'route': instance.route,
    };
