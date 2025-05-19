import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/home/data/repos/home_repo.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit(this._homeRepo) : super(CreatePostState.initial());
  final HomeRepo _homeRepo;

  void createPost({String? content, String? postImage}) async {
    emit(CreatePostLoading());
    final result = await _homeRepo.createPost(
      content: content,
      postImage: postImage,
    );
    result.fold(
      (failure) => emit(CreatePostFailure(failure.errorMessage)),
      (r) => emit(CreatePostSuccess()),
    );
  }
}
