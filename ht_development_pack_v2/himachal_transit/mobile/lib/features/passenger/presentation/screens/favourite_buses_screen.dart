import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import 'package:himachal_transit_mobile/models/bus_model.dart';
import 'package:himachal_transit_mobile/models/favourite_bus.dart';
import 'package:himachal_transit_mobile/services/api_repository.dart';
import 'package:himachal_transit_mobile/widgets/common/empty_state.dart';

class FavouriteBusesScreen extends ConsumerStatefulWidget {
  const FavouriteBusesScreen({super.key});
  
  @override
  ConsumerState<FavouriteBusesScreen> createState() => _FavouriteBusesScreenState();
}

class _FavouriteBusesScreenState extends ConsumerState<FavouriteBusesScreen> {
  late Future<List<FavouriteBus>> _favouriteBusesFuture;
  
  @override
  void initState() {
    super.initState();
    _loadFavouriteBuses();
  }
  
  void _loadFavouriteBuses() {
    final apiRepository = ref.read(apiRepositoryProvider);
    _favouriteBusesFuture = apiRepository.getFavouriteBuses();
  }
  
  Future<void> _refresh() async {
    setState(() {
      _loadFavouriteBuses();
    });
  }
  
  Future<void> _unfavouriteBus(String busId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Favourite Bus'),
        content: const Text('Are you sure you want to remove this bus from your favourites?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    try {
      final apiRepository = ref.read(apiRepositoryProvider);
      await apiRepository.unfavouriteBus(busId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bus removed from favourites')),
        );
        _refresh();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to remove: $e'), backgroundColor: Theme.of(context).colorScheme.error),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Favourite Buses'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<FavouriteBus>>(
          future: _favouriteBusesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingState();
            }
            
            if (snapshot.hasError) {
              return _buildErrorState(snapshot.error.toString());
            }
            
            final favouriteBuses = snapshot.data ?? [];
            
            if (favouriteBuses.isEmpty) {
              return _buildEmptyState();
            }
            
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favouriteBuses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final favouriteBus = favouriteBuses[index];
                return _FavouriteBusCard(
                  favouriteBus: favouriteBus,
                  onTap: () => context.push('/bus/${favouriteBus.bus?.id ?? favouriteBus.busId}'),
                  onUnfavourite: () => _unfavouriteBus(favouriteBus.busId),
                );
              },
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (_, __) => _FavouriteBusSkeleton(),
    );
  }
  
  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to Load',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _refresh,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No Favourite Buses',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mark buses as favourites from the bus details\nscreen to access them quickly here.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.go('/passenger/search'),
              icon: const Icon(Icons.search),
              label: const Text('Find Buses'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteBusCard extends StatelessWidget {
  final FavouriteBus favouriteBus;
  final VoidCallback onTap;
  final VoidCallback onUnfavourite;
  
  const _FavouriteBusCard({
    required this.favouriteBus,
    required this.onTap,
    required this.onUnfavourite,
  });
  
  @override
  Widget build(BuildContext context) {
    final bus = favouriteBus.bus;
    
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.directions_bus,
                  size: 32,
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bus != null ? 'HP-${bus.registrationNumber}' : 'Bus ${favouriteBus.busId}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (bus != null) ...[
                      Text(
                        bus.model ?? 'N/A',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _InfoChip(
                            icon: Icons.people_outline,
                            label: '${bus.capacity} seats',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          _InfoChip(
                            icon: Icons.local_gas_station_outlined,
                            label: bus.fuelType?.name ?? 'N/A',
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 8),
                          _InfoChip(
                            icon: Icons.verified_outlined,
                            label: bus.status.name,
                            color: _getStatusColor(bus.status.name, context),
                          ),
                        ],
                      ),
                    ] else ...[
                      Text(
                        'Bus details loading...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onSelected: (value) {
                  if (value == 'unfavourite') {
                    onUnfavourite();
                  } else if (value == 'bus' && bus != null) {
                    context.push('/bus/${bus.id}');
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'bus',
                    child: Row(
                      children: [
                        Icon(Icons.directions_bus),
                        SizedBox(width: 8),
                        Text('View Bus Details'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'unfavourite',
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        const SizedBox(width: 8),
                        const Text('Remove', style: TextStyle(color: Colors.red)),
                      ],
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
  
  Color _getStatusColor(String status, BuildContext context) {
    switch (status.toUpperCase()) {
      case 'IN_SERVICE':
        return Theme.of(context).colorScheme.success;
      case 'MAINTENANCE':
        return Theme.of(context).colorScheme.warning;
      case 'OUT_OF_SERVICE':
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.outline;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  
  const _InfoChip({
    required this.icon,
    required this.label,
    this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: chipColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: chipColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavouriteBusSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}