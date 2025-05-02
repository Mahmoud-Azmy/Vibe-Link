import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirebaseService({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

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

  /// Sign in with email and password
  /// Returns a [UserCredential] on success .
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
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
  Future< QuerySnapshot<Map<String, dynamic>>> queryCollection({
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
}
