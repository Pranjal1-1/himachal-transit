import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends ConsumerStatefulWidget {
  const HelpScreen({super.key});
  
  @override
  ConsumerState<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends ConsumerState<HelpScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedCategory = 'General';
  
  final List<String> _categories = [
    'General',
    'Booking & Tickets',
    'Live Tracking',
    'Account & Profile',
    'Payments',
    'Technical Issues',
  ];
  
  final Map<String, List<FAQItem>> _faqs = {
    'General': [
      FAQItem(
        question: 'What is Himachal Transit?',
        answer: 'Himachal Transit is a comprehensive bus tracking and booking system for Himachal Pradesh. It provides real-time bus tracking, route planning, and ticket booking services.',
      ),
      FAQItem(
        question: 'Which regions does the app cover?',
        answer: 'The app covers all major routes in Himachal Pradesh including Shimla, Manali, Dharamshala, Kullu, Mandi, Solan, and surrounding areas.',
      ),
      FAQItem(
        question: 'Is the app free to use?',
        answer: 'Yes, the app is free to download and use. You only pay for bus tickets when you book them.',
      ),
    ],
    'Booking & Tickets': [
      FAQItem(
        question: 'How do I book a ticket?',
        answer: 'Go to Search Bus, enter your origin and destination, select a date, choose a bus, and proceed to payment. You\'ll receive a digital ticket instantly.',
      ),
      FAQItem(
        question: 'Can I cancel my booking?',
        answer: 'Yes, you can cancel up to 2 hours before departure for a full refund. Cancellations within 2 hours may incur a fee.',
      ),
      FAQItem(
        question: 'What payment methods are accepted?',
        answer: 'We accept UPI, credit/debit cards, net banking, and digital wallets like Paytm, PhonePe, and Google Pay.',
      ),
    ],
    'Live Tracking': [
      FAQItem(
        question: 'How accurate is the live tracking?',
        answer: 'Bus locations are updated every 10-30 seconds via GPS. Accuracy is typically within 10-20 meters depending on network conditions.',
      ),
      FAQItem(
        question: 'Why is my bus not showing on the map?',
        answer: 'The bus may be in an area with poor GPS signal, the driver may not have started the trip yet, or there could be a temporary connectivity issue.',
      ),
      FAQItem(
        question: 'What do the different bus statuses mean?',
        answer: 'Live = actively tracking, Scheduled = not yet started, Delayed = running behind schedule, Completed = trip finished.',
      ),
    ],
    'Account & Profile': [
      FAQItem(
        question: 'How do I create an account?',
        answer: 'Tap the profile icon on the home screen, then tap "Create Account". You can sign up with email, phone number, or social login.',
      ),
      FAQItem(
        question: 'How do I reset my password?',
        answer: 'On the login screen, tap "Forgot Password", enter your email/phone, and follow the instructions sent to you.',
      ),
      FAQItem(
        question: 'Can I use the same account on multiple devices?',
        answer: 'Yes, you can log in to your account on multiple devices simultaneously.',
      ),
    ],
    'Payments': [
      FAQItem(
        question: 'Is my payment information secure?',
        answer: 'Yes, we use PCI-DSS compliant payment processors. We never store your full card details on our servers.',
      ),
      FAQItem(
        question: 'Why was my payment declined?',
        answer: 'Common reasons include insufficient funds, incorrect card details, expired card, or bank security blocks. Contact your bank if unsure.',
      ),
      FAQItem(
        question: 'How do I get a refund?',
        answer: 'Refunds are processed automatically for cancelled trips. For other issues, contact support with your booking ID.',
      ),
    ],
    'Technical Issues': [
      FAQItem(
        question: 'The app crashes or freezes. What should I do?',
        answer: 'Try force-closing and reopening the app. If it persists, clear the app cache from Settings > Apps, or reinstall the app.',
      ),
      FAQItem(
        question: 'GPS/Location not working.',
        answer: 'Ensure location permissions are granted in your device settings. Also check that GPS is enabled and you have internet connectivity.',
      ),
      FAQItem(
        question: 'Notifications not arriving.',
        answer: 'Check that notifications are enabled in both the app settings and your device settings. Also verify you\'re not in Do Not Disturb mode.',
      ),
    ],
  };
  
  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.feedback_outlined),
            onPressed: _showFeedbackDialog,
            tooltip: 'Send Feedback',
          ),
        ],
      ),
      body: Column(
        children: [
          // Category tabs
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedCategory = category);
                      }
                    },
                    selectedColor: Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          
          // FAQ List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: _faqs[_selectedCategory]!.map((faq) => _FAQTile(faq: faq)).toList(),
            ),
          ),
          
          // Contact Support
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Still need help?',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Our support team is here to help',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _launchUrl('mailto:support@himachaltransit.com'),
                        icon: const Icon(Icons.email_outlined),
                        label: const Text('Email Support'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _launchUrl('tel:+911800123456'),
                        icon: const Icon(Icons.phone_outlined),
                        label: const Text('Call Us'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Available 9 AM - 6 PM, Mon-Sat',
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
  
  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Send Feedback'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _feedbackController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Tell us what you think...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'We read every message!',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (_feedbackController.text.trim().isNotEmpty) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thank you for your feedback!')),
                );
                _feedbackController.clear();
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
  
  Future<void> _launchUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open: $url')),
        );
      }
    }
  }
}

class FAQItem {
  final String question;
  final String answer;
  
  const FAQItem({required this.question, required this.answer});
}

class _FAQTile extends StatelessWidget {
  final FAQItem faq;
  
  const _FAQTile({required this.faq});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              faq.answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}