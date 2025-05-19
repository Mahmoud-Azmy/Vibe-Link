import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_state.freezed.dart';

@freezed
class CreatePostState with _$CreatePostState {
  const factory CreatePostState.initial() = _Initial;
  const factory CreatePostState.loading() = CreatePostLoading;
  const factory CreatePostState.success() = CreatePostSuccess;
  const factory CreatePostState.failure(String error) = CreatePostFailure;
}
