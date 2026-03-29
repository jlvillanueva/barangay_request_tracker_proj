import 'package:barangay_request_tracker/src/features/home/screens/authenticated_home.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/cubit/cubit_service_request.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/input/mod_service_request_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceRequestForm extends StatefulWidget {
  const ServiceRequestForm({super.key});

  @override
  State<ServiceRequestForm> createState() => _ServiceRequestFormState();
}

class _ServiceRequestFormState extends State<ServiceRequestForm> {

  String requestDescription = '';
  String location = '';
  String priority = '2';

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text('Barangay Request Service'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Request Description',
                ),
                onChanged: (value) {
                  setState(() => requestDescription = value);
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                onChanged: (value) { 
                  setState(() => location = value);
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: priority,
                decoration: const InputDecoration(
                  labelText: 'Priority',
                ),
                items: const [
                  DropdownMenuItem(value: '3', child: Text('Low')),
                  DropdownMenuItem(value: '2', child: Text('Medium')),
                  DropdownMenuItem(value: '1', child: Text('High')),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => priority = value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle form submission
                  // 'requestDescription': requestDescription,
                  // 'location': location,
                  // 'priority': priority,

                  final bloc = context.read<ServiceRequestCubit>();
                  bloc.createServiceRequest(ServiceRequestFields(
                    requestDescription: requestDescription,
                    location: location,
                    priority: priority,
                  ));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthenticatedHome()),
                  (route) => false,
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
  }
}