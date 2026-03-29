import 'package:barangay_request_tracker/src/constants/storge/set_storage.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/input/mod_auth_fields.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user_details.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/provider/provider_auth.dart';

class RepositoryAuth {
    final provider = AuthAPIProvider();

  Future<void> authenticate(AuthFields authFields) async {

    if (authFields.username.isEmpty || authFields.password.isEmpty) {
      throw Exception('Username and password must not be empty');
    }

    return setToken(await provider.authenticate(authFields));
  }

  Future<UserDetails?> getUserDetails() async {
    return provider.getUserDetails();
  }

  Future<void> setToken(Token? token) async {
    // Store the token securely, e.g., using flutter_secure_storage
    // For simplicity, this is just a placeholder
    await setStorage.setToken(token!.accessToken);
    await setStorage.setUserId(token.clientId.toString());
  }
}