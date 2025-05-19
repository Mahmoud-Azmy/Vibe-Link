import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/errs/firebase_errors.dart';
import 'package:vibe_link/core/models/user_model.dart';
import 'package:vibe_link/core/network/firebase_service.dart';
import 'package:vibe_link/features/home/data/models/post_model.dart';

class HomeRepo {
  final FirebaseService _firebaseService;

  HomeRepo(this._firebaseService);
  Future<Either<FirebaseFailure, void>> createPost({
    String? content,
    String? postImage,
  }) async {
    try {
      UserModel? user = await _firebaseService.getUserData();
      PostModel post = PostModel(
        username: user?.name ?? '',
        userImage: user?.image ?? '',
        id: user?.uId ?? '',
        content: content ?? '',
        timeAgo: DateTime.now().toIso8601String(),
        imageUrl: postImage ?? '',
      );
      await _firebaseService.addData(collection: 'posts', data: post.toMap());
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }
}
