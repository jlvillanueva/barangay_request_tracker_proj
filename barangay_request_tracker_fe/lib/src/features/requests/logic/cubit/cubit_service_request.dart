import 'package:barangay_request_tracker/src/features/requests/logic/models/input/mod_service_request_fields.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_create_service_req.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_service_req_list.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/repository/repository_service_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceRequestCubit extends Cubit<CreateServiceRequest?> {
  ServiceRequestCubit({required this.authRepository}) : super(null);
  final ServiceRequestRepository authRepository;

  Future<void> createServiceRequest(ServiceRequestFields serviceRequest) async {
    final response = await authRepository.createServiceRequest(serviceRequest);
    emit(response);
  }
}

class ServiceRequestListCubit extends Cubit<ServiceRequestList?> {
  ServiceRequestListCubit({required this.authRepository}) : super(null);
  final ServiceRequestRepository authRepository;

  Future<void> getServiceRequests() async {
    final response = await authRepository.getServiceRequests();
    emit(response);
  }
}