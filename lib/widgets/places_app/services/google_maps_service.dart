import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleMapsService {
  final String apiKey;
  final double latitude;
  final double longitude;

  GoogleMapsService({
    required this.apiKey,
    required this.latitude,
    required this.longitude,
  });

  String get _baseUrl =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

  Future<dynamic> get() async {
    final url = _baseUrl;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
