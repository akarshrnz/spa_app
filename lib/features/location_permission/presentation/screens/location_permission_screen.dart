import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/features/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/gradient_button.dart';
import 'package:spa_booking_app/features/home/presentation/screens/home_screen.dart';



class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener<LocationPermissionBloc, LocationPermissionState>(
        listener: (context, state) {
          if (state is LocationPermissionGranted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (
                _,
              ) => const HomeScreen(),
        ),
      );
          } else if (state is LocationPermissionDenied) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permission is required')),
            );
          } else if (state is LocationPermissionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
           color:   Colors.white,
            gradient: LinearGradient(
             begin: Alignment.topCenter, 
             end: Alignment.center, 
              colors: [
          AppColors.  primaryGradient.withOpacity(.1),
          AppColors.  background,
          AppColors.  background,

          ])
          
          ),
          padding: EdgeInsets.symmetric(horizontal: 62.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 3,),
              SizedBox(height: 100.h,child: Image.asset(AppImage.locationIcon),),
              const Text(
                'Enable Your Location',
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              const Text(
                'Please allow to use your location to show\nnearby Saloons on the map.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              GradientButton(
                gradient: LinearGradient(
                begin: Alignment.centerLeft,
                  colors:[
                  AppColors.secondaryGradient,
                  AppColors.primaryGradient,
                ]),
                radius: 16,
                onTap: () {
                   context.read<LocationPermissionBloc>().add(
                          const RequestLocationPermissionEvent(),
                        );
                },
                title: "Enable location",
              ),
             
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}