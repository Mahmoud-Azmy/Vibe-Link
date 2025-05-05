import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/errs/firebase_errors.dart';
import 'package:vibe_link/features/auth/data/sources/auth_data_source.dart';

class AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepo(this._authDataSource);

  /// loginUseUser method takes email and password as parameters and returns a Future of Either type. The Either type can either be a FirebaseFailure or a String, which represents the user ID.
  Future<Either<FirebaseFailure, String>> loginUseUser({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await _authDataSource.loginUseUser(
        email: email,
        password: password,
      );
      return Right(userId);
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
      final isVerified = await _authDataSource.isEmailVerified();
      return Right(isVerified);
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
}
