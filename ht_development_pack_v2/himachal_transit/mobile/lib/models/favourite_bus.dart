import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:himachal_transit_mobile/models/bus_model.dart';

part 'favourite_bus.freezed.dart';
part 'favourite_bus.g.dart';

@freezed
class FavouriteBus with _$FavouriteBus {
  const factory FavouriteBus({
    required String id,
    required String userId,
    required String busId,
    required int createdAt,
    Bus? bus,
  }) = _FavouriteBus;

  factory FavouriteBus.fromJson(Map<String, dynamic> json) => _$FavouriteBusFromJson(json);
}