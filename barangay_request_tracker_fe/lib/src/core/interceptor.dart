import 'package:barangay_request_tracker/src/app.dart';
import 'package:barangay_request_tracker/src/features/home/widgets/widget_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:barangay_request_tracker/src/features/auth/screens/login_screen.dart';

class MobileInterceptor extends Interceptor {
  MobileInterceptor(Dio dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Mobile-Client'] = 'BarangayRequestTrackerMobileApp';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    print("Response data: ${response.data}");

    if (response.data['statusCode'] == 401 && response.data['status'] == 'Invalid credentials') {
      final navigator = Navigator.of(response.requestOptions.extra['context'] ??
          navigatorKey.currentContext!);
      navigator.pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
      showDialog(
        context: navigator.context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Credentials'),
          content: const Text('Your credentials are invalid. Please log in again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Handle other response cases if needed
      if (response.data['statusCode'] == 201 && response.data['status'] == 'Login Successfully') {
        final navigator = Navigator.of(response.requestOptions.extra['context'] ??
            navigatorKey.currentContext!);
        navigator.pushNamedAndRemoveUntil(WidgetHome.routeName, (route) => false);      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      final navigator = Navigator.of(err.requestOptions.extra['context'] ??
          navigatorKey.currentContext!);
      navigator.pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
      showDialog(
        context: navigator.context,
        builder: (context) => AlertDialog(
          title: const Text('Session Expired'),
          content: const Text('Your session has expired. Please log in again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    super.onError(err, handler);
  }
}