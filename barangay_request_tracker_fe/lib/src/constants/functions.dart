import 'dart:convert';
import 'package:barangay_request_tracker/src/core/env.dart';
import 'package:barangay_request_tracker/src/core/environments.dart';
import 'package:crypt/crypt.dart';
import 'package:crypto/crypto.dart';
class _Function {
  dynamic sortPayload(dynamic data) {
    if (data is Map) {
      final sortedKeys = data.keys.toList()..sort();
      final sortedMap = {for (var k in sortedKeys) k: sortPayload(data[k])};
      return sortedMap;
    } else if (data is List) {
      return data.map(sortPayload).toList();
    }
    return data;
  }

  dynamic sign(Map<String, dynamic> d) async {
    try {
  final sortedPayload = sortPayload(d);
  String newDigest = jsonEncode(sortedPayload);
  String base64 = base64Encode(utf8.encode(newDigest));
      // Use SHA-256 with salt and rounds
      final crypt = Crypt.sha256(base64, salt: environments.digestSalt, rounds: 1000);
      return crypt.toString();
    } catch (e) {
      return '';
    }
  }

  Future<String> hashMD5(String rawString) async {
    if (rawString.length > 6) {
      rawString = sha1
          .convert(utf8.encode(md5.convert(utf8.encode(rawString)).toString()))
          .toString();
    }
    return rawString;
  }
}

// ignore: library_private_types_in_public_api
_Function function = _Function();
