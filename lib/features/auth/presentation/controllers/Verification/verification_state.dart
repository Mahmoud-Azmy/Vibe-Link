import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.freezed.dart';

@freezed
class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = _Initial;
  const factory VerificationState.loading() = Loading;
  const factory VerificationState.userCreated() = UserCreated;
  const factory VerificationState.error(String message) = Error;
  const factory VerificationState.verified(bool isVerified) = Verified;
}
