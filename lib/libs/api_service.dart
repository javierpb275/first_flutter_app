import 'dart:convert';
import 'package:first_flutter_app/config/config.dart';
import 'package:first_flutter_app/errors/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = AppConfig.apiUrl;

  Future<dynamic> post(String endpoint, {Object? body}) async {
    try {
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
          final newEndpoint =
              endpoint.replaceFirst('.json', '/$newItemKey.json');
          return getOne(newEndpoint);
        }
        throw ApiException('Invalid response: Missing "name" field');
      } else {
        throw ApiException('Failed to post: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error in POST request: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getMany(String endpoint) async {
    try {
      final uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded == null) {
          return [];
        }
        if (decoded is Map<String, dynamic>) {
          final list = decoded.entries.map((entry) {
            final doc = Map<String, dynamic>.from(entry.value);
            doc['id'] = entry.key;
            return doc;
          }).toList();
          return list;
        } else {
          throw ApiException('Unexpected response format');
        }
      } else {
        throw ApiException('Failed to getMany: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error in GET request: $e');
    }
  }

  Future<Map<String, dynamic>?> getOne(String endpoint) async {
    try {
      final uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded == null) {
          return null;
        }
        if (decoded is Map<String, dynamic>) {
          final id = endpoint.split('/').last.replaceAll('.json', '');
          final doc = Map<String, dynamic>.from(decoded);
          doc['id'] = id;
          return doc;
        } else {
          throw ApiException('Unexpected response format for getOne');
        }
      } else {
        throw ApiException('Failed to getOne: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error in GET request: $e');
    }
  }

  Future<dynamic> patch(String endpoint, {Object? body}) async {
    try {
      final uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.patch(
        uri,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return getOne(endpoint);
      } else {
        throw ApiException('Failed to patch: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error in PATCH request: $e');
    }
  }

  Future<bool> delete(String endpoint) async {
    try {
      final uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ApiException('Failed to delete: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error in DELETE request: $e');
    }
  }
}
