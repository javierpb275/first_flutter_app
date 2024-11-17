import 'package:first_flutter_app/widgets/shopping_list_app/models/grocery_item.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/services/grocery_item_service.dart';
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
  final _groceryItemService = GroceryItemService();
  var _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    try {
      final res = await _groceryItemService.getMany();
      setState(() {
        _groceryItems.clear();
        _groceryItems.addAll(res);
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load items. Please try again later.';
      });
      _showSnackBar(_errorMessage!);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addItem() async {
    try {
      final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(
          builder: (ctx) => const NewItem(),
        ),
      );
      if (newItem == null) {
        return;
      }
      setState(() {
        _groceryItems.add(newItem);
        _errorMessage = null;
      });
    } catch (e) {
      _showSnackBar('Failed to add item. Please try again.');
    }
  }

  void _removeItem(GroceryItem item) async {
    final int index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.removeAt(index);
    });
    try {
      final success = await _groceryItemService.delete(item.id);
      if (!success) {
        throw Exception('Deletion failed.');
      }
    } catch (e) {
      setState(() {
        _groceryItems.insert(index, item);
      });
      _showSnackBar('Failed to delete item. Please try again.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('Your grocery list is empty'),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null && !_isLoading) {
      content = Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    }

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
