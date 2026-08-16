import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:himachal_transit_mobile/models/route_model.dart';

part 'saved_route.freezed.dart';
part 'saved_route.g.dart';

@freezed
class SavedRoute with _$SavedRoute {
  const factory SavedRoute({
    required String id,
    required String userId,
    required String routeId,
    required int createdAt,
    Route? route,
  }) = _SavedRoute;

  factory SavedRoute.fromJson(Map<String, dynamic> json) => _$SavedRouteFromJson(json);
}