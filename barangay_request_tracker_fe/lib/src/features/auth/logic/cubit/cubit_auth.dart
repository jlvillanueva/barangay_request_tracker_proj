import 'package:barangay_request_tracker/src/features/auth/logic/models/input/mod_auth_fields.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/output/mod_user_details.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/repository/repository_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit({required this.authRepository}) : super(null);
  final RepositoryAuth authRepository;

  Future<void> authenticate(AuthFields authFields) async {
    await authRepository.authenticate(authFields);
  }
}

class UserDetailsCubit extends Cubit<UserDetails?> {
  UserDetailsCubit({required this.authRepository}) : super(null);
  final RepositoryAuth authRepository;

  Future<void> getUserDetails() async {
    final userDetails = await authRepository.getUserDetails();
    emit(userDetails);
  }
}