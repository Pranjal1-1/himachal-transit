import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himachal_transit_mobile/core/services/api_service.dart';
import 'package:himachal_transit_mobile/models/bus_model.dart';
import 'package:himachal_transit_mobile/models/route_model.dart';
import 'package:himachal_transit_mobile/models/stop_model.dart';
import 'package:himachal_transit_mobile/models/trip_model.dart';
import 'package:himachal_transit_mobile/models/driver_model.dart';
import 'package:himachal_transit_mobile/models/assignment_model.dart';
import 'package:himachal_transit_mobile/models/organization_model.dart';
import 'package:himachal_transit_mobile/models/notification_model.dart';
import 'package:himachal_transit_mobile/models/nearby_bus.dart';
import 'package:himachal_transit_mobile/models/saved_route.dart';
import 'package:himachal_transit_mobile/models/favourite_bus.dart';

abstract class ApiRepository {
  // Buses
  Future<List<Bus>> getBuses();
  Future<Bus> getBusById(String busId);
  Future<Bus> createBus(CreateBusRequest request);
  Future<Bus> updateBus(String busId, UpdateBusRequest request);
  
  // Search
  Future<List<Bus>> searchBuses({String? origin, String? destination});
  Future<List<NearbyBus>> getNearbyBuses(double latitude, double longitude, {double radiusKm = 10});
  
  // Routes
  Future<List<Route>> getRoutes();
  Future<Route> getRouteById(String routeId);
  Future<Route> createRoute(CreateRouteRequest request);
  Future<Route> updateRoute(String routeId, UpdateRouteRequest request);
  Future<List<RouteStop>> getRouteStops(String routeId);
  Future<RouteStop> createRouteStop(CreateRouteStopRequest request);
  
  // Stops
  Future<List<Stop>> getStops();
  Future<Stop> getStopById(String stopId);
  Future<Stop> createStop(CreateStopRequest request);
  Future<Stop> updateStop(String stopId, UpdateStopRequest request);
  
  // Trips
  Future<List<Trip>> getTrips();
  Future<Trip> getTripById(String tripId);
  Future<Trip> createTrip(CreateTripRequest request);
  Future<Trip> updateTrip(String tripId, UpdateTripRequest request);
  
  // GPS Locations
  Future<List<GpsLocation>> getGpsLocations(String tripId);
  Future<GpsLocation> addGpsLocation(CreateGpsLocationRequest request);
  
  // Assignments
  Future<List<Assignment>> getAssignments();
  Future<Assignment> createAssignment(CreateAssignmentRequest request);
  
  // Organizations
  Future<List<Organization>> getOrganizations();
  Future<Organization> createOrganization(CreateOrganizationRequest request);
  
  // Drivers
  Future<List<Driver>> getDrivers();
  Future<Driver> createDriver(CreateDriverRequest request);
  
  // Saved Routes
  Future<List<SavedRoute>> getSavedRoutes();
  Future<SavedRoute> saveRoute(String routeId);
  Future<void> unsaveRoute(String routeId);
  
  // Favourite Buses
  Future<List<FavouriteBus>> getFavouriteBuses();
  Future<FavouriteBus> favouriteBus(String busId);
  Future<void> unfavouriteBus(String busId);
  
  // Notifications
  Future<List<Notification>> getNotifications({String? userId});
  Future<Notification> createNotification(CreateNotificationRequest request);
}

class ApiRepositoryImpl implements ApiRepository {
  final ApiService _apiService;
  
  ApiRepositoryImpl(this._apiService);
  
  // Buses
  @override
  Future<List<Bus>> getBuses() async {
    final response = await _apiService.get('/buses');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Bus.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch buses');
  }
  
  @override
  Future<Bus> getBusById(String busId) async {
    final response = await _apiService.get('/buses/$busId');
    if (response.statusCode == 200) {
      return Bus.fromJson(response.data);
    }
    throw Exception('Failed to fetch bus');
  }
  
