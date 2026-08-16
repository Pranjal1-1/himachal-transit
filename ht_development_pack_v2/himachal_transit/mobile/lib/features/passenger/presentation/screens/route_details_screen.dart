import 'package:flutter/material.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class RouteDetailsScreen extends StatelessWidget {
  final String routeId;
  
  const RouteDetailsScreen({super.key, required this.routeId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Route $routeId'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Route Overview
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.route,
                            size: 30,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shimla - Manali Express',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Route ID: $routeId',
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
                            color: Theme.of(context).colorScheme.success.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'ACTIVE',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.flag_outlined,
                            label: 'Origin',
                            value: 'Shimla ISBT',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.flag_circle_outlined,
                            label: 'Destination',
                            value: 'Manali',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.access_time_outlined,
                            label: 'Duration',
                            value: '8h 30m',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.location_on_outlined,
                            label: 'Stops',
                            value: '15',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Map View (placeholder)
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
                          'Route Map',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.fullscreen_outlined, size: 18),
                          label: const Text('Full Screen'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map_outlined,
                              size: 64,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Route Map (Coming Soon)',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // All Stops
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Stops',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStopsList(context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Buses on this route
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
                          'Buses on this Route',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _BusOnRouteItem(
                      busNumber: 'HP-1234',
                      nextStop: 'Mandi',
                      eta: '12 min',
                      status: 'LIVE',
                    ),
                    _BusOnRouteItem(
                      busNumber: 'HP-5678',
                      nextStop: 'Solan',
                      eta: '25 min',
                      status: 'SCHEDULED',
                    ),
                    _BusOnRouteItem(
                      busNumber: 'HP-9012',
                      nextStop: 'Kullu',
                      eta: '45 min',
                      status: 'SCHEDULED',
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
  
  Widget _buildStopsList(BuildContext context) {
    final stops = [
      {'name': 'Shimla ISBT', 'address': 'Shimla, HP', 'time': '08:00', 'isMajor': true},
      {'name': 'Tara Devi', 'address': 'Shimla, HP', 'time': '08:15', 'isMajor': false},
      {'name': 'Solan', 'address': 'Solan, HP', 'time': '09:30', 'isMajor': true},
      {'name': 'Kumarhatti', 'address': 'Solan, HP', 'time': '09:45', 'isMajor': false},
      {'name': 'Barog', 'address': 'Solan, HP', 'time': '10:00', 'isMajor': false},
      {'name': 'Koti', 'address': 'Solan, HP', 'time': '10:15', 'isMajor': false},
      {'name': 'Kanda', 'address': 'Solan, HP', 'time': '10:30', 'isMajor': false},
      {'name': 'Mandi', 'address': 'Mandi, HP', 'time': '11:45', 'isMajor': true},
      {'name': 'Aut', 'address': 'Mandi, HP', 'time': '12:15', 'isMajor': false},
      {'name': 'Kullu', 'address': 'Kullu, HP', 'time': '13:30', 'isMajor': true},
      {'name': 'Bhuntar', 'address': 'Kullu, HP', 'time': '13:50', 'isMajor': false},
      {'name': 'Manikaran', 'address': 'Kullu, HP', 'time': '14:10', 'isMajor': false},
      {'name': 'Kasol', 'address': 'Kullu, HP', 'time': '14:30', 'isMajor': false},
      {'name': 'Manali', 'address': 'Manali, HP', 'time': '15:00', 'isMajor': true},
    ];
    
    final children = <Widget>[];
    for (int i = 0; i < stops.length; i++) {
      final stop = stops[i];
      final isLast = i == stops.length - 1;
      
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: stop['isMajor'] as bool
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              stop['name'] as String,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: (stop['isMajor'] as bool) ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                          if (stop['isMajor'] as bool)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'MAJOR',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        stop['address'] as String,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                stop['time'] as String,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    return Column(children: children);
  }
}

class _RouteInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  
  const _RouteInfoItem({
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
          color: Theme.of(context).colorScheme.secondary,
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

class _BusOnRouteItem extends StatelessWidget {
  final String busNumber;
  final String nextStop;
  final String eta;
  final String status;
  
  const _BusOnRouteItem({
    required this.busNumber,
    required this.nextStop,
    required this.eta,
    required this.status,
  });
  
  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'LIVE':
        statusColor = Theme.of(context).colorScheme.success;
        break;
      case 'SCHEDULED':
        statusColor = Theme.of(context).colorScheme.primary;
        break;
      default:
        statusColor = Theme.of(context).colorScheme.outline;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.directions_bus,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  busNumber,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Next: $nextStop',
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ETA: $eta',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}