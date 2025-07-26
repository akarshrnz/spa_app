import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_booking_app/core/navigation/app_navigator.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/common_widgets/gradient_button.dart';

class BookingConfirmationDialog
    extends
        StatelessWidget {
  const BookingConfirmationDialog({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(
        24.w,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          24.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            24.r,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(
                10.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryGradient.withOpacity(
                      .2,
                    ),
                    AppColors.primaryGradient.withOpacity(
                      .2,
                    ),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(
                  10.w,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondaryGradient.withOpacity(
                        .4,
                      ),
                      AppColors.primaryGradient.withOpacity(
                        .4,
                      ),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(
                    20.w,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryGradient,
                        AppColors.primaryGradient,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 55.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            Text(
              'Your Service Booking is Confirmed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Thank you for choosing Oasis Spa Haven. Your appointment for ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: ShaderMask(
                      shaderCallback:
                          (
                            bounds,
                          ) =>
                              const LinearGradient(
                                colors: [
                                  Color(
                                    0xFFD6A76C,
                                  ),
                                  Color(
                                    0xFF9F7437,
                                  ),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(
                                bounds,
                              ),
                      child: Text(
                        'Swedish Massage',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: ShaderMask(
                      shaderCallback:
                          (
                            bounds,
                          ) =>
                              const LinearGradient(
                                colors: [
                                  Color(
                                    0xFFD6A76C,
                                  ),
                                  Color(
                                    0xFF9F7437,
                                  ),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(
                                bounds,
                              ),
                      child: Text(
                        'and Hot Stone Massage',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' has been successfully booked.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.checkoutBar,
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              ),
              child: Text(
                'Your appointment on Thursday, 7 Mar 2024\nat 8:00 AM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              width: double.infinity,
              child: GradientButton(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  colors: [
                    AppColors.secondaryGradient,
                    AppColors.primaryGradient,
                  ],
                ),
                radius: 16.r,
                onTap: () {
                  AppNavigator.pop();
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
