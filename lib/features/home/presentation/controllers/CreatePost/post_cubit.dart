import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/home/data/models/post_model.dart';
import 'package:vibe_link/features/home/data/repos/home_repo.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_state.dart';

class PostCubit extends Cubit<CreatePostState> {
  PostCubit(this._homeRepo) : super(CreatePostState.initial());
  final HomeRepo _homeRepo;
  TextEditingController postController = TextEditingController();
  final _postsRef = FirebaseFirestore.instance.collection('posts');

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

  void fetchPosts() async {
    if (isClosed) return;
    emit(PostsLoading());
    try {
      final snapshot =
          await _postsRef.orderBy('timeAgo', descending: true).get();
      if (isClosed) return;
      final posts =
          snapshot.docs
              .map((doc) => PostModel.fromMap(doc.data(), doc.id))
              .toList();
      if (isClosed) return;
      emit(PostsLoaded(posts));
    } catch (e) {
      if (isClosed) return;
      emit(PostsError(e.toString()));
    }
  }
}
