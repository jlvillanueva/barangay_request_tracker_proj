// To parse this JSON data, do
//
//     final serviceRequestList = serviceRequestListFromJson(jsonString);

import 'dart:convert';

ServiceRequestList serviceRequestListFromJson(String str) => ServiceRequestList.fromJson(json.decode(str));

String serviceRequestListToJson(ServiceRequestList data) => json.encode(data.toJson());

class ServiceRequestList {
    int rc;
    String status;
    List<Request> requests;

    ServiceRequestList({
        required this.rc,
        required this.status,
        required this.requests,
    });

    factory ServiceRequestList.fromJson(Map<String, dynamic> json) => ServiceRequestList(
        rc: json["rc"],
        status: json["status"],
        requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rc": rc,
        "status": status,
        "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
    };
}

class Request {
    int requestId;
    dynamic requestCode;
    dynamic userId;
    dynamic description;
    String location;
    String status;
    String priority;
    DateTime createdAt;

    Request({
        required this.requestId,
        required this.requestCode,
        required this.userId,
        required this.description,
        required this.location,
        required this.status,
        required this.priority,
        required this.createdAt,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        requestId: json["requestId"],
        requestCode: json["requestCode"],
        userId: json["userId"],
        description: json["description"],
        location: json["location"],
        status: json["status"],
        priority: json["priority"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "requestCode": requestCode,
        "userId": userId,
        "description": description,
        "location": location,
        "status": status,
        "priority": priority,
        "createdAt": createdAt.toIso8601String(),
    };
}
