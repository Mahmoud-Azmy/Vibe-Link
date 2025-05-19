import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/home/data/models/post_model.dart';
// Removed import for timeago

abstract class PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostModel> posts;
  PostsLoaded(this.posts);
}

class PostsError extends PostsState {}

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsLoading());

  final _postsRef = FirebaseFirestore.instance.collection('posts');

  void fetchPosts() async {
    emit(PostsLoading());
    try {
      final snapshot =
          await _postsRef.orderBy('timeAgo', descending: true).get();
      final posts =
          snapshot.docs
              .map((doc) => PostModel.fromMap(doc.data(), doc.id))
              .toList();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError());
    }
  }
}

  // Uncomment and implement these methods if needed
  // void createPost(String content) async {
  //   try {
  //     final user = _auth.currentUser;
  //     final username = user?.displayName ?? user?.email ?? 'Anonymous';
  //     await _postsRef.add({
  //       'userImage':'',
  //       'username': username,
  //       'timeAgo': DateTime.now().toIso8601String(),
  //       'imageUrl': 'https://via.placeholder.com/300',
  //       'likes': 0,
  //       'comments': [],
  //       'content': content,
  //     });
  //     fetchPosts();
  //   } catch (e) {
  //     emit(PostsError());
  //   }
  // }

  // void likePost(String postId) async {
  //   try {
  //     final doc = _postsRef.doc(postId);
  //     await FirebaseFirestore.instance.runTransaction((transaction) async {
  //       final snapshot = await transaction.get(doc);
  //       final currentLikes = snapshot['likes'] ?? 0;
  //       transaction.update(doc, {'likes': currentLikes + 1});
  //     });
  //     fetchPosts();
  //   } catch (e) {
  //     emit(PostsError());
  //   }
  // }

  // void addComment(String postId, String comment) async {
  //   try {
  //     final doc = _postsRef.doc(postId);
  //     await doc.update({
  //       'comments': FieldValue.arrayUnion([comment])
  //     });
  //     fetchPosts();
  //   } catch (e) {
  //     emit(PostsError());
  //   }
  // }

