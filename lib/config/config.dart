import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String apiUrl = _getApiUrl();

  static String _getApiUrl() {
    final prodUrl = dotenv.env['PROD_API_URL']!;
    final devUrl = dotenv.env['DEV_API_URL']!;
    if (const bool.fromEnvironment('dart.vm.product')) {
      return prodUrl;
    }
    return devUrl;
  }
}
