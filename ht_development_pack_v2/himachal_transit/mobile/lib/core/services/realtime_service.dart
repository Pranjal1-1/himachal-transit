import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:himachal_transit_mobile/core/config/app_config.dart';
import 'package:himachal_transit_mobile/core/services/secure_storage_service.dart';

// Realtime event types
enum RealtimeEventType {
  tripStarted,
  tripUpdated,
  tripEnded,
  busLocationUpdated,
  busStatusUpdated,
  busEtaUpdated,
  busAlert,
}

// Base realtime event
class RealtimeEvent {
  final RealtimeEventType type;
  final Map<String, dynamic> payload;
  final DateTime timestamp;

  const RealtimeEvent({
    required this.type,
    required this.payload,
    required this.timestamp,
  });

  factory RealtimeEvent.fromJson(Map<String, dynamic> json) {
    return RealtimeEvent(
      type: _parseEventType(json['event'] as String),
      payload: json['payload'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  static RealtimeEventType _parseEventType(String event) {
    switch (event) {
      case 'trip.started':
        return RealtimeEventType.tripStarted;
      case 'trip.updated':
        return RealtimeEventType.tripUpdated;
      case 'trip.ended':
        return RealtimeEventType.tripEnded;
      case 'bus.location.updated':
        return RealtimeEventType.busLocationUpdated;
      case 'bus.status.updated':
        return RealtimeEventType.busStatusUpdated;
      case 'bus.eta.updated':
        return RealtimeEventType.busEtaUpdated;
      case 'bus.alert':
        return RealtimeEventType.busAlert;
      default:
        throw ArgumentError('Unknown event type: $event');
    }
  }
}

// Bus location updated event
class BusLocationUpdatedEvent {
  final String busId;
  final String tripId;
  final double latitude;
  final double longitude;
  final double? speed;
  final double? heading;
  final double? accuracy;
  final DateTime recordedAt;

  const BusLocationUpdatedEvent({
    required this.busId,
    required this.tripId,
    required this.latitude,
    required this.longitude,
    this.speed,
    this.heading,
    this.accuracy,
    required this.recordedAt,
  });

  factory BusLocationUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return BusLocationUpdatedEvent(
      busId: json['busId'] as String,
      tripId: json['tripId'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      speed: json['speed'] != null ? (json['speed'] as num).toDouble() : null,
      heading: json['heading'] != null ? (json['heading'] as num).toDouble() : null,
      accuracy: json['accuracy'] != null ? (json['accuracy'] as num).toDouble() : null,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
    );
  }
}

// Bus status updated event
class BusStatusUpdatedEvent {
  final String busId;
  final String status;
  final DateTime updatedAt;

  const BusStatusUpdatedEvent({
    required this.busId,
    required this.status,
    required this.updatedAt,
  });

  factory BusStatusUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return BusStatusUpdatedEvent(
      busId: json['busId'] as String,
      status: json['status'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

// Trip started event
class TripStartedEvent {
  final String tripId;
  final String driverId;
  final String busId;
  final String routeId;
  final DateTime startTime;

  const TripStartedEvent({
    required this.tripId,
    required this.driverId,
    required this.busId,
    required this.routeId,
    required this.startTime,
  });

  factory TripStartedEvent.fromJson(Map<String, dynamic> json) {
    return TripStartedEvent(
      tripId: json['tripId'] as String,
      driverId: json['driverId'] as String,
      busId: json['busId'] as String,
      routeId: json['routeId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
    );
  }
}

// Trip updated event
class TripUpdatedEvent {
  final String tripId;
  final String status;
  final DateTime? startTime;
  final DateTime? endTime;

  const TripUpdatedEvent({
    required this.tripId,
    required this.status,
    this.startTime,
    this.endTime,
  });

  factory TripUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return TripUpdatedEvent(
      tripId: json['tripId'] as String,
      status: json['status'] as String,
      startTime: json['startTime'] != null ? DateTime.parse(json['startTime'] as String) : null,
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime'] as String) : null,
    );
  }
}

// Trip ended event
class TripEndedEvent {
  final String tripId;
  final String driverId;
  final String busId;
  final DateTime endTime;

  const TripEndedEvent({
    required this.tripId,
    required this.driverId,
    required this.busId,
    required this.endTime,
  });

  factory TripEndedEvent.fromJson(Map<String, dynamic> json) {
    return TripEndedEvent(
      tripId: json['tripId'] as String,
      driverId: json['driverId'] as String,
      busId: json['busId'] as String,
      endTime: DateTime.parse(json['endTime'] as String),
    );
  }
}

// Bus ETA updated event
class BusEtaUpdatedEvent {
  final String busId;
  final String tripId;
  final double distanceToNextStopKm;
  final int etaMinutes;
  final double currentSpeedKmh;
  final EtaNextStop? nextStop;
  final int remainingStops;
  final double totalRemainingDistanceKm;
  final int etaToDestinationMinutes;
  final int currentRouteIndex;

  const BusEtaUpdatedEvent({
    required this.busId,
    required this.tripId,
    required this.distanceToNextStopKm,
    required this.etaMinutes,
    required this.currentSpeedKmh,
    this.nextStop,
    required this.remainingStops,
    required this.totalRemainingDistanceKm,
    required this.etaToDestinationMinutes,
    required this.currentRouteIndex,
  });

  factory BusEtaUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return BusEtaUpdatedEvent(
      busId: json['busId'] as String,
      tripId: json['tripId'] as String,
      distanceToNextStopKm: (json['distanceToNextStopKm'] as num?)?.toDouble() ?? 0.0,
      etaMinutes: json['etaMinutes'] as int? ?? 0,
      currentSpeedKmh: (json['currentSpeedKmh'] as num?)?.toDouble() ?? 0.0,
      nextStop: json['nextStop'] != null ? EtaNextStop.fromJson(json['nextStop'] as Map<String, dynamic>) : null,
      remainingStops: json['remainingStops'] as int? ?? 0,
      totalRemainingDistanceKm: (json['totalRemainingDistanceKm'] as num?)?.toDouble() ?? 0.0,
      etaToDestinationMinutes: json['etaToDestinationMinutes'] as int? ?? 0,
      currentRouteIndex: json['currentRouteIndex'] as int? ?? 0,
    );
  }
}

class EtaNextStop {
  final String name;
  final double latitude;
  final double longitude;
  final int stopOrder;

  const EtaNextStop({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.stopOrder,
  });

  factory EtaNextStop.fromJson(Map<String, dynamic> json) {
    return EtaNextStop(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      stopOrder: json['stopOrder'] as int,
    );
  }
}

// Bus alert event
class BusAlertEvent {
  final String busId;
  final String tripId;
  final String alertType;
  final String message;
  final String severity;
  final DateTime timestamp;

  const BusAlertEvent({
    required this.busId,
    required this.tripId,
    required this.alertType,
    required this.message,
    required this.severity,
    required this.timestamp,
  });

  factory BusAlertEvent.fromJson(Map<String, dynamic> json) {
    return BusAlertEvent(
      busId: json['busId'] as String,
      tripId: json['tripId'] as String,
      alertType: json['alertType'] as String,
      message: json['message'] as String,
      severity: json['severity'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

// Realtime service state
class RealtimeState {
  final bool isConnected;
  final String? error;
  final BusLocationUpdatedEvent? lastBusLocation;
  final BusStatusUpdatedEvent? lastBusStatus;
  final TripStartedEvent? lastTripStarted;
  final TripUpdatedEvent? lastTripUpdated;
  final TripEndedEvent? lastTripEnded;
  final BusEtaUpdatedEvent? lastBusEta;
  final BusAlertEvent? lastBusAlert;

  const RealtimeState({
    this.isConnected = false,
    this.error,
    this.lastBusLocation,
    this.lastBusStatus,
    this.lastTripStarted,
    this.lastTripUpdated,
    this.lastTripEnded,
    this.lastBusEta,
    this.lastBusAlert,
  });

  RealtimeState copyWith({
    bool? isConnected,
    String? error,
    BusLocationUpdatedEvent? lastBusLocation,
    BusStatusUpdatedEvent? lastBusStatus,
    TripStartedEvent? lastTripStarted,
    TripUpdatedEvent? lastTripUpdated,
    TripEndedEvent? lastTripEnded,
    BusEtaUpdatedEvent? lastBusEta,
    BusAlertEvent? lastBusAlert,
  }) {
    return RealtimeState(
      isConnected: isConnected ?? this.isConnected,
      error: error ?? this.error,
      lastBusLocation: lastBusLocation ?? this.lastBusLocation,
      lastBusStatus: lastBusStatus ?? this.lastBusStatus,
      lastTripStarted: lastTripStarted ?? this.lastTripStarted,
      lastTripUpdated: lastTripUpdated ?? this.lastTripUpdated,
      lastTripEnded: lastTripEnded ?? this.lastTripEnded,
      lastBusEta: lastBusEta ?? this.lastBusEta,
      lastBusAlert: lastBusAlert ?? this.lastBusAlert,
    );
  }
}

// Realtime service
class RealtimeService {
  IO.Socket? _socket;
  final StreamController<RealtimeState> _stateController = StreamController<RealtimeState>.broadcast();
  RealtimeState _currentState = const RealtimeState();
  String? _currentTripId;
  String? _currentBusId;
  String? _currentOrgId;

  Stream<RealtimeState> get stateStream => _stateController.stream;
  RealtimeState get currentState => _currentState;

  // Initialize and connect
  Future<void> connect({String? tripId, String? busId, String? orgId}) async {
    if (_socket != null && _socket!.connected) {
      return;
    }

    _currentTripId = tripId;
    _currentBusId = busId;
    _currentOrgId = orgId;

    final token = await SecureStorageService.getAccessToken();
    final apiUrl = AppConfig.apiBaseUrl;

    _socket = IO.io(apiUrl, <String, dynamic>{
      'transports': ['websocket', 'polling'],
      'autoConnect': true,
      'auth': {'token': token},
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
      'reconnectionDelayMax': 5000,
      'timeout': 10000,
    });

    _socket!.onConnect((_) {
      debugPrint('WebSocket connected');
      _updateState(isConnected: true, error: null);
      _subscribe();
    });

    _socket!.onDisconnect((_) {
      debugPrint('WebSocket disconnected');
      _updateState(isConnected: false);
    });

    _socket!.onConnectError((error) {
      debugPrint('WebSocket connection error: $error');
      _updateState(isConnected: false, error: error.toString());
    });

    _socket!.onError((error) {
      debugPrint('WebSocket error: $error');
      _updateState(error: error.toString());
    });

    _socket!.on('bus.location.updated', (data) {
      debugPrint('Received bus.location.updated: $data');
      final event = BusLocationUpdatedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastBusLocation: event);
    });

    _socket!.on('bus.status.updated', (data) {
      debugPrint('Received bus.status.updated: $data');
      final event = BusStatusUpdatedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastBusStatus: event);
    });

    _socket!.on('trip.started', (data) {
      debugPrint('Received trip.started: $data');
      final event = TripStartedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastTripStarted: event);
    });

    _socket!.on('trip.updated', (data) {
      debugPrint('Received trip.updated: $data');
      final event = TripUpdatedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastTripUpdated: event);
    });

    _socket!.on('trip.ended', (data) {
      debugPrint('Received trip.ended: $data');
      final event = TripEndedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastTripEnded: event);
    });

    _socket!.on('bus.eta.updated', (data) {
      debugPrint('Received bus.eta.updated: $data');
      final event = BusEtaUpdatedEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastBusEta: event);
    });

    _socket!.on('bus.alert', (data) {
      debugPrint('Received bus.alert: $data');
      final event = BusAlertEvent.fromJson(data['payload'] as Map<String, dynamic>);
      _updateState(lastBusAlert: event);
    });
  }

  void _subscribe() {
    if (_socket == null) return;

    if (_currentTripId != null) {
      _socket!.emit('subscribe:trip', _currentTripId);
      debugPrint('Subscribed to trip: $_currentTripId');
    }

    if (_currentBusId != null) {
      _socket!.emit('subscribe:bus', _currentBusId);
      debugPrint('Subscribed to bus: $_currentBusId');
    }

    if (_currentOrgId != null) {
      _socket!.emit('subscribe:org', _currentOrgId);
      debugPrint('Subscribed to org: $_currentOrgId');
    }
  }

  void subscribeToTrip(String tripId) {
    _currentTripId = tripId;
    if (_socket != null && _socket!.connected) {
      _socket!.emit('subscribe:trip', tripId);
    }
  }

  void unsubscribeFromTrip(String tripId) {
    if (_socket != null && _socket!.connected) {
      _socket!.emit('unsubscribe:trip', tripId);
    }
    if (_currentTripId == tripId) {
      _currentTripId = null;
    }
  }

  void subscribeToBus(String busId) {
    _currentBusId = busId;
    if (_socket != null && _socket!.connected) {
      _socket!.emit('subscribe:bus', busId);
    }
  }

  void unsubscribeFromBus(String busId) {
    if (_socket != null && _socket!.connected) {
      _socket!.emit('unsubscribe:bus', busId);
    }
    if (_currentBusId == busId) {
      _currentBusId = null;
    }
  }

  // Send driver location update via WebSocket
  void sendDriverLocation({
    required String tripId,
    required double latitude,
    required double longitude,
    double? speed,
    double? heading,
    double? accuracy,
  }) {
    if (_socket != null && _socket!.connected) {
      _socket!.emit('driver:location', {
        'tripId': tripId,
        'latitude': latitude,
        'longitude': longitude,
        'speed': speed,
        'heading': heading,
        'accuracy': accuracy,
      });
      debugPrint('Sent driver:location for trip $tripId');
    } else {
      debugPrint('WebSocket not connected, cannot send driver location');
    }
  }

  void subscribeToOrg(String orgId) {
    _currentOrgId = orgId;
    if (_socket != null && _socket!.connected) {
      _socket!.emit('subscribe:org', orgId);
    }
  }

  void _updateState({
    bool? isConnected,
    String? error,
    BusLocationUpdatedEvent? lastBusLocation,
    BusStatusUpdatedEvent? lastBusStatus,
    TripStartedEvent? lastTripStarted,
    TripUpdatedEvent? lastTripUpdated,
    TripEndedEvent? lastTripEnded,
    BusEtaUpdatedEvent? lastBusEta,
    BusAlertEvent? lastBusAlert,
  }) {
    _currentState = _currentState.copyWith(
      isConnected: isConnected,
      error: error,
      lastBusLocation: lastBusLocation,
      lastBusStatus: lastBusStatus,
      lastTripStarted: lastTripStarted,
      lastTripUpdated: lastTripUpdated,
      lastTripEnded: lastTripEnded,
      lastBusEta: lastBusEta,
      lastBusAlert: lastBusAlert,
    );
    _stateController.add(_currentState);
  }

  // Disconnect
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket!.dispose();
      _socket = null;
    }
    _currentState = const RealtimeState();
    _stateController.add(_currentState);
  }

  // Dispose
  void dispose() {
    disconnect();
    _stateController.close();
  }
}

// Provider
final realtimeServiceProvider = Provider<RealtimeService>((ref) {
  return RealtimeService();
});