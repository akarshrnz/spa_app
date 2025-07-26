import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_booking_app/core/theme/app_theme.dart';
import 'package:spa_booking_app/dependency_injection.dart';
import 'package:spa_booking_app/features/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:spa_booking_app/features/location_permission/presentation/screens/location_permission_screen.dart';
import 'package:spa_booking_app/core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
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
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Spa App',
          theme: AppTheme.lightTheme,
          routes: appRoutes,
          home: BlocProvider<LocationPermissionBloc>(
            create: (_) => getIt<LocationPermissionBloc>(),
            child: const LocationPermissionScreen(),
          ),
        );
      },
    );
  }
}
