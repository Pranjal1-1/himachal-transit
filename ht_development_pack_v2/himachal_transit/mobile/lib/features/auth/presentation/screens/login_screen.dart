import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isDriverLogin = false;
  String? _driverOrgCode;
  
  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    
    final authNotifier = ref.read(authStateProvider.notifier);
    
    try {
      if (_isDriverLogin) {
        if (_driverOrgCode == null || _driverOrgCode!.isEmpty) {
          _showError('Please enter organization code');
          return;
        }
        await authNotifier.driverVerify(
          identifier: _identifierController.text.trim(),
          orgCode: _driverOrgCode!,
          password: _passwordController.text,
        );
      } else {
        await authNotifier.login(
          identifier: _identifierController.text.trim(),
          password: _passwordController.text,
        );
      }
      
      // Navigation is handled by router redirect
      if (mounted) {
        _showSuccess(_isDriverLogin ? 'Driver login successful' : 'Login successful');
      }
    } catch (e) {
      // Error is already set in auth state
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
  
  void _toggleDriverLogin() {
    setState(() {
      _isDriverLogin = !_isDriverLogin;
      if (!_isDriverLogin) {
        _driverOrgCode = null;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState.isLoading;
    final error = authState.error;
    
    // Clear error when user starts typing
    ref.listen<String?>(authErrorProvider, (previous, next) {
      if (next != null && previous == null) {
        // Error appeared, could auto-dismiss after delay
      }
    });
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo/Brand
                  const SizedBox(height: 40),
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.directions_bus_filled,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Himachal Transit',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isDriverLogin ? 'Driver Portal' : 'Welcome back',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Login Form
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Driver/Passenger Toggle
                            if (!_isDriverLogin) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: _toggleDriverLogin,
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Text('Driver Login'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ] else ...[
                              TextFormField(
                                initialValue: _driverOrgCode,
                                decoration: InputDecoration(
                                  labelText: 'Organization Code',
                                  hintText: 'e.g., ORG123',
                                  prefixIcon: const Icon(Icons.business_outlined),
                                ),
                                validator: (value) {
                                  if (_isDriverLogin && (value == null || value.isEmpty)) {
                                    return 'Organization code required';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _driverOrgCode = value,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: _toggleDriverLogin,
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Text('Passenger Login'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ],
                            
                            // Identifier Field
                            TextFormField(
                              controller: _identifierController,
                              decoration: InputDecoration(
                                labelText: _isDriverLogin ? 'Employee ID / Email / Phone' : 'Email or Phone',
                                hintText: _isDriverLogin ? 'Enter your credentials' : 'Enter your email or phone',
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your identifier';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 16),
                            
                            // Password Field
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
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
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _handleLogin(),
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 8),
                            
                            // Error Display
                            if (error != null) ...[
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
                              const SizedBox(height: 8),
                            ],
                            
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: isLoading ? null : () {
                                  context.go('/forgot-password');
                                },
                                child: const Text('Forgot Password?'),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Login Button
                            FilledButton(
                              onPressed: isLoading ? null : _handleLogin,
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
                                  : const Text('Login', style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed: isLoading ? null : () {
                          context.go('/register');
                        },
                        child: const Text('Create Account'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
