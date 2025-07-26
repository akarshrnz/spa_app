import 'package:flutter/material.dart';
import 'package:spa_booking_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:spa_booking_app/features/spa/presentation/screens/home_screen.dart';
import 'package:spa_booking_app/features/spa/presentation/screens/spa_detail_screen.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.spaList: (_) => const HomeScreen(),
  AppRoutes.spaDetails: (_) => const SpaDetailScreen(),
  AppRoutes.cart: (_) => const CartScreen(),
};
