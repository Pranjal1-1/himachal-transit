import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:himachal_transit_mobile/core/services/realtime_service.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class TripTrackingScreen extends ConsumerStatefulWidget {
  final String tripId;
  
  const TripTrackingScreen({super.key, required this.tripId});
  
  @override
  ConsumerState<TripTrackingScreen> createState() => _TripTrackingScreenState();
}

class _TripTrackingScreenState extends ConsumerState<TripTrackingScreen> {
  final MapController _mapController = MapController();
  LatLng? _busPosition;
  bool _autoFollow = true;
  bool _showConnectionStatus = true;
  
  @override
  void initState() {
    super.initState();
    // Connect to realtime service and subscribe to trip updates
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(realtimeServiceProvider).connect(tripId: widget.tripId);
    });
  }
  
  @override
  void dispose() {
    ref.read(realtimeServiceProvider).disconnect();
    super.dispose();
  }

  void _handleBusLocationUpdate(LatLng position) {
    if (!mounted) return;
    setState(() {
      _busPosition = position;
    });
    
    if (_autoFollow && _mapController.mapEventStream != null) {
      _mapController.move(position, 15.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final realtimeState = ref.watch(realtimeServiceProvider).currentState;
    final isConnected = realtimeState.isConnected;
    final lastLocation = realtimeState.lastBusLocation;
    final lastBusStatus = realtimeState.lastBusStatus;
    final lastTripEnded = realtimeState.lastTripEnded;
    
    // Update bus position from realtime data
    if (lastLocation != null && _busPosition?.latitude != lastLocation.latitude) {
      _handleBusLocationUpdate(LatLng(lastLocation.latitude, lastLocation.longitude));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Trip ${widget.tripId}'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // Connection status indicator
          if (_showConnectionStatus)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isConnected 
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
                          color: isConnected ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isConnected ? 'Live' : 'Offline',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isConnected ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              ref.read(realtimeServiceProvider).connect(tripId: widget.tripId);
            },
            tooltip: 'Reconnect',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Overview
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
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.directions_bus,
                            size: 30,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HP-1234',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Shimla - Manali Express',
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
                            color: _getStatusColor(lastBusStatus?.status ?? 'ACTIVE', context).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _getStatusColor(lastBusStatus?.status ?? 'ACTIVE', context),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                lastBusStatus?.status ?? 'ACTIVE',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: _getStatusColor(lastBusStatus?.status ?? 'ACTIVE', context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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
                            value: 'Shimla ISBT',
                          ),
                        ),
                        Expanded(
                          child: _TripInfoItem(
                            icon: Icons.access_time_outlined,
                            label: 'Started',
                            value: '08:00 AM',
                          ),
                        ),
                        Expanded(
                          child: _TripInfoItem(
                            icon: Icons.schedule_outlined,
                            label: 'ETA',
                            value: lastLocation != null ? _calculateEta(LatLng(lastLocation.latitude, lastLocation.longitude)) : '03:15 PM',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Live Map
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Live Tracking',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            _MapControlButton(
                              icon: _autoFollow ? Icons.gps_fixed : Icons.gps_not_fixed,
                              onPressed: () {
                                setState(() {
                                  _autoFollow = !_autoFollow;
                                });
                                if (_autoFollow && _busPosition != null) {
                                  _mapController.move(_busPosition!, 15.0);
                                }
                              },
                              tooltip: _autoFollow ? 'Disable Auto-Follow' : 'Enable Auto-Follow',
                            ),
                            const SizedBox(width: 8),
                            _MapControlButton(
                              icon: Icons.my_location,
                              onPressed: () {
                                if (_busPosition != null) {
                                  _mapController.move(_busPosition!, 15.0);
                                }
                              },
                              tooltip: 'Center on Bus',
                            ),
                            const SizedBox(width: 8),
                            _MapControlButton(
                              icon: Icons.layers_outlined,
                              onPressed: () {},
                              tooltip: 'Map Layers',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: _buildMap(),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _MapInfoItem(
                                label: 'Current Speed',
                                value: lastLocation != null 
                                    ? '${(lastLocation.speed! * 3.6).toStringAsFixed(1)} km/h'
                                    : '52 km/h',
                                icon: Icons.speed_outlined,
                              ),
                              _MapInfoItem(
                                label: 'Distance Covered',
                                value: '124 km',
                                icon: Icons.straighten_outlined,
                              ),
                              _MapInfoItem(
                                label: 'Remaining',
                                value: '86 km',
                                icon: Icons.flag_circle_outlined,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Live Stats
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Live Statistics',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (lastLocation != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.success.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.gps_fixed,
                                  size: 12,
                                  color: Theme.of(context).colorScheme.success,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Updated ${_formatTime(lastLocation.recordedAt)}',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            label: 'Current Speed',
                            value: lastLocation != null && lastLocation.speed != null
                                ? '${(lastLocation.speed! * 3.6).toStringAsFixed(1)} km/h'
                                : '52 km/h',
                            icon: Icons.speed_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'Avg Speed',
                            value: '48 km/h',
                            icon: Icons.trending_up_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            label: 'Next Stop',
                            value: 'Mandi',
                            subtitle: '12 min (15 km)',
                            icon: Icons.location_on_outlined,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'Destination ETA',
                            value: lastLocation != null ? _calculateEta(LatLng(lastLocation.latitude, lastLocation.longitude)) : '03:15 PM',
                            subtitle: '2h 15m remaining',
                            icon: Icons.access_time_outlined,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Upcoming Stops
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Stops',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _UpcomingStopItem(
                      name: 'Mandi',
                      address: 'Mandi, HP',
                      scheduledTime: '11:45 AM',
                      estimatedTime: lastLocation != null ? _calculateNextStopEta(LatLng(lastLocation.latitude, lastLocation.longitude)) : '11:50 AM',
                      delay: '+5 min',
                      isNext: true,
                    ),
                    _UpcomingStopItem(
                      name: 'Kullu',
                      address: 'Kullu, HP',
                      scheduledTime: '01:30 PM',
                      estimatedTime: '01:35 PM',
                      delay: '+5 min',
                    ),
                    _UpcomingStopItem(
                      name: 'Manali',
                      address: 'Manali, HP',
                      scheduledTime: '03:00 PM',
                      estimatedTime: '03:15 PM',
                      delay: '+15 min',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Driver Info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        'R',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Driver: Rajesh Kumar',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Employee ID: EMP001 | Rating: 4.8★',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.call_outlined),
                      onPressed: () {},
                      tooltip: 'Contact Driver',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    final initialCenter = _busPosition ?? const LatLng(31.1048, 77.1734);
    
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: 13.0,
        minZoom: 8.0,
        maxZoom: 18.0,
        onPositionChanged: (position, hasGesture) {
          if (hasGesture) {
            setState(() {
              _autoFollow = false;
            });
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.himachal.transit',
        ),
        if (_busPosition != null)
          MarkerLayer(
            markers: [
              Marker(
                point: _busPosition!,
                width: 60,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_bus,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        // Route polyline (placeholder)
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                const LatLng(31.1048, 77.1734), // Shimla
                const LatLng(31.5446, 77.1856), // Intermediate
                const LatLng(32.2432, 77.1892), // Manali
              ],
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 4,
            ),
          ],
        ),
      ],
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
      case 'ENDED':
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.outline;
    }
  }

  String _calculateEta(LatLng position) {
    // Simplified ETA calculation based on distance to destination
    // In production, this would use the ETA engine
    return '03:15 PM';
  }

  String _calculateNextStopEta(LatLng position) {
    // Simplified next stop ETA
    return '11:50 AM';
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
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
        Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  
  const _MapControlButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        shape: const CircleBorder(),
        elevation: 2,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 40,
            child: Icon(
              icon,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _MapInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  
  const _MapInfoItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;
  
  const _StatCard({
    required this.label,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _UpcomingStopItem extends StatelessWidget {
  final String name;
  final String address;
  final String scheduledTime;
  final String estimatedTime;
  final String delay;
  final bool isNext;
  
  const _UpcomingStopItem({
    required this.name,
    required this.address,
    required this.scheduledTime,
    required this.estimatedTime,
    required this.delay,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isNext
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outlineVariant,
              border: Border.all(
                color: isNext
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outlineVariant,
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isNext
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    if (isNext) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'NEXT',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  address,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                estimatedTime,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isNext
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                'Scheduled: $scheduledTime',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              if (delay != 'On time')
                Text(
                  delay,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.warning,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}