import 'package:flutter/cupertino.dart';

class HomeCardModel {
  final String title;
  final String description;
  final IconData icon;
  final String? routeName;

  const HomeCardModel({
    required this.title,
    required this.description,
    required this.icon,
    this.routeName,
  });
}
