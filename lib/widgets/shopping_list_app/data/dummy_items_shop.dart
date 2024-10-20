import 'package:first_flutter_app/widgets/shopping_list_app/models/category.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/models/grocery_item.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/data/categories_shop.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
