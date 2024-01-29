import 'package:flutter/material.dart';

@immutable
class AppColors {
  final Color primaryTextColor = Colors.white;
  final Color dividerColor = Colors.white54;
  final Color pageBackgroundColor = const Color(0xFF2D2F41);
  final Color menuBackgroundColor = const Color(0xFF242634);

  final Color clockBG = const Color(0xFF444974);
  final Color clockOutline = const Color(0xFFEAECFF);
  final Color? secHandColor = Colors.orange[300];
  final Color minHandStatColor = const Color(0xFF748EF6);
  final Color minHandEndColor = const Color(0xFF77DDFF);
  final Color hourHandStatColor = const Color(0xFFC279FB);
  final Color hourHandEndColor = const Color(0xFFEA74AB);

  AppColors();
}