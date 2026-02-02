import 'package:barangay_request_tracker/src/features/auth/screens/login_screen.dart';
import 'package:barangay_request_tracker/src/features/home/widgets/widget_home.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Define your routes here
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case WidgetHome.routeName:
        return MaterialPageRoute(builder: (context) => const WidgetHome());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('Unknown Route: ${settings.name}')),
          ),
        );
    }
  }
}