import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepo _authRepo;
  VerificationCubit(this._authRepo) : super(VerificationState.initial());

  Future<void> checkEmailVerification() async {
    emit(VerificationState.loading());
    final result = await _authRepo.checkEmailVerification();

    result.fold(
      (failure) =>
          emit(VerificationState.verificationCheckFailed(failure.errorMessage)),
      (isVerified) {
        if (isVerified) {
          emit(VerificationState.verified());
        } else {
          emit(VerificationState.unverified());
        }
      },
    );
  }

  Future<void> resendVerificationEmail() async {
    emit(VerificationState.loading());
    try {
      await _authRepo.sendEmailVerification();
      emit(VerificationState.emailResent());
    } catch (e) {
      emit(VerificationState.error('Failed to resend verification email'));
    }
  }

  Future<void> createVerifiedUser({
    required String name,
    required String email,
    required String uId,
  }) async {
    emit(VerificationState.loading());
    try {
      // Double-check verification status
      final verificationResult = await _authRepo.checkEmailVerification();

      verificationResult.fold(
        (failure) => emit(
          VerificationState.verificationCheckFailed(failure.errorMessage),
        ),
        (isVerified) async {
          if (!isVerified) {
            emit(VerificationState.unverified());
            return;
          }

          final result = await _authRepo.createVerifiedUser(
            name: name,
            email: email,
            uId: uId,
          );

          result.fold(
            (failure) => emit(VerificationState.error(failure.errorMessage)),
            (_) => emit(VerificationState.userCreated()),
          );
        },
      );
    } catch (e) {
      emit(VerificationState.error('Failed to complete registration'));
    }
  }
}
