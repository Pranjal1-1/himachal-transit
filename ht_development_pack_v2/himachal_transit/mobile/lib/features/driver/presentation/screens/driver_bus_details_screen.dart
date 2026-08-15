import 'package:flutter/material.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class DriverBusDetailsScreen extends StatelessWidget {
  final String busId;
  
  const DriverBusDetailsScreen({super.key, required this.busId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Bus $busId'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bus Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.directions_bus,
                            size: 40,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HP-$busId',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'TATA Starbus Ultra',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.success.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'ASSIGNED TO YOU',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.people_outline,
                            label: 'Capacity',
                            value: '40 Seats',
                          ),
                        ),
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.local_gas_station_outlined,
                            label: 'Fuel Type',
                            value: 'Diesel (BS6)',
                          ),
                        ),
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.verified_outlined,
                            label: 'Status',
                            value: 'In Service',
                            valueColor: Theme.of(context).colorScheme.success,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.build_outlined,
                            label: 'Model',
                            value: 'TATA Starbus Ultra',
                          ),
                        ),
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.eco_outlined,
                            label: 'Emission',
                            value: 'BS6',
                          ),
                        ),
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.confirmation_number_outlined,
                            label: 'Registration',
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
            
            // Current Route Assignment
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.route,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Assigned Route',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
            
            // Route Stops
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
                          'Route Stops',
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
                    _buildStopsList(context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Pre-trip Checklist
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.checklist_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Pre-Trip Checklist',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _ChecklistItem(
                      title: 'Vehicle Inspection',
                      subtitle: 'Check tires, brakes, lights, mirrors',
                      isCompleted: true,
                    ),
                    _ChecklistItem(
                      title: 'Fuel Level',
                      subtitle: 'Minimum 50% for assigned route',
                      isCompleted: true,
                    ),
                    _ChecklistItem(
                      title: 'Emergency Equipment',
                      subtitle: 'Fire extinguisher, first aid kit, warning triangle',
                      isCompleted: false,
                    ),
                    _ChecklistItem(
                      title: 'Documentation',
                      subtitle: 'License, registration, insurance, permit',
                      isCompleted: false,
                    ),
                    _ChecklistItem(
                      title: 'GPS Device',
                      subtitle: 'Verify tracking device is active',
                      isCompleted: false,
                    ),
                    _ChecklistItem(
                      title: 'Communication',
                      subtitle: 'Test radio/phone connectivity',
                      isCompleted: false,
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

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
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
            color: valueColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
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

class _ChecklistItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  
  const _ChecklistItem({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted
                    ? Theme.of(context).colorScheme.success
                    : Theme.of(context).colorScheme.outline,
                width: 2,
              ),
              color: isCompleted ? Theme.of(context).colorScheme.success : Colors.transparent,
            ),
            child: isCompleted
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color: isCompleted
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}