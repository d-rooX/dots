import 'package:dots/widgets/time_dot.dart';
import 'package:flutter/material.dart';

class DotsGrid extends StatelessWidget {
  final int dotsCount;
  final int dotsInRowCount;
  final bool Function(int index) isFilledCallback;

  const DotsGrid({
    required this.dotsCount,
    required this.dotsInRowCount,
    required this.isFilledCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: dotsInRowCount,
      ),
      itemCount: dotsCount,
      itemBuilder: (_, index) => TimeDot(isFilled: isFilledCallback(index)),
    );
  }
}
