import 'package:flutter/material.dart';

import '../common/const.dart';

class SwitcherProvider with ChangeNotifier {
  bool _isDarkMode = false;
  late AnimationController _controller;
  bool get isDarkMode => _isDarkMode;
  AnimationController get controller => _controller;

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  SwitcherProvider(TickerProvider vsync) {
    _controller = AnimationController(
      duration: timeAnimation,
      vsync: vsync,
    );
  }

  void switchColor() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    _controller.forward().then((_) {
      _controller.reset();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
