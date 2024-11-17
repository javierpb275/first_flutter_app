import 'package:first_flutter_app/widgets/shopping_list_app/data/categories_shop.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/models/category.dart';

Category mapCategory(String category) {
  final matchingCategory = Categories.values.firstWhere(
    (cat) => cat.name.toLowerCase() == category.toLowerCase(),
    orElse: () => Categories.other,
  );
  return categories[matchingCategory] ?? categories[Categories.other]!;
}