  @override
  Future<Bus> createBus(CreateBusRequest request) async {
    final response = await _apiService.post('/buses', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Bus.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create bus');
  }
  
  @override
  Future<Bus> updateBus(String busId, UpdateBusRequest request) async {
    final response = await _apiService.patch('/buses/$busId', data: request.toJson());
    if (response.statusCode == 200) {
      return Bus.fromJson(response.data);
    }
    throw Exception('Failed to update bus');
  }
  
  // Search
  @override
  Future<List<Bus>> searchBuses({String? origin, String? destination}) async {
    final queryParams = <String, dynamic>{};
    if (origin != null) queryParams['origin'] = origin;
    if (destination != null) queryParams['destination'] = destination;
    
    final response = await _apiService.get('/search/buses', queryParameters: queryParams);
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Bus.fromJson(json)).toList();
    }
    throw Exception('Failed to search buses');
  }
  
  @override
  Future<List<NearbyBus>> getNearbyBuses(double latitude, double longitude, {double radiusKm = 10}) async {
    final response = await _apiService.get('/buses/nearby', queryParameters: {
      'latitude': latitude,
      'longitude': longitude,
      'radiusKm': radiusKm,
    });
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => NearbyBus.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch nearby buses');
  }
  
  // Routes
  @override
  Future<List<Route>> getRoutes() async {
    final response = await _apiService.get('/routes');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Route.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch routes');
  }
  
  @override
  Future<Route> getRouteById(String routeId) async {
    final response = await _apiService.get('/routes/$routeId');
    if (response.statusCode == 200) {
      return Route.fromJson(response.data);
    }
    throw Exception('Failed to fetch route');
  }
  
  @override
  Future<Route> createRoute(CreateRouteRequest request) async {
    final response = await _apiService.post('/routes', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Route.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create route');
  }
  
  @override
  Future<Route> updateRoute(String routeId, UpdateRouteRequest request) async {
    final response = await _apiService.patch('/routes/$routeId', data: request.toJson());
    if (response.statusCode == 200) {
      return Route.fromJson(response.data);
    }
    throw Exception('Failed to update route');
  }
  
  @override
  Future<List<RouteStop>> getRouteStops(String routeId) async {
    final response = await _apiService.get('/routes/$routeId/stops');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => RouteStop.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch route stops');
  }
  
  @override
  Future<RouteStop> createRouteStop(CreateRouteStopRequest request) async {
    final response = await _apiService.post('/route-stops', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return RouteStop.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create route stop');
  }
  
  // Stops
  @override
  Future<List<Stop>> getStops() async {
    final response = await _apiService.get('/stops');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Stop.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch stops');
  }
  
  @override
  Future<Stop> getStopById(String stopId) async {
    final response = await _apiService.get('/stops/$stopId');
    if (response.statusCode == 200) {
      return Stop.fromJson(response.data);
    }
    throw Exception('Failed to fetch stop');
  }
  
  @override
  Future<Stop> createStop(CreateStopRequest request) async {
    final response = await _apiService.post('/stops', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Stop.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create stop');
  }
  
  @override
  Future<Stop> updateStop(String stopId, UpdateStopRequest request) async {
    final response = await _apiService.patch('/stops/$stopId', data: request.toJson());
    if (response.statusCode == 200) {
      return Stop.fromJson(response.data);
    }
    throw Exception('Failed to update stop');
  }
  
  // Trips
  @override
  Future<List<Trip>> getTrips() async {
    final response = await _apiService.get('/trips');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Trip.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch trips');
  }
  
  @override
  Future<Trip> getTripById(String tripId) async {
    final response = await _apiService.get('/trips/$tripId');
    if (response.statusCode == 200) {
      return Trip.fromJson(response.data);
    }
    throw Exception('Failed to fetch trip');
  }
  
  @override
  Future<Trip> createTrip(CreateTripRequest request) async {
    final response = await _apiService.post('/trips', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Trip.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create trip');
  }
  
  @override
  Future<Trip> updateTrip(String tripId, UpdateTripRequest request) async {
    final response = await _apiService.patch('/trips/$tripId', data: request.toJson());
    if (response.statusCode == 200) {
      return Trip.fromJson(response.data);
    }
    throw Exception('Failed to update trip');
  }
  
  // GPS Locations
  @override
  Future<List<GpsLocation>> getGpsLocations(String tripId) async {
    final response = await _apiService.get('/gps', queryParameters: {'tripId': tripId});
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => GpsLocation.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch GPS locations');
  }
  
  @override
  Future<GpsLocation> addGpsLocation(CreateGpsLocationRequest request) async {
    final response = await _apiService.post('/gps', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return GpsLocation.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to add GPS location');
  }
  
  // Assignments
  @override
  Future<List<Assignment>> getAssignments() async {
    final response = await _apiService.get('/assignments');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Assignment.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch assignments');
  }
  
  @override
  Future<Assignment> createAssignment(CreateAssignmentRequest request) async {
    final response = await _apiService.post('/assignments', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Assignment.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create assignment');
  }
  
  // Organizations
  @override
  Future<List<Organization>> getOrganizations() async {
    final response = await _apiService.get('/organizations');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Organization.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch organizations');
  }
  
  @override
  Future<Organization> createOrganization(CreateOrganizationRequest request) async {
    final response = await _apiService.post('/organizations', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Organization.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create organization');
  }
  
  // Drivers
  @override
  Future<List<Driver>> getDrivers() async {
    final response = await _apiService.get('/drivers');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Driver.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch drivers');
  }
  
  @override
  Future<Driver> createDriver(CreateDriverRequest request) async {
    final response = await _apiService.post('/drivers', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Driver.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create driver');
  }
  
  // Notifications
  @override
  Future<List<Notification>> getNotifications({String? userId}) async {
    final response = await _apiService.get('/notifications', queryParameters: userId != null ? {'userId': userId} : null);
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => Notification.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch notifications');
  }
  
  @override
  Future<Notification> createNotification(CreateNotificationRequest request) async {
    final response = await _apiService.post('/notifications', data: request.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Notification.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to create notification');
  }
  
  // Saved Routes
  @override
  Future<List<SavedRoute>> getSavedRoutes() async {
    final response = await _apiService.get('/saved-routes');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => SavedRoute.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch saved routes');
  }
  
  @override
  Future<SavedRoute> saveRoute(String routeId) async {
    final response = await _apiService.post('/saved-routes', data: {'routeId': routeId});
    if (response.statusCode == 201 || response.statusCode == 200) {
      return SavedRoute.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to save route');
  }
  
  @override
  Future<void> unsaveRoute(String routeId) async {
    final response = await _apiService.delete('/saved-routes/$routeId');
    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Failed to unsave route');
    }
  }
  
  // Favourite Buses
  @override
  Future<List<FavouriteBus>> getFavouriteBuses() async {
    final response = await _apiService.get('/favourite-buses');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => FavouriteBus.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch favourite buses');
  }
  
  @override
  Future<FavouriteBus> favouriteBus(String busId) async {
    final response = await _apiService.post('/favourite-buses', data: {'busId': busId});
    if (response.statusCode == 201 || response.statusCode == 200) {
      return FavouriteBus.fromJson(response.data);
    }
    throw Exception(response.data?['error'] ?? 'Failed to favourite bus');
  }
  
  @override
  Future<void> unfavouriteBus(String busId) async {
    final response = await _apiService.delete('/favourite-buses/$busId');
    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception(response.data?['error'] ?? 'Failed to unfavourite bus');
    }
  }
}

// Provider
final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  return ApiRepositoryImpl(apiService);
});