import 'package:flutter/material.dart';

class BottomNavBarItemModel {
  final Widget screen;
  final String appBarText;
  final IconData icon;
  final String label;

  const BottomNavBarItemModel({
    required this.screen,
    required this.appBarText,
    required this.icon,
    required this.label,
  });
}