import 'package:first_flutter_app/widgets/expenses.dart';
import 'package:first_flutter_app/widgets/expenses/styles/expenses_dark_theme.dart';
import 'package:first_flutter_app/widgets/expenses/styles/expenses_light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ExpensesDarkTheme.theme,
      theme: ExpensesLightTheme.theme,
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    ),
  );
}
