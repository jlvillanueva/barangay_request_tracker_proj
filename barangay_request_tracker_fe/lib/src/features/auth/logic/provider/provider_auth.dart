import 'package:barangay_request_tracker/src/constants/functions.dart';
import 'package:barangay_request_tracker/src/constants/storge/get_storage.dart';
import 'package:barangay_request_tracker/src/core/api.dart';
import 'package:barangay_request_tracker/env/env.dart';
import 'package:barangay_request_tracker/src/core/environments.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/input/mod_auth_fields.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user_details.dart';

class AuthAPIProvider {
  Future<Token?> authenticate(AuthFields authFields) async {

    final payload = {
      "data": {
        "username": "nosyNeighbor001",
        "password": "965de22657cecc39f99a5a323216fc2f8cd7db95",
        "firstName": "Sheena",
        "middleName": "Marie",
        "lastName": "Dela Cruz",
        "phoneNumber": "09110001000",
        "role": 2,
        "timestamp": environments.timestamp,
      }
    };

    final digest = await function.sign(payload["data"] as Map<String, dynamic>);

    payload['data']!['digest'] = digest;

    final response = await api.post('/mobile/MobileLogin', data: payload);

    print('response data: ${response.data}');

    return Token.fromJson(response.data);
  }

  Future<UserDetails?> getUserDetails() async {
    final payload = {
      "data": {
        "userId": await getStorage.getUserId(),
        "timestamp": environments.timestamp,
      }
    };


    final digest = await function.sign(payload["data"] as Map<String, dynamic>);

    payload['data']!['digest'] = digest;

    final response = await api.post('/mobile/MobileGetUserDetails', data: payload);

    return UserDetails.fromJson(response.data);
  }
}