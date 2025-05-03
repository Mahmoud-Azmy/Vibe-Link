import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/errs/firebase_errors.dart';
import 'package:vibe_link/features/auth/data/sources/auth_data_source.dart';

class AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepo(this._authDataSource);

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
      _authDataSource.creatUser(name: name, email: email, uId: userId);
      return Right(userId);
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
