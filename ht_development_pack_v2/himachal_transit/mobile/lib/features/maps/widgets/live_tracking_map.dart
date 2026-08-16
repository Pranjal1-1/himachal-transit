import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LiveTrackingMap extends StatefulWidget {
  final LatLng? busLocation;
  final List<LatLng> routePoints;
  final List<LatLng> stops;
  final LatLng? nextStop;
  final double? currentSpeed;
  final String? nextStopName;
  final String? etaToNextStop;
  final VoidCallback? onCenterBus;
  final VoidCallback? onToggleLayers;

  const LiveTrackingMap({
    super.key,
    this.busLocation,
    this.routePoints = const [],
    this.stops = const [],
    this.nextStop,
    this.currentSpeed,
    this.nextStopName,
    this.etaToNextStop,
    this.onCenterBus,
    this.onToggleLayers,
  });

  @override
  State<LiveTrackingMap> createState() => _LiveTrackingMapState();
}

class _LiveTrackingMapState extends State<LiveTrackingMap> {
  final MapController _mapController = MapController();
  LatLng? _lastBusLocation;
  bool _autoFollow = true;

  @override
  void didUpdateWidget(covariant LiveTrackingMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.busLocation != null && widget.busLocation != _lastBusLocation) {
      _lastBusLocation = widget.busLocation;
      if (_autoFollow) {
        _mapController.move(widget.busLocation!, 15.0);
      }
    }
  }

  void _toggleAutoFollow() {
    setState(() {
      _autoFollow = !_autoFollow;
      if (_autoFollow && widget.busLocation != null) {
        _mapController.move(widget.busLocation!, 15.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasLocation = widget.busLocation != null;
    final initialCenter = widget.busLocation ?? 
        (widget.routePoints.isNotEmpty ? widget.routePoints.first : const LatLng(31.1048, 77.1734));

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: 12.0,
              minZoom: 8.0,
              maxZoom: 18.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.himachal.transit',
                maxZoom: 19,
              ),
              if (widget.routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: widget.routePoints,
                      color: Theme.of(context).colorScheme.primary,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
              if (widget.stops.isNotEmpty)
                MarkerLayer(
                  markers: widget.stops.asMap().entries.map((entry) {
                    final index = entry.key;
                    final point = entry.value;
                    return Marker(
                      point: point,
                      width: 32,
                      height: 32,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              if (widget.busLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: widget.busLocation!,
                      width: 48,
                      height: 48,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.directions_bus,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'LIVE',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              if (widget.nextStop != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: widget.nextStop!,
                      width: 36,
                      height: 36,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onTertiary,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.onTertiary,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          // Map Controls Overlay
          Positioned(
            top: 12,
            right: 12,
            child: Column(
              children: [
                _MapControlButton(
                  icon: _autoFollow ? Icons.gps_fixed : Icons.gps_not_fixed,
                  onPressed: _toggleAutoFollow,
                  tooltip: _autoFollow ? 'Disable auto-follow' : 'Enable auto-follow',
                  isActive: _autoFollow,
                ),
                const SizedBox(height: 8),
                if (widget.onCenterBus != null && hasLocation)
                  _MapControlButton(
                    icon: Icons.center_focus_strong,
                    onPressed: widget.onCenterBus!,
                    tooltip: 'Center on bus',
                  ),
                if (widget.onToggleLayers != null) ...[
                  const SizedBox(height: 8),
                  _MapControlButton(
                    icon: Icons.layers_outlined,
                    onPressed: widget.onToggleLayers!,
                    tooltip: 'Map layers',
                  ),
                ],
              ],
            ),
          ),
          // Info Overlay
          if (hasLocation)
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MapInfoColumn(
                      icon: Icons.speed_outlined,
                      label: 'Speed',
                      value: '${widget.currentSpeed?.toStringAsFixed(0) ?? 0} km/h',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    _MapInfoColumn(
                      icon: Icons.location_on_outlined,
                      label: 'Next Stop',
                      value: widget.nextStopName ?? 'N/A',
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    _MapInfoColumn(
                      icon: Icons.access_time_outlined,
                      label: 'ETA',
                      value: widget.etaToNextStop ?? '--',
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ],
),
              ),
            ),
          ],
        ),
      );
  }
}

class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final bool isActive;

  const _MapControlButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.isActive = false,
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    )
                  : null,
            ),
            child: Icon(
              icon,
              size: 20,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _MapInfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _MapInfoColumn({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}