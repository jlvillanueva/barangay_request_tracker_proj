import 'package:barangay_request_tracker/src/features/auth/logic/cubit/cubit_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user_details.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/repository/repository_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/screens/login_screen.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/cubit/cubit_service_request.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_create_service_req.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/models/output/mod_service_req_list.dart';
import 'package:barangay_request_tracker/src/features/requests/logic/repository/repository_service_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitProvider extends StatelessWidget {
  const AppInitProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final route = ModalRoute.of(context)?.settings.name;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RepositoryAuth()),
        RepositoryProvider(create: (context) => ServiceRequestRepository()),  
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<RepositoryAuth>(),
            ),
            child: BlocListener<AuthCubit, User?>(
              listenWhen: (previous, current) => previous != null && current == null,
              listener: (context, state) {
                if (state != null) {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  // Navigate to home screen or show success message
                } 
              },
              child: child,
            ),
          ),
          BlocProvider(
            create: (context) => UserDetailsCubit(
              authRepository: context.read<RepositoryAuth>(),
            ),
            child: BlocListener<UserDetailsCubit, UserDetails?>(
              listenWhen: (previous, current) => previous != null && current == null,
              listener: (context, state) {
                if (state != null) {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  // Navigate to home screen or show success message
                } 
              },
              child: child,
            ),
          ),
          BlocProvider(
            create: (context) => ServiceRequestCubit(
              authRepository: context.read<ServiceRequestRepository>(),
            ),
            child: BlocListener<ServiceRequestCubit, CreateServiceRequest?>(
              listenWhen: (previous, current) => previous != null && current == null,
              listener: (context, state) {
                if (state != null) {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  // Navigate to home screen or show success message
                } 
              },
              child: child,
            ),
          ),
          BlocProvider(
            create: (context) => ServiceRequestListCubit(
              authRepository: context.read<ServiceRequestRepository>(),
            ),
            child: BlocListener<ServiceRequestListCubit, ServiceRequestList?>(
              listenWhen: (previous, current) => previous != null && current == null,
              listener: (context, state) {
                if (state != null) {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  // Navigate to home screen or show success message
                } 
              },
              child: child,
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}