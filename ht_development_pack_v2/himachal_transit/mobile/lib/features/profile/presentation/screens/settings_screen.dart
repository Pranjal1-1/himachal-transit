import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance
          _buildSectionCard(
            context,
            title: 'Appearance',
            children: [
              ListTile(
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Dark Mode'),
                subtitle: const Text('System default'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    // TODO: Implement theme switching
                  },
                ),
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.language_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Language'),
                subtitle: const Text('English'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Language selection
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Notifications
          _buildSectionCard(
            context,
            title: 'Notifications',
            children: [
              _buildSwitchTile(
                context,
                icon: Icons.notifications_outlined,
                title: 'Push Notifications',
                subtitle: 'Receive trip updates and alerts',
                value: true,
                onChanged: (value) {},
              ),
              const Divider(height: 1, indent: 72),
              _buildSwitchTile(
                context,
                icon: Icons.directions_bus_outlined,
                title: 'Bus Arrival Alerts',
                subtitle: 'Get notified when your bus is approaching',
                value: true,
                onChanged: (value) {},
              ),
              const Divider(height: 1, indent: 72),
              _buildSwitchTile(
                context,
                icon: Icons.warning_outlined,
                title: 'Service Disruptions',
                subtitle: 'Delays, cancellations, and route changes',
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Privacy & Security
          _buildSectionCard(
            context,
            title: 'Privacy & Security',
            children: [
              ListTile(
                leading: Icon(
                  Icons.lock_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Navigate to change password
                },
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.fingerprint_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Biometric Login'),
                subtitle: const Text('Use fingerprint or face ID'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    // TODO: Enable biometric
                  },
                ),
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Open privacy policy
                },
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.description_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Open terms
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Data & Storage
          _buildSectionCard(
            context,
            title: 'Data & Storage',
            children: [
              ListTile(
                leading: Icon(
                  Icons.download_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Export My Data'),
                subtitle: const Text('Download your trip history and preferences'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Export data
                },
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  'Delete Account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                subtitle: const Text('Permanently delete your account and data'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  _showDeleteAccountDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // About
          _buildSectionCard(
            context,
            title: 'About',
            children: [
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('App Version'),
                subtitle: const Text('0.1.0 (Build 1)'),
              ),
              const Divider(height: 1, indent: 72),
              ListTile(
                leading: Icon(
                  Icons.code_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: const Text('Open Source Licenses'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'Himachal Transit',
                    applicationVersion: '0.1.0',
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
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
  
  Widget _buildSwitchTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
  
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Account',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        content: const Text(
          'This action is irreversible. All your data, trip history, and preferences will be permanently deleted. Are you sure you want to continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement account deletion
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Account deletion not yet implemented'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
