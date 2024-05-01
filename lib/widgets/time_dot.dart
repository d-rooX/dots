import 'package:flutter/material.dart';

class TimeDot extends StatefulWidget {
  final bool isFilled;

  const TimeDot({
    required this.isFilled,
    super.key,
  });

  @override
  State<TimeDot> createState() => _TimeDotState();
}

class _TimeDotState extends State<TimeDot> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 1).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return Opacity(
          opacity: _animation.value,
          child: Icon(
            widget.isFilled ? Icons.circle : Icons.circle_outlined,
            size: 15,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
