import 'package:first_flutter_app/errors/api_exception.dart';
import 'package:first_flutter_app/libs/api_service.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/data/categories_shop.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/models/category.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/models/grocery_item.dart';

class GroceryItemService {
  final ApiService _apiService = ApiService();
  final String _baseEndpoint = '/shopping-list.json';

  Category _mapCategory(String category) {
    return categories.entries
        .firstWhere(
          (entry) => entry.value.title.toLowerCase() == category.toLowerCase(),
          orElse: () =>
              MapEntry(Categories.other, categories[Categories.other]!),
        )
        .value;
  }

  GroceryItem _fromMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: map['id'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      category: _mapCategory(map['category'] as String),
    );
  }

  Map<String, dynamic> _toMap(GroceryItem item) {
    return {
      'name': item.name,
      'quantity': item.quantity,
      'category': item.category.title,
    };
  }

  Future<List<GroceryItem>> getMany() async {
    try {
      final response = await _apiService.getMany(_baseEndpoint);
      return response.map((data) => _fromMap(data)).toList();
    } catch (e) {
      throw ApiException('Failed to fetch grocery items: $e');
    }
  }

  Future<GroceryItem?> getOne(String id) async {
    try {
      final response = await _apiService.getOne('/shopping-list/$id.json');
      if (response == null) {
        return null;
      }
      return _fromMap(response);
    } catch (e) {
      throw ApiException('Failed to fetch grocery item: $e');
    }
  }

  Future<GroceryItem> post({
    required String name,
    required int quantity,
    required Category category,
  }) async {
    try {
      final body = {
        'name': name,
        'quantity': quantity,
        'category': category.title,
      };
      final response = await _apiService.post(_baseEndpoint, body: body);
      return _fromMap(response);
    } catch (e) {
      throw ApiException('Failed to add grocery item: $e');
    }
  }

  Future<GroceryItem> patch(String id,
      {String? name, int? quantity, Category? category}) async {
    try {
      final body = <String, dynamic>{};
      if (name != null) body['name'] = name;
      if (quantity != null) body['quantity'] = quantity;
      if (category != null) body['category'] = category.title;
      final response =
          await _apiService.patch('/shopping-list/$id.json', body: body);
      return _fromMap(response);
    } catch (e) {
      throw ApiException('Failed to update grocery item: $e');
    }
  }

  Future<bool> delete(String id) async {
    try {
      return await _apiService.delete('/shopping-list/$id.json');
    } catch (e) {
      throw ApiException('Failed to delete grocery item: $e');
    }
  }
}
