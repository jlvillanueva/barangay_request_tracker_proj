// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int username;
    String firstName;
    String middleName;
    String lastName;
    String contactNumbeer;
    int role;

    User({
        required this.username,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.contactNumbeer,
        required this.role,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        contactNumbeer: json["contactNumbeer"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "contactNumbeer": contactNumbeer,
        "role": role,
    };
}
