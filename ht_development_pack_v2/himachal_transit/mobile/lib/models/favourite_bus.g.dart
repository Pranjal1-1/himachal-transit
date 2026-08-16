// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteBusImpl _$$FavouriteBusImplFromJson(Map<String, dynamic> json) =>
    _$FavouriteBusImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      busId: json['busId'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      bus: json['bus'] == null
          ? null
          : Bus.fromJson(json['bus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavouriteBusImplToJson(_$FavouriteBusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'busId': instance.busId,
      'createdAt': instance.createdAt,
      'bus': instance.bus,
    };
