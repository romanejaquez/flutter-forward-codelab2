import 'package:flutter/material.dart';

class LeftNavigationItem {
  final IconData icon;
  final String label;
  final String route;
  bool isSelected;

  LeftNavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    this.isSelected = false
  });
}