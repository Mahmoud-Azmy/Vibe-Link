import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(String message) = Success;
  const factory LoginState.error(String message) = Error;
  const factory LoginState.emailNotVerified({
    required String email,
    required String name,
    required String userId,
  }) = EmailNotVerified;
}
