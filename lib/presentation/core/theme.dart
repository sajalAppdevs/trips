import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF189AB4);
  static const text = Color(0xFF05445E);
}

ThemeData get theme {
  final theme = ThemeData.light();
  return ThemeData(
    colorScheme: theme.colorScheme.copyWith(
      primary: AppColors.primary,
    ),
    textTheme: theme.textTheme.apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    ),
  );
}
