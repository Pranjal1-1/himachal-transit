import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import '../providers/auth_provider.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});
  
  @override
  ConsumerState<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _agreedToTerms = false;
  
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }
  
  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreedToTerms) {
      _showError('Please agree to the Terms of Service and Privacy Policy');
      return;
    }
    
    final authNotifier = ref.read(authStateProvider.notifier);
    
    try {
      await authNotifier.register(
        fullName: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmController.text,
      );
      
      if (mounted) {
        _showSuccess('Account created successfully!');
        // Navigation handled by router
      }
    } catch (e) {
      // Error handled in auth state
    }
  }
  
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState.isLoading;
    final error = authState.error;
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Join Himachal Transit',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create your account to start tracking buses',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Full Name
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              hintText: 'Enter your full name',
                              prefixIcon: const Icon(Icons.person_outline),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              if (value.trim().length < 2) {
                                return 'Name must be at least 2 characters';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          
                          // Phone
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: '+91 98765 43210',
                              prefixIcon: const Icon(Icons.phone_outlined),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              // Basic phone validation
                              final phoneRegex = RegExp(r'^[\+]?[(]?[0-9]{1,3}[)]?[-\s\.]?[(]?[0-9]{1,3}[)]?[-\s\.]?[0-9]{4,6}$');
                              if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s+'), ''))) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          
                          // Email
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'you@example.com',
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          
                          // Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Create a password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() => _obscurePassword = !_obscurePassword);
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                return 'Password must contain at least one uppercase letter';
                              }
                              if (!RegExp(r'[a-z]').hasMatch(value)) {
                                return 'Password must contain at least one lowercase letter';
                              }
                              if (!RegExp(r'[0-9]').hasMatch(value)) {
                                return 'Password must contain at least one number';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          
                          // Confirm Password
                          TextFormField(
                            controller: _confirmController,
                            obscureText: _obscureConfirm,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm your password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() => _obscureConfirm = !_obscureConfirm);
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _handleRegister(),
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          
                          // Terms Agreement
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _agreedToTerms,
                                onChanged: isLoading ? null : (value) {
                                  setState(() => _agreedToTerms = value ?? false);
                                },
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => _agreedToTerms = !_agreedToTerms);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: RichText(
                                      text: TextSpan(
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        ),
                                        children: [
                                          const TextSpan(text: 'I agree to the '),
                                          TextSpan(
                                            text: 'Terms of Service',
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const TextSpan(text: ' and '),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Error Display
                          if (error != null) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 20,
                                    color: Theme.of(context).colorScheme.onErrorContainer,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      error,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Theme.of(context).colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          
                          const SizedBox(height: 24),
                          
                          // Create Account Button
                          FilledButton(
                            onPressed: isLoading ? null : _handleRegister,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text('Create Account', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Back to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextButton(
                      onPressed: isLoading ? null : () {
                        context.go('/login');
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
