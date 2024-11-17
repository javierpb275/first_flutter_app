import 'package:first_flutter_app/libs/api_service.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/helpers/map_category.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/models/grocery_item.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
  });

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  final _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    try {
      final res = await _apiService.getMany('/shopping-list.json');
      final loadedItems = (res as List).map((item) {
        final category = mapCategory(item['category']);
        return GroceryItem(
          id: item['id'] as String,
          name: item['name'] as String,
          quantity: item['quantity'] as int,
          category: category,
        );
      }).toList();
      setState(() {
        _groceryItems.clear();
        _groceryItems.addAll(loadedItems);
      });
    } catch (e) {
      print('Failed to load items: $e');
    }
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    _loadItems();
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('Your grocery list is empty'),
    );
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
