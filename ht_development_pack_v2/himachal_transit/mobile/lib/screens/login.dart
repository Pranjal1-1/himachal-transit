import 'package:flutter/material.dart';
import 'create_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    // TODO: call backend
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    // For now navigate to passenger home placeholder
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const PassengerHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const FlutterLogo(size: 96),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email or Phone', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _login,
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: _loading ? const CircularProgressIndicator() : const Text('Login'),
              ),
              TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateAccountScreen())),
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerHome extends StatelessWidget {
  const PassengerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Passenger Home')), body: const Center(child: Text('Passenger Home Placeholder')));
  }
}
