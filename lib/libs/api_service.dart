import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> getMany(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to getMany');
    }
  }

  Future<dynamic> getOne(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to getOne');
    }
  }

  Future<dynamic> post(String url) async {
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to post');
    }
  }

  Future<dynamic> patch(String url) async {
    final uri = Uri.parse(url);
    final response = await http.patch(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to patch');
    }
  }

  Future<dynamic> delete(String url) async {
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as dynamic;
    } else {
      throw Exception('Failed to delete');
    }
  }
}
