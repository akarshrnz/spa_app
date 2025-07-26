import 'package:flutter/material.dart';
import 'app_router.dart';

class AppNavigator {
  static Future<T?> push<T extends Object?>(String route, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      String route,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed<T, TO>(route, arguments: arguments);
  }

  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop<T>(result);
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }
}
