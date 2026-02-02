
import 'package:barangay_request_tracker/env/env.dart';

class Environments {
     final String apiBaseUrl = Env.apiBaseUrl;
  final String digestSalt = Env.digestSalt;
  final String apiKey = Env.apiKey;
  final String clientKey = Env.clientKey;
  final String clientSecret = Env.clientSecret;
  final String brgyCode = Env.brgyCode;

  final timestamp = DateTime.now().millisecondsSinceEpoch;
}

Environments environments = Environments();