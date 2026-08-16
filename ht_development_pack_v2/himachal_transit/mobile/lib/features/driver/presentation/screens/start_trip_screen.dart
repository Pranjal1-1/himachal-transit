import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class StartTripScreen extends ConsumerStatefulWidget {
  final String tripId;
  
  const StartTripScreen({super.key, required this.tripId});
  
  @override
  ConsumerState<StartTripScreen> createState() => _StartTripScreenState();
}

class _StartTripScreenState extends ConsumerState<StartTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  bool _vehicleCheckPassed = false;
  bool _fuelCheckPassed = false;
  bool _documentsCheckPassed = false;
  bool _gpsCheckPassed = false;
  bool _isStarting = false;
  
  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }
  
  bool get _allChecksPassed => 
      _vehicleCheckPassed && 
      _fuelCheckPassed && 
      _documentsCheckPassed && 
      _gpsCheckPassed;
  
  Future<void> _handleStartTrip() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_allChecksPassed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all pre-trip checks'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    setState(() => _isStarting = true);
    
    // Simulate API call to start trip
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      setState(() => _isStarting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Trip started successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      context.go('/driver/trip/${widget.tripId}/active');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Start Trip ${widget.tripId}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Info Card
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
                              color: Theme.of(context).colorScheme.warning.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'SCHEDULED',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.warning,
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
                              value: 'Shimla ISBT',
                            ),
                          ),
                          Expanded(
                            child: _TripInfoItem(
                              icon: Icons.flag_circle_outlined,
                              label: 'To',
                              value: 'Manali',
                            ),
                          ),
                          Expanded(
                            child: _TripInfoItem(
                              icon: Icons.schedule_outlined,
                              label: 'Departure',
                              value: '08:00 AM',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Pre-Trip Checklist
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
                      const SizedBox(height: 8),
                      Text(
                        'All checks must pass before starting the trip',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _ChecklistTile(
                        title: 'Vehicle Inspection',
                        subtitle: 'Tires, brakes, lights, mirrors, wipers',
                        value: _vehicleCheckPassed,
                        onChanged: (val) => setState(() => _vehicleCheckPassed = val),
                        icon: Icons.build_outlined,
                      ),
                      _ChecklistTile(
                        title: 'Fuel Level',
                        subtitle: 'Minimum 50% for assigned route (210 km)',
                        value: _fuelCheckPassed,
                        onChanged: (val) => setState(() => _fuelCheckPassed = val),
                        icon: Icons.local_gas_station_outlined,
                      ),
                      _ChecklistTile(
                        title: 'Documents',
                        subtitle: 'License, registration, insurance, permit, route sheet',
                        value: _documentsCheckPassed,
                        onChanged: (val) => setState(() => _documentsCheckPassed = val),
                        icon: Icons.description_outlined,
                      ),
                      _ChecklistTile(
                        title: 'GPS & Tracking',
                        subtitle: 'Device active, location permission granted',
                        value: _gpsCheckPassed,
                        onChanged: (val) => setState(() => _gpsCheckPassed = val),
                        icon: Icons.gps_fixed_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Notes
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trip Notes (Optional)',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _notesController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Any special instructions, issues, or notes...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Start Trip Button
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      if (!_allChecksPassed) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.warning.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning_amber_outlined,
                                color: Theme.of(context).colorScheme.warning,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Complete all checks above to start the trip',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.warning,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: _allChecksPassed && !_isStarting ? _handleStartTrip : null,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Theme.of(context).colorScheme.success,
                          ),
                          child: _isStarting
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
                                    const Icon(Icons.play_circle_fill, size: 24),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Start Trip',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
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
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
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

class _ChecklistTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData icon;
  
  const _ChecklistTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: value
                  ? Theme.of(context).colorScheme.success.withValues(alpha: 0.12)
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: value
                  ? Theme.of(context).colorScheme.success
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.success,
          ),
        ],
      ),
    );
  }
}
