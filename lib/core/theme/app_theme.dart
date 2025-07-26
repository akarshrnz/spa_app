import 'package:flutter/material.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';



class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.buttonBackground,
      //fontFamily: 'SF Pro', // or whatever font is used
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      iconTheme: IconThemeData(color: AppColors.iconGrey),
    );
  }
}
