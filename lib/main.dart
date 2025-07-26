import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_booking_app/core/theme/app_theme.dart';
import 'package:spa_booking_app/features/location_permission/data/location_repository_impl.dart';
import 'package:spa_booking_app/features/location_permission/domain/use_cases/request_location_permission.dart';
import 'package:spa_booking_app/features/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:spa_booking_app/features/location_permission/presentation/screens/location_permission_screen.dart';
import 'package:spa_booking_app/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(

             routes: {
          '/spaList': (_) => const HomeScreen(),
          // '/login': (_) => const LoginScreen(),
          // '/register': (_) => const RegisterScreen(),
          // '/home': (_) => const HomeScreen(),
        },
          title: 'Spa App',
          theme: AppTheme.lightTheme,
          home: BlocProvider(
            create: (context) => LocationPermissionBloc(
              requestLocationPermissionUseCase: RequestLocationPermission(
                LocationRepositoryImpl(),
              ),
            ),
            child: const LocationPermissionScreen(),
          ),
        );
      },
    );
  }
}