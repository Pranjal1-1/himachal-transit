import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final userRole = ref.watch(userRoleProvider);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        user?.fullName?.isNotEmpty == true
                            ? user!.fullName![0].toUpperCase()
                            : userRole == 'DRIVER' ? 'D' : 'U',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.fullName ?? 'User',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getRoleColor(context, userRole).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _getRoleDisplayName(userRole),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: _getRoleColor(context, userRole),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (user?.email != null) ...[
                      Text(
                        user!.email!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (user?.phone != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        user!.phone!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Account Info
            _buildSectionCard(
              context,
              title: 'Account Information',
              children: [
                _ProfileInfoTile(
                  icon: Icons.badge_outlined,
                  label: 'User ID',
                  value: user?.id ?? 'N/A',
                  copyable: true,
                ),
                _ProfileInfoTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: user?.email ?? 'Not set',
                ),
                _ProfileInfoTile(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: user?.phone ?? 'Not set',
                ),
                _ProfileInfoTile(
                  icon: Icons.calendar_today_outlined,
                  label: 'Member Since',
                  value: _formatDate(user?.createdAt),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Role-specific info
            if (userRole == 'DRIVER') ...[
              _buildSectionCard(
                context,
                title: 'Driver Information',
                children: [
                  _ProfileInfoTile(
                    icon: Icons.directions_bus_outlined,
                    label: 'Assigned Bus',
                    value: 'HP-1234 (TATA Starbus)',
                  ),
                  _ProfileInfoTile(
                    icon: Icons.route_outlined,
                    label: 'Assigned Route',
                    value: 'Shimla - Manali Express',
                  ),
                  _ProfileInfoTile(
                    icon: Icons.verified_outlined,
                    label: 'Verification Status',
                    value: 'Verified',
                    valueColor: Theme.of(context).colorScheme.success,
                  ),
                  _ProfileInfoTile(
                    icon: Icons.work_outline,
                    label: 'Employee ID',
                    value: 'EMP001',
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            
            // Actions
            _buildSectionCard(
              context,
              title: 'Actions',
              children: [
                ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/settings'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  title: Text(
                    'Help & Support',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Navigate to help
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  title: Text(
                    'About',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showAboutDialog(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onTap: () => _showLogoutConfirmation(context, ref),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
  
  Color _getRoleColor(BuildContext context, String? role) {
    switch (role) {
      case 'DRIVER':
        return Theme.of(context).colorScheme.primary;
      case 'ADMIN':
      case 'MANAGER':
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.secondary;
    }
  }
  
  String _getRoleDisplayName(String? role) {
    switch (role) {
      case 'DRIVER':
        return 'Driver';
      case 'ADMIN':
        return 'Administrator';
      case 'MANAGER':
        return 'Manager';
      default:
        return 'Passenger';
    }
  }
  
  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'Unknown';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return 'Unknown';
    }
  }
  
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Himachal Transit',
      applicationVersion: '0.1.0',
      applicationIcon: Icon(
        Icons.directions_bus_filled,
        size: 48,
        color: Theme.of(context).colorScheme.primary,
      ),
      children: [
        const Text('Real-time bus tracking system for Himachal Pradesh.'),
        const SizedBox(height: 16),
        const Text('Built with Flutter & Dart'),
      ],
    );
  }
  
  void _showLogoutConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(authStateProvider.notifier).logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool copyable;
  
  const _ProfileInfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.copyable = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      subtitle: Text(
        value,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: valueColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: copyable
          ? IconButton(
              icon: const Icon(Icons.copy_outlined, size: 20),
              onPressed: () {
                // TODO: Copy to clipboard
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
            )
          : null,
    );
  }
}


