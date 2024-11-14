import 'dart:convert';
import 'package:first_flutter_app/config/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = AppConfig.apiUrl;

  Future<dynamic> post(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
      encoding: encoding,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to post');
    }
  }

  Future<List<dynamic>> getMany(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to getMany');
    }
  }

  Future<dynamic> getOne(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to getOne');
    }
  }

  Future<dynamic> patch(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.patch(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to patch');
    }
  }

  Future<dynamic> delete(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to delete');
    }
  }
}
