import 'package:barangay_request_tracker/src/features/requests/logic/models/input/mod_service_request_fields.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_create_service_req.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_service_req_list.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/provider/provider_service_request.dart';

class ServiceRequestRepository {
  final provider = ServiceRequestAPIProvider();

  Future<CreateServiceRequest?> createServiceRequest(ServiceRequestFields serviceRequest) {
    return provider.createServiceRequest(serviceRequest);
  }

  Future<ServiceRequestList?> getServiceRequests() {
    return provider.getServiceRequests();
  }
}