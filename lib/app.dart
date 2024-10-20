import 'package:first_flutter_app/widgets/shopping_list_app/shopping_list_app.dart';
import 'package:first_flutter_app/widgets/shopping_list_app/styles/theme/dark_theme_shop.dart';
import 'package:flutter/material.dart';

import 'widgets/shopping_list_app/styles/theme/light_theme_shop.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      darkTheme: DarkThemeShop.theme,
      theme: LightThemeShop.theme,
      themeMode: ThemeMode.dark,
      home: const ShoppingListApp(),
    );
  }
}
