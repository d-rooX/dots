import 'package:flutter/material.dart';

class DotsSectionTitle extends StatelessWidget {
  final String title;

  const DotsSectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Reddit Sans',
              fontWeight: FontWeight.w200,
              fontSize: 28,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
