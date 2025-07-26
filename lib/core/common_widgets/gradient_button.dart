
import 'package:flutter/material.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Gradient? gradient;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final double? height;
  final double? width;

  const GradientButton({super.key, this.onTap, this.gradient, required this.title, this.titleStyle, this.margin, this.radius, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:margin,
        alignment: Alignment.center,
        width:width?? MediaQuery.of(context).size.width,
        height:height?? 50,
        decoration: BoxDecoration(
          
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius??16),
        ),
        child: Text(
         title,
          style:titleStyle??AppTextStyles.button,
        ),
      ),
    );
  }
}
