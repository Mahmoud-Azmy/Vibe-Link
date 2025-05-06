import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_password_state.freezed.dart';

@freezed
class RestPasswordState with _$RestPasswordState {
  const factory RestPasswordState.initial() = _Initial;
  const factory RestPasswordState.loading() = Loading;
  const factory RestPasswordState.success() = Success;
  const factory RestPasswordState.error(String message) = Error;
}
