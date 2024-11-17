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
    final response = await _apiService.getMany(_baseEndpoint);
    return response.map((data) => _fromMap(data)).toList();
  }

  Future<GroceryItem> getOne(String id) async {
    final response = await _apiService.getOne('/shopping-list/$id.json');
    return _fromMap(response);
  }

  Future<GroceryItem> post({
    required String name,
    required int quantity,
    required Category category,
  }) async {
    final body = {
      'name': name,
      'quantity': quantity,
      'category': category.title,
    };
    final response = await _apiService.post(_baseEndpoint, body: body);
    return _fromMap(response);
  }

  Future<GroceryItem> patch(String id,
      {String? name, int? quantity, Category? category}) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (quantity != null) body['quantity'] = quantity;
    if (category != null) body['category'] = category.title;
    final response =
        await _apiService.patch('/shopping-list/$id.json', body: body);
    return _fromMap(response);
  }

  Future<bool> delete(String id) async {
    return await _apiService.delete('/shopping-list/$id.json');
  }
}
