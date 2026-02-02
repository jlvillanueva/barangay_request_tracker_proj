import 'package:barangay_request_tracker/src/features/requests/logic/cubit/cubit_service_request.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_service_req_list.dart';
import 'package:barangay_request_tracker/src/features/requests/widgets/widgets_requests_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticatedHome extends StatefulWidget {
  const AuthenticatedHome({super.key});

  @override
  State<AuthenticatedHome> createState() => _AuthenticatedHomeState();
}

class _AuthenticatedHomeState extends State<AuthenticatedHome> {
  // Dummy data for service requests
  void _deleteRequest(int index) {
    setState(() {
      // serviceRequests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Requests'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ServiceRequestForm();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: context.read<ServiceRequestListCubit>().getServiceRequests(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Use bloc state when available, otherwise fall back to snapshot data
            return BlocBuilder<ServiceRequestListCubit, ServiceRequestList?>(
              builder: (context, state) {
                final requests = state?.requests ?? (snapshot.data?.requests ?? []);
                if (requests.isEmpty) {
                  return Center(child: Text('No service requests'));
                }
                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(request.status + ' at ' + request.location),
                        subtitle: Text(request.description ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteRequest(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ));
    }

    
  }
