import 'package:barangay_request_tracker/src/core/environments.dart';
import 'package:barangay_request_tracker/src/core/environments.dart';
import 'package:barangay_request_tracker/src/core/interceptor.dart';
import 'package:dio/dio.dart';

Dio createHTTPSServer() {
  final dio = Dio(
    BaseOptions(
      baseUrl: environments.apiBaseUrl,
      headers: {
        'x-api-key': environments.apiKey,
        'x-brgy-code': environments.brgyCode,
      },
    ),
  );

  dio.interceptors.add(MobileInterceptor(dio));

  return dio;
}

Dio api = createHTTPSServer();