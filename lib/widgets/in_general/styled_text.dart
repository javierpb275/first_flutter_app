import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle; // Added for custom text style

  const StyledText(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          const TextStyle(
              color: Colors.white,
              fontSize: 28), // Use provided style or default style
    );
  }
}
