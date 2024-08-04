import 'package:first_flutter_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(230, 168, 226, 228),
      ),
      home: const Expenses(),
    ),
  );
}
