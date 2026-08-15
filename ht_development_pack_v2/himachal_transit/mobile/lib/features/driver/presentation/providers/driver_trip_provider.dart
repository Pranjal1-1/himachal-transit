import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:himachal_transit_mobile/services/api_repository.dart';
import 'package:himachal_transit_mobile/core/services/gps_tracking_service.dart';
import 'package:himachal_transit_mobile/models/trip_model.dart';

// GPS Tracking State
class GpsTrackingState {
  final Position? lastPosition;
  final DateTime? lastUpdate;
  final String? error;
  
  const GpsTrackingState({
    this.lastPosition,
    this.lastUpdate,
    this.error,
  });
  
  GpsTrackingState copyWith({
    Position? lastPosition,
    DateTime? lastUpdate,
    String? error,
  }) {
    return GpsTrackingState(
      lastPosition: lastPosition ?? this.lastPosition,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      error: error ?? this.error,
    );
  }
}

// Driver Trip State
class DriverTripState {
  final AsyncValue<Trip> trip;
  final GpsTrackingState gpsState;
  final bool isTracking;
  final int offlineQueueSize;
  final String? activeTripId;
  
  const DriverTripState({
    this.trip = const AsyncValue.loading(),
    this.gpsState = const GpsTrackingState(),
    this.isTracking = false,
    this.offlineQueueSize = 0,
    this.activeTripId,
  });
  
  DriverTripState copyWith({
    AsyncValue<Trip>? trip,
    GpsTrackingState? gpsState,
    bool? isTracking,
    int? offlineQueueSize,
    String? activeTripId,
  }) {
    return DriverTripState(
      trip: trip ?? this.trip,
      gpsState: gpsState ?? this.gpsState,
      isTracking: isTracking ?? this.isTracking,
      offlineQueueSize: offlineQueueSize ?? this.offlineQueueSize,
      activeTripId: activeTripId ?? this.activeTripId,
    );
  }
}

// Driver Trip Notifier
class DriverTripNotifier extends StateNotifier<DriverTripState> {
  final ApiRepository _apiRepository;
  final GpsTrackingService _gpsService;
  Timer? _pollingTimer;
  
  DriverTripNotifier(this._apiRepository, this._gpsService) 
      : super(const DriverTripState());
  
  // Load trip details
  Future<void> loadTrip(String tripId) async {
    state = state.copyWith(trip: const AsyncValue.loading());
    try {
      final trip = await _apiRepository.getTripById(tripId);
      state = state.copyWith(trip: AsyncValue.data(trip), activeTripId: tripId);
    } catch (e) {
      state = state.copyWith(trip: AsyncValue.error(e, StackTrace.current));
    }
  }
  
  // Start GPS tracking
  Future<void> startTracking(String tripId) async {
    final success = await _gpsService.startTracking(tripId);
    if (success) {
      state = state.copyWith(
        isTracking: true,
        activeTripId: tripId,
      );
      _startPolling();
    }
  }
  
  // Stop GPS tracking
  Future<void> stopTracking() async {
    await _gpsService.stopTracking();
    _pollingTimer?.cancel();
    _pollingTimer = null;
    state = state.copyWith(
      isTracking: false,
      activeTripId: null,
    );
  }
  
  // End trip
  Future<void> endTrip(String tripId) async {
    await _apiRepository.updateTrip(tripId, UpdateTripRequest(
      status: 'COMPLETED',
      endTime: DateTime.now().toIso8601String(),
    ));
    await stopTracking();
  }
  
  // Update GPS state from service
  void updateGpsState(GpsTrackingState gpsState) {
    state = state.copyWith(gpsState: gpsState);
  }
  
  // Update offline queue size
  void updateOfflineQueueSize(int size) {
    state = state.copyWith(offlineQueueSize: size);
  }
  
  // Start polling for GPS updates
  void _startPolling() {
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      state = state.copyWith(
        offlineQueueSize: _gpsService.offlineQueueSize,
      );
    });
  }
  
  @override
  void dispose() {
    _pollingTimer?.cancel();
    _gpsService.dispose();
    super.dispose();
  }
}

// Provider for GPS tracking service
final gpsTrackingServiceProvider = Provider<GpsTrackingService>((ref) {
  final apiRepository = ref.watch(apiRepositoryProvider);
  return GpsTrackingService(apiRepository);
});

// Provider for driver trip state
final driverTripProvider = StateNotifierProvider<DriverTripNotifier, DriverTripState>((ref) {
  final apiRepository = ref.watch(apiRepositoryProvider);
  final gpsService = ref.watch(gpsTrackingServiceProvider);
  return DriverTripNotifier(apiRepository, gpsService);
});