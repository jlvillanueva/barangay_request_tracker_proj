import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetStorage {
  final _storage = new FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: 'userId');
  }
}

final getStorage = GetStorage();