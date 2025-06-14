import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/errs/firebase_errors.dart';
import 'package:vibe_link/features/auth/data/sources/auth_data_source.dart';

class AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepo(this._authDataSource);

  /// loginUseUser method takes email and password as parameters and returns a Future of Either type. The Either type can either be a FirebaseFailure or a String, which represents the user ID.
  Future<Either<FirebaseFailure, (String, bool)>> loginUseUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authDataSource.loginUseUser(
        email: email,
        password: password,
      );
      return result.fold(
        (error) => Left(ServerFailure.fromFirebaseException(error)),
        (tuple) {
          final (userId, isVerified) = tuple;
          return Right((userId, isVerified));
        },
      );
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }

  Future<Either<FirebaseFailure, String>> signUpUseUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userId = await _authDataSource.signUpUseUser(
        email: email,
        password: password,
        name: name,
      );
      await _authDataSource.sendEmailVerification();
      return Right(userId);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }

  Future<Either<FirebaseFailure, bool>> checkEmailVerification() async {
    try {
      final currentUser = _authDataSource.getCurrentUser();
      if (currentUser == null) {
        return Left(ServerFailure('No user is currently signed in'));
      }

      // Force reload of user data to get latest verification status
      await currentUser.reload();
      return Right(currentUser.emailVerified);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }

  Future<Either<FirebaseFailure, void>> createVerifiedUser({
    required String name,
    required String email,
    required String uId,
  }) async {
    try {
      await _authDataSource.creatUser(name: name, email: email, uId: uId);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }

  Future<Either<FirebaseFailure, void>> resetUserPassword({
    required String email,
  }) async {
    try {
      await _authDataSource.resetUserPassword(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }

  Future<Either<FirebaseFailure, void>> sendEmailVerification() async {
    try {
      await _authDataSource.sendEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(ServerFailure.fromGenericFirebaseError(e));
    }
  }
}
