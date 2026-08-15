import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:himachal_transit_mobile/services/api_repository.dart';
import 'package:himachal_transit_mobile/core/services/secure_storage_service.dart';
import 'package:himachal_transit_mobile/core/services/realtime_service.dart';
import 'package:himachal_transit_mobile/models/trip_model.dart';
import 'location_service.dart';

class GpsTrackingService {
  static const _offlineQueueKey = 'gps_offline_queue';
  static const _activeTripKey = 'active_trip_id';

  final ApiRepository _apiRepository;
  final RealtimeService _realtimeService;
  StreamSubscription<Position>? _positionSubscription;
  String? _activeTripId;
  bool _isTracking = false;
  final List<CreateGpsLocationRequest> _offlineQueue = [];

  GpsTrackingService(this._apiRepository, this._realtimeService);

  // Initialize the service
  Future<void> initialize() async {
    _activeTripId = await SecureStorageService.getActiveTripId();
    await _loadOfflineQueue();
    if (_activeTripId != null) {
      await startTracking(_activeTripId!);
    }
  }

  // Start GPS tracking for a trip
  Future<bool> startTracking(String tripId) async {
    if (_isTracking) {
      await stopTracking();
    }

    // Check permissions
    final hasPermission = await LocationService.isLocationPermissionGranted();
    if (!hasPermission) {
      final granted = await LocationService.requestLocationPermission();
      if (!granted) return false;
    }

    // Check if location services are enabled
    final serviceEnabled = await LocationService.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await LocationService.openLocationSettings();
      return false;
    }

    _activeTripId = tripId;
    await SecureStorageService.setActiveTripId(tripId);
    _isTracking = true;

    // Start position stream
    _positionSubscription = LocationService.getPositionStream(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update every 10 meters
    ).listen(
      _onPositionUpdate,
      onError: _onPositionError,
    );

    // Send any queued offline locations
    await _flushOfflineQueue();

    return true;
  }

  // Stop GPS tracking
  Future<void> stopTracking() async {
    _isTracking = false;
    _activeTripId = null;
    await SecureStorageService.clearActiveTripId();
    await _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  // Handle position updates
  void _onPositionUpdate(Position position) {
    if (!_isTracking || _activeTripId == null) return;

    final request = CreateGpsLocationRequest(
      tripId: _activeTripId!,
      latitude: position.latitude,
      longitude: position.longitude,
      speed: position.speed,
      heading: position.heading,
      accuracy: position.accuracy,
      recordedAt: position.timestamp.toIso8601String(),
    );

    _sendLocation(request);
  }

  // Handle position stream errors
  void _onPositionError(dynamic error) {
    debugPrint('GPS tracking error: $error');
  }

  // Send location to backend
  Future<void> _sendLocation(CreateGpsLocationRequest request) async {
    try {
      await _apiRepository.addGpsLocation(request);
      
      // Also send via WebSocket for realtime updates
      if (_activeTripId != null) {
        _realtimeService.sendDriverLocation(
          tripId: _activeTripId!,
          latitude: request.latitude,
          longitude: request.longitude,
          speed: request.speed,
          heading: request.heading,
          accuracy: request.accuracy,
        );
      }
    } catch (e) {
      debugPrint('Failed to send GPS location: $e');
      _queueOffline(request);
    }
  }

  // Queue location for offline sending
  void _queueOffline(CreateGpsLocationRequest request) {
    _offlineQueue.add(request);
    _saveOfflineQueue();
  }

  // Flush offline queue
  Future<void> _flushOfflineQueue() async {
    if (_offlineQueue.isEmpty) return;

    final queue = List<CreateGpsLocationRequest>.from(_offlineQueue);
    _offlineQueue.clear();

    for (final request in queue) {
      try {
        await _apiRepository.addGpsLocation(request);
      } catch (e) {
        debugPrint('Failed to flush offline GPS location: $e');
        _offlineQueue.add(request);
      }
    }

    await _saveOfflineQueue();
  }

  // Load offline queue from storage
  Future<void> _loadOfflineQueue() async {
    final json = await SecureStorageService.getOfflineGpsQueue();
    if (json != null) {
      try {
        final List<dynamic> decoded = jsonDecode(json);
        _offlineQueue.addAll(decoded.map((e) => CreateGpsLocationRequest.fromJson(e)).toList());
      } catch (e) {
        debugPrint('Error loading offline GPS queue: $e');
      }
    }
  }

  // Save offline queue to storage
  Future<void> _saveOfflineQueue() async {
    final json = jsonEncode(_offlineQueue.map((e) => e.toJson()).toList());
    await SecureStorageService.setOfflineGpsQueue(json);
  }

  // Get current tracking status
  bool get isTracking => _isTracking;
  String? get activeTripId => _activeTripId;
  int get offlineQueueSize => _offlineQueue.length;

  // Dispose resources
  void dispose() {
    stopTracking();
  }
}

// Provider for GPS tracking service
// Note: This will be initialized in the app startup