import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/models/user_model.dart';
// Ensure you have this import

class FirebaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirebaseService({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;
  Future<bool> isEmailVerified() async {
    await _firebaseAuth.currentUser?.reload();
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }

  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  ///Sign up with email and password
  /// Returns a [UserCredential] on success .
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Either<FirebaseAuthException, (UserCredential, bool)>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // Reload to get latest email verification status
      await userCredential.user?.reload();
      bool isVerified = userCredential.user?.emailVerified ?? false;
      return Right((userCredential, isVerified));
    } on FirebaseAuthException catch (e) {
      return Left(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<Either<String, void>> updateEmail({required String email}) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left('No user is currently signed in');
      }
      await user.updateEmail(email);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> updatePassword({required String password}) async {
    final user = _firebaseAuth.currentUser;
    await user?.updatePassword(password);
  }

  Future<String?> getUserToken() async {
    final user = _firebaseAuth.currentUser;
    return await user?.getIdToken();
  }

  User? getCurrentUser() => _firebaseAuth.currentUser;

  // Firestore Methods
  Future<void> saveData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(documentId).set(data);
  }

  Future<void> addData({
    required String collection,
    // required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).add(data);
  }

  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  Future<void> deleteData({
    required String collection,
    required String documentId,
  }) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData({
    required String collection,
    required String documentId,
  }) async {
    final snapshot =
        await _firestore.collection(collection).doc(documentId).get();
    return snapshot;
  }

  // Generic method for querying collections
  Future<QuerySnapshot<Map<String, dynamic>>> queryCollection({
    required String collection,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>>)?
    queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _firestore.collection(collection);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshot = await query.get();
    return snapshot;
  }

  Future<UserModel?> getUserData() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }
}
