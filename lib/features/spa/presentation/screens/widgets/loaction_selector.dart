import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/common_widgets/dotted_line.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground, 
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           const Icon(
              Icons.location_on_outlined,
              color: AppColors.chipSelected,
            ),
          const SizedBox(width: 6),
          Stack(
            children: [
 Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: 1,
                  width: 70,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFD6D6D6),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),              GradientText(
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                'Madhapur',
                      gradientType: GradientType.radial,
                      radius: 2.5,
                      colors: const [
                        AppColors.secondaryGradient,
                        AppColors.primaryGradient,
                      ],
                    ),
            
            ],
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.arrow_drop_down_rounded,
            color: Color(0xFF9F7A30),
            size: 22,
          ),
        ],
      ),
    );
  }
 
}
