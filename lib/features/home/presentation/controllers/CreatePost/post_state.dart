import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_link/features/home/data/models/post_model.dart';

part 'post_state.freezed.dart';

@freezed
class CreatePostState with _$CreatePostState {
  const factory CreatePostState.initial() = _Initial;
  const factory CreatePostState.loading() = CreatePostLoading;
  const factory CreatePostState.success() = CreatePostSuccess;
  const factory CreatePostState.failure(String error) = CreatePostFailure;

  // fetch posts
  const factory CreatePostState.postsLoading() = PostsLoading;
  const factory CreatePostState.postsLoaded(List<PostModel> posts) = PostsLoaded;
  const factory CreatePostState.postsError(String error) = PostsError;
}
