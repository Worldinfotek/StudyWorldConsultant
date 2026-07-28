import 'package:flutter/cupertino.dart';

class MenuItem {
  final String label;
  final Widget screen;
  final IconData icon;
  final String lottiePath;

  const MenuItem({
    required this.label,
    required this.screen,
    required this.icon,
    required this.lottiePath
  });
}