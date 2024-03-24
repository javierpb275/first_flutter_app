import 'package:first_flutter_app/gradient_container.dart';
import 'package:first_flutter_app/styled_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [Colors.deepPurple, Color.fromARGB(255, 138, 108, 196)],
          child: StyledText(
            'Hello World!',
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // Add more text style properties as needed
            ),
          ),
        ),
      ),
    ),
  );
}
