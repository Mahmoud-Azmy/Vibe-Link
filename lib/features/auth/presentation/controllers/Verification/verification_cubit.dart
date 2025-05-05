import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/Verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepo _authRepo;
  VerificationCubit(this._authRepo) : super(VerificationState.initial());

  Future<void> checkEmailVerification() async {
    emit(VerificationState.loading());
    final result = await _authRepo.checkEmailVerification();
    result.fold(
      (failure) => emit(VerificationState.error(failure.errorMessage)),
      (isVerified) => emit(VerificationState.verified(isVerified)),
    );
  }

  Future<void> createVerifiedUser({
    required String name,
    required String email,
    required String uId,
  }) async {
    emit(VerificationState.loading());
    final result = await _authRepo.createVerifiedUser(
      name: name,
      email: email,
      uId: uId,
    );
    result.fold(
      (failure) => emit(VerificationState.error(failure.errorMessage)),
      (_) => emit(VerificationState.userCreated()),
    );
  }
}
