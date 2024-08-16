import 'package:first_flutter_app/widgets/expenses/expenses.dart';
import 'package:first_flutter_app/widgets/expenses/styles/expenses_dark_theme.dart';
import 'package:first_flutter_app/widgets/expenses/styles/expenses_light_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(
    MaterialApp(
      darkTheme: ExpensesDarkTheme.theme,
      theme: ExpensesLightTheme.theme,
      themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
  // });
}
