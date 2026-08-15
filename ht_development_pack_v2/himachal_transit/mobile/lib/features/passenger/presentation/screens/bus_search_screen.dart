import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himachal_transit_mobile/widgets/common/empty_state.dart';

class BusSearchScreen extends ConsumerStatefulWidget {
  const BusSearchScreen({super.key});
  
  @override
  ConsumerState<BusSearchScreen> createState() => _BusSearchScreenState();
}

class _BusSearchScreenState extends ConsumerState<BusSearchScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  DateTime? _selectedDate;
  bool _isSearching = false;
  
  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }
  
  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (date != null && mounted) {
      setState(() => _selectedDate = date);
    }
  }
  
  void _handleSearch() {
    if (_fromController.text.isEmpty || _toController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both origin and destination')),
      );
      return;
    }
    
    setState(() => _isSearching = true);
    
    // Simulate search
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isSearching = false);
        // TODO: Navigate to results
      }
    });
  }
  
  void _swapLocations() {
    final from = _fromController.text;
    final to = _toController.text;
    _fromController.text = to;
    _toController.text = from;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Search Bus'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Form
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your Bus',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // From
                    TextFormField(
                      controller: _fromController,
                      decoration: InputDecoration(
                        labelText: 'From',
                        hintText: 'Enter origin',
                        prefixIcon: const Icon(Icons.my_location_outlined),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.swap_vert),
                          onPressed: _swapLocations,
                          tooltip: 'Swap',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // To
                    TextFormField(
                      controller: _toController,
                      decoration: InputDecoration(
                        labelText: 'To',
                        hintText: 'Enter destination',
                        prefixIcon: const Icon(Icons.location_on_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Date
                    InkWell(
                      onTap: _selectDate,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          prefixIcon: const Icon(Icons.calendar_today_outlined),
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                        child: Text(
                          _selectedDate == null
                              ? 'Select date (optional)'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: _selectedDate == null
                                ? Theme.of(context).colorScheme.onSurfaceVariant
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Search Button
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _isSearching ? null : _handleSearch,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: _isSearching
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : const Text('Search Buses', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Popular Routes
            Text(
              'Popular Routes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _PopularRouteCard(
                    from: 'Shimla',
                    to: 'Manali',
                    duration: '8h 30m',
                    buses: '12 buses daily',
                    onTap: () {
                      _fromController.text = 'Shimla';
                      _toController.text = 'Manali';
                    },
                  ),
                  _PopularRouteCard(
                    from: 'Dharamshala',
                    to: 'Shimla',
                    duration: '6h 45m',
                    buses: '8 buses daily',
                    onTap: () {
                      _fromController.text = 'Dharamshala';
                      _toController.text = 'Shimla';
                    },
                  ),
                  _PopularRouteCard(
                    from: 'Kullu',
                    to: 'Mandi',
                    duration: '2h 15m',
                    buses: '15 buses daily',
                    onTap: () {
                      _fromController.text = 'Kullu';
                      _toController.text = 'Mandi';
                    },
                  ),
                  _PopularRouteCard(
                    from: 'Solan',
                    to: 'Chandigarh',
                    duration: '1h 30m',
                    buses: '20 buses daily',
                    onTap: () {
                      _fromController.text = 'Solan';
                      _toController.text = 'Chandigarh';
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Recent Searches (placeholder)
            Text(
              'Recent Searches',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            EmptyState(
              icon: Icons.history,
              title: 'No recent searches',
              message: 'Your recent searches will appear here',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _PopularRouteCard extends StatelessWidget {
  final String from;
  final String to;
  final String duration;
  final String buses;
  final VoidCallback onTap;
  
  const _PopularRouteCard({
    required this.from,
    required this.to,
    required this.duration,
    required this.buses,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.my_location_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      from,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      to,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    duration,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.directions_bus_outlined,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    buses,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

