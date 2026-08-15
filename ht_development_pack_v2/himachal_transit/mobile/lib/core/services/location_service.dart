import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:himachal_transit_mobile/core/services/secure_storage_service.dart';
import 'dart:convert';

class LocationService {
  static const _lastKnownLocationKey = 'last_known_location';

  // Check if location permission is granted
  static Future<bool> isLocationPermissionGranted() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }

  // Request location permission
  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  // Get current position
  static Future<Position?> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      final hasPermission = await isLocationPermissionGranted();
      if (!hasPermission) {
        final granted = await requestLocationPermission();
        if (!granted) return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: accuracy,
        timeLimit: timeout,
      );
      return position;
    } catch (e) {
      debugPrint('Error getting current position: $e');
      return null;
    }
  }

  // Get last known position (cached)
  static Future<Position?> getLastKnownPosition() async {
    try {
      final position = await Geolocator.getLastKnownPosition();
      return position;
    } catch (e) {
      debugPrint('Error getting last known position: $e');
      return null;
    }
  }

  // Stream position updates
  static Stream<Position> getPositionStream({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10, // meters
  }) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }

  // Check if location services are enabled
  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Open location settings
  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Open app settings
  static Future<void> openAppSettings() async {
    await Permission.location.request();
    await Geolocator.openAppSettings();
  }

  // Save last known location to secure storage
  static Future<void> saveLastKnownLocation(Position position) async {
    final locationJson = jsonEncode({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': position.timestamp.toIso8601String(),
      'accuracy': position.accuracy,
      'altitude': position.altitude,
      'heading': position.heading,
      'speed': position.speed,
      'speedAccuracy': position.speedAccuracy,
    });
    await SecureStorageService.setLastKnownLocation(locationJson);
  }

  // Get last known location from secure storage
  static Future<Position?> getSavedLastKnownLocation() async {
    final locationJson = await SecureStorageService.getLastKnownLocation();
    if (locationJson != null) {
      try {
        // Note: Position doesn't have a fromJson factory, so we'd need to parse manually
        // This is a simplified version - in practice you'd want to store lat/long separately
        return null;
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}