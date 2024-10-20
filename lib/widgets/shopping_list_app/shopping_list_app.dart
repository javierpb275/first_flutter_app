import 'package:first_flutter_app/widgets/shopping_list_app/widgets/grocery_list.dart';
import 'package:flutter/material.dart';

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({super.key});

  @override
  State<ShoppingListApp> createState() {
    return _ShoppingListAppState();
  }
}

class _ShoppingListAppState extends State<ShoppingListApp> {
  @override
  Widget build(BuildContext context) {
    return const GroceryList();
  }
}
