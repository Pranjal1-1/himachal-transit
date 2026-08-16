import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';
  
  static String? get mapboxAccessToken => dotenv.env['MAPBOX_ACCESS_TOKEN'];
  static String? get mapboxStyleUrl => dotenv.env['MAPBOX_STYLE_URL'];
  static String? get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'];
  
  static String get appName => dotenv.env['APP_NAME'] ?? 'Himachal Transit';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '0.1.0';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
  
  static bool get enableDriverGpsStreaming => 
      dotenv.env['ENABLE_DRIVER_GPS_STREAMING']?.toLowerCase() == 'true';
  static bool get enableRealtimeTracking => 
      dotenv.env['ENABLE_REALTIME_TRACKING']?.toLowerCase() == 'true';
  static bool get enableOfflineMode => 
      dotenv.env['ENABLE_OFFLINE_MODE']?.toLowerCase() == 'true';
  
  static String? get analyticsApiKey => dotenv.env['ANALYTICS_API_KEY'];
  
  static bool get isDevelopment => environment == 'development';
  static bool get isProduction => environment == 'production';
  
  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }
}