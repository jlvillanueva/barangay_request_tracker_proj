import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SetStorage {
  final _storage = new FlutterSecureStorage();

  Future<void> setToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  Future<void> setUserId(String userId) async {
    await _storage.write(key: 'userId', value: userId);
  }
}

SetStorage setStorage = SetStorage();