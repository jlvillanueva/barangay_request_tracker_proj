// To parse this JSON data, do
//
//     final authFields = authFieldsFromJson(jsonString);

import 'dart:convert';

AuthFields authFieldsFromJson(String str) => AuthFields.fromJson(json.decode(str));

String authFieldsToJson(AuthFields data) => json.encode(data.toJson());

class AuthFields {
    String username;
    String password;

    AuthFields({
        required this.username,
        required this.password,
    });

    factory AuthFields.fromJson(Map<String, dynamic> json) => AuthFields(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
