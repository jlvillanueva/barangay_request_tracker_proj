import 'package:barangay_request_tracker/src/features/auth/logic/cubit/cubit_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user_details.dart';
import 'package:barangay_request_tracker/src/features/home/screens/authenticated_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({super.key});
  static const String routeName = '/home';
  static Route route() => MaterialPageRoute(builder: (_) => const WidgetHome());

  @override
  State<WidgetHome> createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<UserDetailsCubit>().getUserDetails(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return BlocBuilder<UserDetailsCubit, UserDetails?>(
            builder: (context, state) {
            return AuthenticatedHome();
          });
        }
      },
    );
  }
}