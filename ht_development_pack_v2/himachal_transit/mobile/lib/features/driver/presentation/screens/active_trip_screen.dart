import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/providers/driver_trip_provider.dart';
import 'package:himachal_transit_mobile/models/trip_model.dart';

class ActiveTripScreen extends ConsumerStatefulWidget {
  final String tripId;
  
  const ActiveTripScreen({super.key, required this.tripId});
  
  @override
  ConsumerState<ActiveTripScreen> createState() => _ActiveTripScreenState();
}

class _ActiveTripScreenState extends ConsumerState<ActiveTripScreen> {
  bool _isEndingTrip = false;
  
  @override
  void initState() {
    super.initState();
    // Start GPS tracking for this trip
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(driverTripProvider.notifier).startTracking(widget.tripId);
    });
  }
  
  @override
  void dispose() {
    ref.read(driverTripProvider.notifier).stopTracking();
    super.dispose();
  }

  Future<void> _handleEndTrip() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Trip'),
        content: const Text('Are you sure you want to end this trip? GPS tracking will stop.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: const Text('End Trip'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    setState(() => _isEndingTrip = true);
    
    try {
      await ref.read(driverTripProvider.notifier).endTrip(widget.tripId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trip ended successfully'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/driver');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to end trip: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isEndingTrip = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripAsync = ref.watch(driverTripProvider.select((state) => state.trip));
    final gpsState = ref.watch(driverTripProvider.select((state) => state.gpsState));
    final isTracking = ref.watch(driverTripProvider.select((state) => state.isTracking));
    final offlineQueueSize = ref.watch(driverTripProvider.select((state) => state.offlineQueueSize));
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Active Trip'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Show trip info
            },
          ),
        ],
      ),
      body: tripAsync.when(
        data: (trip) => _buildTripContent(context, trip, gpsState, isTracking, offlineQueueSize),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: 16),
              Text('Failed to load trip', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(error.toString(), style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(driverTripProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripContent(
    BuildContext context,
    Trip trip,
    GpsTrackingState gpsState,
    bool isTracking,
    int offlineQueueSize,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trip Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: _getStatusColor(trip.status, context).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          _getStatusIcon(trip.status),
                          size: 30,
                          color: _getStatusColor(trip.status, context),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trip.bus?.registrationNumber ?? 'Bus',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              trip.route?.name ?? 'Route',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getStatusColor(trip.status, context).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          trip.status,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: _getStatusColor(trip.status, context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _TripInfoItem(
                          icon: Icons.flag_outlined,
                          label: 'From',
                          value: trip.route?.origin ?? 'N/A',
                        ),
                      ),
                      Expanded(
                        child: _TripInfoItem(
                          icon: Icons.flag_circle_outlined,
                          label: 'To',
                          value: trip.route?.destination ?? 'N/A',
                        ),
                      ),
                      Expanded(
                        child: _TripInfoItem(
                          icon: Icons.schedule_outlined,
                          label: 'Started',
                          value: trip.startTime != null
                              ? _formatTime(trip.startTime!)
                              : 'N/A',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // GPS Tracking Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.gps_fixed,
                        color: isTracking ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'GPS Tracking',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isTracking 
                              ? Theme.of(context).colorScheme.success.withValues(alpha: 0.12)
                              : Theme.of(context).colorScheme.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: isTracking ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isTracking ? 'Active' : 'Stopped',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: isTracking ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (gpsState.lastPosition != null) ...[
                    Row(
                      children: [
                        Expanded(
                          child: _GpsInfoItem(
                            label: 'Latitude',
                            value: gpsState.lastPosition!.latitude.toStringAsFixed(6),
                            icon: Icons.navigation,
                          ),
                        ),
                        Expanded(
                          child: _GpsInfoItem(
                            label: 'Longitude',
                            value: gpsState.lastPosition!.longitude.toStringAsFixed(6),
                            icon: Icons.navigation,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _GpsInfoItem(
                            label: 'Speed',
                            value: '${(gpsState.lastPosition!.speed * 3.6).toStringAsFixed(1)} km/h',
                            icon: Icons.speed,
                          ),
                        ),
                        Expanded(
                          child: _GpsInfoItem(
                            label: 'Accuracy',
                            value: '${gpsState.lastPosition!.accuracy?.toStringAsFixed(1) ?? 'N/A'} m',
                            icon: Icons.gps_fixed,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Last update: ${_formatDateTime(gpsState.lastUpdate!)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ] else ...[
                    const Text('Waiting for GPS signal...'),
                  ],
                  if (offlineQueueSize > 0) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.warning.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.cloud_off, color: Theme.of(context).colorScheme.warning),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '$offlineQueueSize locations queued offline',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.warning,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Route Progress (placeholder)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Route Progress',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.45, // TODO: Calculate actual progress
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Next Stop: Shimla ISBT',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '5.2 km • ~12 min',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // End Trip Button
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isEndingTrip ? null : _handleEndTrip,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                  child: _isEndingTrip
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.stop_circle, size: 24),
                            const SizedBox(width: 8),
                            Text(
                              'End Trip',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Color _getStatusColor(String status, BuildContext context) {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
      case 'IN_PROGRESS':
        return Theme.of(context).colorScheme.success;
      case 'SCHEDULED':
        return Theme.of(context).colorScheme.warning;
      case 'COMPLETED':
        return Theme.of(context).colorScheme.primary;
      case 'CANCELLED':
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.outline;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
      case 'IN_PROGRESS':
        return Icons.directions_bus;
      case 'SCHEDULED':
        return Icons.schedule;
      case 'COMPLETED':
        return Icons.check_circle;
      case 'CANCELLED':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  String _formatTime(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'N/A';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }
}

class _TripInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  
  const _TripInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        )),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        )),
      ],
    );
  }
}

class _GpsInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  
  const _GpsInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        )),
        const SizedBox(height: 2),
        Text(value, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: 'monospace',
        )),
      ],
    );
  }
}