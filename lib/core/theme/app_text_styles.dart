import 'package:flutter/material.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';



class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.secondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.buttonText,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle cardSubText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static const TextStyle offerText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.offerGreen,
  );
  static const TextStyle sectionTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: AppColors.sectionTitle,
);

static const TextStyle serviceTitle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: AppColors.primary,
);

static const TextStyle serviceDescription = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: AppColors.secondary,
);

static const TextStyle priceText = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: AppColors.priceText,
);

}


