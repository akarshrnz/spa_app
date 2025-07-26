import 'package:flutter/material.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/gradient_button.dart';

class BookingConfirmationDialog extends StatelessWidget {
  const BookingConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success icon
            Container(
                                   padding: const EdgeInsets.all(10),

                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.secondaryGradient.withOpacity(.2), AppColors.primaryGradient.withOpacity(.2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
              child: Container(
                                  padding: const EdgeInsets.all(10),

                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.secondaryGradient.withOpacity(.4), AppColors.primaryGradient.withOpacity(.4)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Icon(Icons.check_rounded, size: 55, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              'Your Service Booking is Confirmed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),

            // Description
          Text.rich(
  TextSpan(
    children: [
      const TextSpan(
        text: 'Thank you for choosing Oasis Spa Haven. Your appointment for ',
        style: TextStyle(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: AppColors.secondary,
        ),
      ),
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFD6A76C), Color(0xFF9F7437)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: const Text(
            'Swedish Massage',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white, // required to show gradient via ShaderMask
            ),
          ),
        ),
      ),
    
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFD6A76C), Color(0xFF9F7437)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: const Text(
            'and Hot Stone Massage',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const TextSpan(
        text: ' has been successfully booked.',
        style: TextStyle(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: AppColors.secondary,
        ),
      ),
    ],
  ),
  textAlign: TextAlign.center,
)
,
            const SizedBox(height: 20),

            // Appointment info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.checkoutBar,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Your appointment on Thursday, 7 Mar 2024\nat 8:00 AM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Done button
            SizedBox(
              width: double.infinity,
              child: GradientButton(
                gradient: LinearGradient(
                begin: Alignment.centerLeft,
                  colors:[
                  AppColors.secondaryGradient,
                  AppColors.primaryGradient,
                ]),
                radius: 16,
                onTap: () {
                 Navigator.pop(context);
                },
                title: "Done",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
