import 'package:barangay_request_tracker/src/app_init_provider.dart';
import 'package:barangay_request_tracker/src/app_router.dart';
import 'package:flutter/material.dart';
import 'package:barangay_request_tracker/src/features/auth/screens/login_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class BarangayRequestTracker extends StatelessWidget {
  const BarangayRequestTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInitProvider(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRouter().onGenerateRoute,
        title: 'Barangay Request Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}