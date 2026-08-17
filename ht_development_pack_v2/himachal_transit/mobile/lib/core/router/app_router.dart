import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/screens/create_account_screen.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:himachal_transit_mobile/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/passenger_home_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/bus_search_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/bus_details_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/route_details_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/trip_tracking_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/search_results_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/nearby_buses_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/stop_details_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/saved_routes_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/favourite_buses_screen.dart';
import 'package:himachal_transit_mobile/features/passenger/presentation/screens/notifications_screen.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/screens/driver_home_screen.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/screens/driver_bus_details_screen.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/screens/driver_route_details_screen.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/screens/start_trip_screen.dart';
import 'package:himachal_transit_mobile/features/driver/presentation/screens/active_trip_screen.dart';
import 'package:himachal_transit_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:himachal_transit_mobile/features/profile/presentation/screens/settings_screen.dart';
import 'package:himachal_transit_mobile/features/profile/presentation/screens/privacy_security_screen.dart';
import 'package:himachal_transit_mobile/features/profile/presentation/screens/help_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(ref),
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final userRole = authState.userRole;
      final isAuthRoute = state.matchedLocation == '/login' || 
                          state.matchedLocation == '/register' ||
                          state.matchedLocation == '/forgot-password' ||
                          state.matchedLocation == '/otp';
      
      // If not logged in and trying to access protected route, redirect to login
      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }
      
      // If logged in and trying to access auth routes, redirect to appropriate home
      if (isLoggedIn && isAuthRoute) {
        switch (userRole) {
          case 'DRIVER':
            return '/driver/home';
          case 'ADMIN':
            return '/admin'; // Would open admin web app
          case 'PASSENGER':
          default:
            return '/passenger/home';
        }
      }
      
      // Role-based route protection
      if (isLoggedIn) {
        final location = state.matchedLocation;
        
        // Protect driver routes
        if (location.startsWith('/driver') && userRole != 'DRIVER') {
          return '/passenger/home';
        }
      }
      
      return null; // No redirect
    },
    routes: [
      // Root route - redirects based on auth state
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/otp',
        name: 'otp',
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      
      // Passenger routes
      GoRoute(
        path: '/passenger/home',
        name: 'passenger-home',
        builder: (context, state) => const PassengerHomeScreen(),
        routes: [
          GoRoute(
            path: 'search',
            name: 'passenger-search',
            builder: (context, state) => const BusSearchScreen(),
          ),
          GoRoute(
            path: 'bus/:busId',
            name: 'bus-details',
            builder: (context, state) => BusDetailsScreen(busId: state.pathParameters['busId']!),
          ),
          GoRoute(
            path: 'route/:routeId',
            name: 'route-details',
            builder: (context, state) => RouteDetailsScreen(routeId: state.pathParameters['routeId']!),
          ),
          GoRoute(
            path: 'trip/:tripId',
            name: 'trip-tracking',
            builder: (context, state) => TripTrackingScreen(tripId: state.pathParameters['tripId']!),
          ),
        ],
      ),
      
      // Driver routes
      GoRoute(
        path: '/driver/home',
        name: 'driver-home',
        builder: (context, state) => const DriverHomeScreen(),
        routes: [
          GoRoute(
            path: 'bus/:busId',
            name: 'driver-bus-details',
            builder: (context, state) => DriverBusDetailsScreen(busId: state.pathParameters['busId']!),
          ),
          GoRoute(
            path: 'route/:routeId',
            name: 'driver-route-details',
            builder: (context, state) => DriverRouteDetailsScreen(routeId: state.pathParameters['routeId']!),
          ),
          GoRoute(
            path: 'trip/:tripId/start',
            name: 'start-trip',
            builder: (context, state) => StartTripScreen(tripId: state.pathParameters['tripId']!),
          ),
          GoRoute(
            path: 'trip/:tripId/active',
            name: 'active-trip',
            builder: (context, state) => ActiveTripScreen(tripId: state.pathParameters['tripId']!),
          ),
        ],
      ),
      
      // Profile routes (shared)
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      
      // Search Results (uses extra for origin/destination)
      GoRoute(
        path: '/search-results',
        name: 'search-results',
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          final origin = extra?['origin'] ?? 'Unknown';
          final destination = extra?['destination'] ?? 'Unknown';
          return SearchResultsScreen(origin: origin, destination: destination);
        },
      ),
      
      // Nearby Buses
      GoRoute(
        path: '/nearby-buses',
        name: 'nearby-buses',
        builder: (context, state) => const NearbyBusesScreen(),
      ),
      
      // Stop Details
      GoRoute(
        path: '/stop/:stopId',
        name: 'stop-details',
        builder: (context, state) => StopDetailsScreen(stopId: state.pathParameters['stopId']!),
      ),
      
      // Saved Routes
      GoRoute(
        path: '/saved-routes',
        name: 'saved-routes',
        builder: (context, state) => const SavedRoutesScreen(),
      ),
      
      // Favourite Buses
      GoRoute(
        path: '/favourite-buses',
        name: 'favourite-buses',
        builder: (context, state) => const FavouriteBusesScreen(),
      ),
      
      // Notifications
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      
      // Privacy & Security
      GoRoute(
        path: '/privacy-security',
        name: 'privacy-security',
        builder: (context, state) => const PrivacySecurityScreen(),
      ),
      
      // Help & Support
      GoRoute(
        path: '/help',
        name: 'help',
        builder: (context, state) => const HelpScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(state.error.toString(), style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Helper class to listen to Riverpod state changes in GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  final Ref _ref;
  late final ProviderSubscription _subscription;
  
  GoRouterRefreshStream(this._ref) {
    // Listen to auth state changes and notify GoRouter
    _subscription = _ref.listen<AuthState>(authStateProvider, (previous, next) {
      notifyListeners();
    });
  }
  
  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  
  const PlaceholderScreen({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title - Coming Soon')),
    );
  }
}