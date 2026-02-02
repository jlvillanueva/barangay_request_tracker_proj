import 'package:barangay_request_tracker/src/constants/functions.dart';
import 'package:barangay_request_tracker/src/constants/storge/get_storage.dart';
import 'package:barangay_request_tracker/src/core/api.dart';
import 'package:barangay_request_tracker/src/core/env.dart';
import 'package:barangay_request_tracker/src/core/environments.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/input/mod_service_request_fields.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_create_service_req.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_service_req_list.dart';

class ServiceRequestAPIProvider {
  Future<CreateServiceRequest?> createServiceRequest(ServiceRequestFields serviceRequest) async {
    // Implement your API call here
    final payload = {
      "data": {
        "userId": await getStorage.getUserId(),
        "requestDescription": serviceRequest.requestDescription,
        "location": serviceRequest.location,
        "priority": serviceRequest.priority,
        "timestamp": environments.timestamp,
      }
    };

    final digest = await function.sign(payload["data"] as Map<String, dynamic>);
    payload['data']!['digest'] = digest;

    final response = await api.post('/mobile/MobileServiceRequest', data: payload);

    return CreateServiceRequest.fromJson(response.data);
  }

  Future<ServiceRequestList?> getServiceRequests() async {
    // Implement your API call here
    final response = await api.get('/mobile/MobileServiceRequestLists');

    print( 'response data: ${response.data}' );

    return ServiceRequestList.fromJson(response.data);
  }
}