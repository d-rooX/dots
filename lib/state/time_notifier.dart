import 'dart:async';
import 'package:flutter/material.dart';

class TimeNotifier extends ChangeNotifier {
  late Timer _timer;

  DateTime get now => DateTime.now();

  TimeNotifier() {
    _timer = Timer.periodic(const Duration(seconds: 1), _tick);
  }

  void _tick(_) => notifyListeners();

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
