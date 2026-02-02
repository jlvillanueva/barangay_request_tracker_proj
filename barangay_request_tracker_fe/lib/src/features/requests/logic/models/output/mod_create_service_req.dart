// To parse this JSON data, do
//
//     final createServiceRequest = createServiceRequestFromJson(jsonString);

import 'dart:convert';

CreateServiceRequest createServiceRequestFromJson(String str) => CreateServiceRequest.fromJson(json.decode(str));

String createServiceRequestToJson(CreateServiceRequest data) => json.encode(data.toJson());

class CreateServiceRequest {
    int rc;
    String status;
    int requestId;
    dynamic requestCode;

    CreateServiceRequest({
        required this.rc,
        required this.status,
        required this.requestId,
        required this.requestCode,
    });

    factory CreateServiceRequest.fromJson(Map<String, dynamic> json) => CreateServiceRequest(
        rc: json["rc"],
        status: json["status"],
        requestId: json["requestId"],
        requestCode: json["requestCode"],
    );

    Map<String, dynamic> toJson() => {
        "rc": rc,
        "status": status,
        "requestId": requestId,
        "requestCode": requestCode,
    };
}
