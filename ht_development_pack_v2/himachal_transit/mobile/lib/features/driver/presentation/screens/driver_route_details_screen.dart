import 'package:flutter/material.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class DriverRouteDetailsScreen extends StatelessWidget {
  final String routeId;
  
  const DriverRouteDetailsScreen({super.key, required this.routeId});
  
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
                            'ASSIGNED',
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
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.schedule_outlined,
                            label: 'Departure',
                            value: '08:00 AM',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.flag_circle_outlined,
                            label: 'Arrival',
                            value: '04:30 PM',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.straighten_outlined,
                            label: 'Distance',
                            value: '210 km',
                          ),
                        ),
                        Expanded(
                          child: _RouteInfoItem(
                            icon: Icons.directions_bus_outlined,
                            label: 'Bus',
                            value: 'HP-1234',
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
            
            // All Stops with Timing
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
                          'Stop Schedule',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Export Schedule'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildStopsList(context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Important Notes
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.info,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Important Notes',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _NoteItem(
                      icon: Icons.warning_amber_outlined,
                      text: 'Barog tunnel section - reduce speed to 30 km/h',
                      color: Theme.of(context).colorScheme.warning,
                    ),
                    _NoteItem(
                      icon: Icons.terrain_outlined,
                      text: 'Steep gradients between Solan and Mandi - use lower gears',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    _NoteItem(
                      icon: Icons.local_hospital_outlined,
                      text: 'Medical emergency pull-over at Koti (km 45)',
                      color: Theme.of(context).colorScheme.error,
                    ),
                    _NoteItem(
                      icon: Icons.gas_meter_outlined,
                      text: 'Refuel at Mandi if below 30% - next station at Kullu',
                      color: Theme.of(context).colorScheme.tertiary,
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
      {'name': 'Shimla ISBT', 'address': 'Shimla, HP', 'time': '08:00', 'dwell': '5 min', 'isMajor': true, 'notes': 'Origin - Passenger boarding'},
      {'name': 'Tara Devi', 'address': 'Shimla, HP', 'time': '08:15', 'dwell': '2 min', 'isMajor': false, 'notes': ''},
      {'name': 'Solan', 'address': 'Solan, HP', 'time': '09:30', 'dwell': '10 min', 'isMajor': true, 'notes': 'Major stop - Meal break available'},
      {'name': 'Kumarhatti', 'address': 'Solan, HP', 'time': '09:45', 'dwell': '2 min', 'isMajor': false, 'notes': ''},
      {'name': 'Barog', 'address': 'Solan, HP', 'time': '10:00', 'dwell': '3 min', 'isMajor': false, 'notes': 'Tunnel entry point'},
      {'name': 'Koti', 'address': 'Solan, HP', 'time': '10:15', 'dwell': '2 min', 'isMajor': false, 'notes': 'Emergency pull-over'},
      {'name': 'Kanda', 'address': 'Solan, HP', 'time': '10:30', 'dwell': '2 min', 'isMajor': false, 'notes': ''},
      {'name': 'Mandi', 'address': 'Mandi, HP', 'time': '11:45', 'dwell': '15 min', 'isMajor': true, 'notes': 'Major stop - Refuel, meal, crew change'},
      {'name': 'Aut', 'address': 'Mandi, HP', 'time': '12:15', 'dwell': '2 min', 'isMajor': false, 'notes': ''},
      {'name': 'Kullu', 'address': 'Kullu, HP', 'time': '13:30', 'dwell': '10 min', 'isMajor': true, 'notes': 'Major stop - Tourist area'},
      {'name': 'Bhuntar', 'address': 'Kullu, HP', 'time': '13:50', 'dwell': '3 min', 'isMajor': false, 'notes': 'Airport junction'},
      {'name': 'Manikaran', 'address': 'Kullu, HP', 'time': '14:10', 'dwell': '5 min', 'isMajor': false, 'notes': 'Religious site - High passenger volume'},
      {'name': 'Kasol', 'address': 'Kullu, HP', 'time': '14:30', 'dwell': '3 min', 'isMajor': false, 'notes': ''},
      {'name': 'Manali', 'address': 'Manali, HP', 'time': '15:00', 'dwell': '0 min', 'isMajor': true, 'notes': 'Destination - End of route'},
    ];
    
    final children = <Widget>[];
    for (int i = 0; i < stops.length; i++) {
      final stop = stops[i];
      final isLast = i == stops.length - 1;
      
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: isLast ? 0 : 1,
              ),
            ),
          ),
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
                          ? Theme.of(context).colorScheme.secondary
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
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'MAJOR',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                      if ((stop['notes'] as String).isNotEmpty)
                        Text(
                          stop['notes'] as String,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.info,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    stop['time'] as String,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Dwell: ${stop['dwell']}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
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

class _NoteItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  
  const _NoteItem({
    required this.icon,
    required this.text,
    required this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}