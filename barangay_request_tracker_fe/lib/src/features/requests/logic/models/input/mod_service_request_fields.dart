// To parse this JSON data, do
//
//     final serviceRequestFields = serviceRequestFieldsFromJson(jsonString);

import 'dart:convert';

ServiceRequestFields serviceRequestFieldsFromJson(String str) => ServiceRequestFields.fromJson(json.decode(str));

String serviceRequestFieldsToJson(ServiceRequestFields data) => json.encode(data.toJson());

class ServiceRequestFields {
    String requestDescription;
    String location;
    String priority;

    ServiceRequestFields({
        required this.requestDescription,
        required this.location,
        required this.priority,
    });

    factory ServiceRequestFields.fromJson(Map<String, dynamic> json) => ServiceRequestFields(
        requestDescription: json["requestDescription"],
        location: json["location"],
        priority: json["priority"],
    );

    Map<String, dynamic> toJson() => {
        "requestDescription": requestDescription,
        "location": location,
        "priority": priority,
    };
}
