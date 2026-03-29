// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    int rc;
    String status;
    Data data;

    UserDetails({
        required this.rc,
        required this.status,
        required this.data,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        rc: json["rc"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "rc": rc,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String username;
    String firstName;
    String lastName;
    String middleName;
    String phoneNumber;
    String role;
    DateTime createdAt;

    Data({
        required this.id,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.middleName,
        required this.phoneNumber,
        required this.role,
        required this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "phoneNumber": phoneNumber,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
    };
}
