import 'package:first_flutter_app/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  final AlignmentGeometry startAlignment;
  final AlignmentGeometry endAlignment;
  final Widget child;

  const GradientContainer({
    super.key,
    required this.colors,
    this.startAlignment = Alignment.topLeft,
    this.endAlignment = Alignment.bottomRight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
