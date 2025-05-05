import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success({
    required String message,
    required String userId,
    required String email,
    required String name,
  }) = Success;
  const factory SignupState.error(String message) = Error;
}
