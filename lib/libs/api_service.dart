import 'dart:convert';
import 'package:first_flutter_app/config/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = AppConfig.apiUrl;

  Future<dynamic> post(
    String endpoint, {
    Object? body,
  }) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody is Map<String, dynamic> &&
          responseBody['name'] != null) {
        final newItemKey = responseBody['name'];
        final newEndpoint = endpoint.replaceFirst('.json', '/$newItemKey.json');
        return getOne(newEndpoint);
      }
      throw Exception('Invalid response from Firebase: Missing "name" field');
    } else {
      throw Exception('Failed to post');
    }
  }

  Future<List<Map<String, dynamic>>> getMany(String endpoint) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return decoded.entries.map((entry) {
          final doc = Map<String, dynamic>.from(entry.value);
          doc['id'] = entry.key;
          return doc;
        }).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to getMany');
    }
  }

  Future<Map<String, dynamic>> getOne(String endpoint) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        final id = endpoint.split('/').last.replaceAll('.json', '');
        final doc = Map<String, dynamic>.from(decoded);
        doc['id'] = id;
        return doc;
      } else {
        throw Exception('Unexpected response format for getOne');
      }
    } else {
      throw Exception('Failed to getOne');
    }
  }

  Future<dynamic> patch(String endpoint, {Object? body}) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.patch(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      return getOne(endpoint);
    } else {
      throw Exception('Failed to patch');
    }
  }

  Future<bool> delete(String endpoint) async {
    final uri = Uri.parse('$_baseUrl$endpoint');
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete');
    }
  }
}
