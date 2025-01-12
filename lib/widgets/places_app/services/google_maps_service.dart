import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleMapsService {
  final String apiKey;

  GoogleMapsService({
    required this.apiKey,
  });

  Future<dynamic> getLocation(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
    ;
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

  String getLocationImage(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$apiKey';
  }
}
