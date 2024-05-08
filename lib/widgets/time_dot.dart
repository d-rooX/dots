import 'package:flutter/material.dart';

class TimeDot extends StatelessWidget {
  final bool isFilled;

  const TimeDot({
    required this.isFilled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      isFilled ? Icons.circle : Icons.circle_outlined,
      size: 15,
    );
  }
}
