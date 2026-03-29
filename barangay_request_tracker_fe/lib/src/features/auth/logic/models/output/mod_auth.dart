// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    int statusCode;
    String status;
    int clientId;
    String accessToken;

    Token({
        required this.statusCode,
        required this.status,
        required this.clientId,
        required this.accessToken,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        statusCode: json["statusCode"],
        status: json["status"],
        clientId: json["clientId"] ?? 0,
        accessToken: json["access_token"] ?? 'No Token',
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "clientId": clientId,
        "access_token": accessToken,
    };
}
