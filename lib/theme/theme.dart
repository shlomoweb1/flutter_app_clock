import 'package:clock_app/theme/color.dart';
import 'package:flutter/material.dart';

@immutable
class AppTheme {
  static final colors = AppColors();

  const AppTheme._();

  static ThemeData define(){
    return ThemeData(
      useMaterial3: true,

    );
  }
}