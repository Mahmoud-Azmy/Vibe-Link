import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/resetPassword/rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  final AuthRepo _authRepo;
  RestPasswordCubit(this._authRepo) : super(const RestPasswordState.initial());
  Future<void> resetPassword(String email) async {
    emit(const RestPasswordState.loading());
    final result = await _authRepo.resetUserPassword(email: email);
    result.fold(
      (failure) => emit(RestPasswordState.error(failure.errorMessage)),
      (_) => emit(const RestPasswordState.success()),
    );
  }
}
