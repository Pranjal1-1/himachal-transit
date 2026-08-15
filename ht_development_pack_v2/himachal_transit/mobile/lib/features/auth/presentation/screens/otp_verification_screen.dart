import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:himachal_transit_mobile/core/theme/app_theme.dart';
import '../providers/auth_provider.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key});
  
  @override
  ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpControllers = List.generate(6, (index) => TextEditingController());
  final _focusNodes = List.generate(6, (index) => FocusNode());
  String _identifier = '';
  bool _isResetPassword = false;
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  int _resendCooldown = 0;
  
  @override
  void initState() {
    super.initState();
    // Get identifier from router extra
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      if (extra != null) {
        _identifier = extra['identifier'] as String? ?? '';
        _isResetPassword = extra['isResetPassword'] as bool? ?? false;
        if (!_isResetPassword) {
          // Auto-request OTP if not reset password flow
          _requestOtp();
        }
      }
    });
    
    // Start cooldown timer
    _startCooldown();
  }
  
  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  
  void _startCooldown() {
    _resendCooldown = 60;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() => _resendCooldown--);
        return _resendCooldown > 0;
      }
      return false;
    });
  }
  
Future<void> _requestOtp() async {
    if (_identifier.isEmpty) return;
    
    final authNotifier = ref.read(authStateProvider.notifier);
    try {
      await authNotifier.requestOtp(_identifier);
      if (mounted) {
        _showSuccess('OTP sent');
        _startCooldown();
      }
    } catch (e) {
      // Error handled in auth state
    }
  }
  
  Future<void> _verifyOtp() async {
    final otp = _otpControllers.map((c) => c.text).join();
    if (otp.length != 6) {
      _showError('Please enter the complete 6-digit code');
      return;
    }
    
    final authNotifier = ref.read(authStateProvider.notifier);
    
    try {
      await authNotifier.verifyOtp(identifier: _identifier, code: otp);
      
      if (mounted) {
        if (_isResetPassword) {
          // Show new password fields
          setState(() {
            _isResetPassword = true; // Actually this means OTP verified, show password fields
          });
        } else {
          // OTP verified for login/register - navigation handled by router
          _showSuccess('Verification successful!');
        }
      }
    } catch (e) {
      // Error handled in auth state
    }
  }
  
  Future<void> _resetPassword() async {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;
    
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showError('Please fill in all fields');
      return;
    }
    
    if (newPassword != confirmPassword) {
      _showError('Passwords do not match');
      return;
    }
    
    if (newPassword.length < 8) {
      _showError('Password must be at least 8 characters');
      return;
    }
    
    final otp = _otpControllers.map((c) => c.text).join();
    
    final authNotifier = ref.read(authStateProvider.notifier);
    
    try {
      await authNotifier.resetPassword(
        identifier: _identifier,
        code: otp,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      
      if (mounted) {
        _showSuccess('Password reset successful!');
        context.go('/login');
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
    final showPasswordFields = _isResetPassword && _otpControllers.every((c) => c.text.isNotEmpty);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(_isResetPassword ? 'Reset Password' : 'Verify OTP'),
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
                const SizedBox(height: 40),
                Icon(
                  _isResetPassword ? Icons.lock_reset_outlined : Icons.verified_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  _isResetPassword && !showPasswordFields
                      ? 'Enter the 6-digit code'
                      : _isResetPassword
                          ? 'Set new password'
                          : 'Enter the 6-digit code',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isResetPassword && !showPasswordFields
                      ? 'We sent a code to $_identifier'
                      : _isResetPassword
                          ? 'Your new password must be different from previous ones'
                          : 'Enter the code sent to $_identifier',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 40),
                
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (!_isResetPassword || !showPasswordFields) ...[
                            // OTP Input Fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(6, (index) {
                                return SizedBox(
                                  width: 48,
                                  child: TextFormField(
                                    controller: _otpControllers[index],
                                    focusNode: _focusNodes[index],
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: '0',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: Theme.of(context).textTheme.titleLarge,
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 5) {
                                        _focusNodes[index + 1].requestFocus();
                                      } else if (value.isEmpty && index > 0) {
                                        _focusNodes[index - 1].requestFocus();
                                      }
                                      // Auto-verify when all 6 digits entered
                                      if (_otpControllers.every((c) => c.text.isNotEmpty)) {
                                        _verifyOtp();
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    enabled: !isLoading,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 24),
                            
                            // Resend OTP
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Didn\'t receive the code? ',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                TextButton(
                                  onPressed: _resendCooldown > 0 || isLoading ? null : _requestOtp,
                                  child: Text(
                                    _resendCooldown > 0
                                        ? 'Resend in ${_resendCooldown}s'
                                        : 'Resend Code',
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            // New Password Fields
                            TextFormField(
                              controller: _newPasswordController,
                              obscureText: _obscureNewPassword,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                hintText: 'Enter new password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscureNewPassword = !_obscureNewPassword);
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
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 16),
                            
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmPassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm New Password',
                                hintText: 'Confirm new password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _newPasswordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _resetPassword(),
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 24),
                          ],
                          
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
                            const SizedBox(height: 16),
                          ],
                          
                          FilledButton(
                            onPressed: isLoading ? null : (_isResetPassword && showPasswordFields ? _resetPassword : _verifyOtp),
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
                                : Text(_isResetPassword && showPasswordFields ? 'Reset Password' : 'Verify'),
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
                      'Back to ',
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
