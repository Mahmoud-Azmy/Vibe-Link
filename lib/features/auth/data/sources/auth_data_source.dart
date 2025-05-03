import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe_link/core/network/firebase_service.dart';
import 'package:vibe_link/features/auth/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<String> loginUseUser({
    required String email,
    required String password,
  });
  Future<String> signUpUseUser({
    required String email,
    required String password,
    required String name,
  });
  Future<void> resetUserPassword({required String email});
  void creatUser({
    required String name,
    required String email,
    required String uId,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseService _firebaseService;
  AuthDataSourceImpl(this._firebaseService);

  @override
  Future<String> loginUseUser({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _firebaseService.login(
      email: email,
      password: password,
    );
    return userCredential.user?.uid ?? '';
  }

  @override
  Future<String> signUpUseUser({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCredential = await _firebaseService.signUp(
      email: email,
      password: password,
    );
    return userCredential.user?.uid ?? '';
  }

  @override
  Future<void> resetUserPassword({required String email}) async {
    await _firebaseService.sendPasswordResetEmail(email);
  }

  @override
  void creatUser({
    required String name,
    required String email,
    required String uId,
  }) {
    UserModel userModel = UserModel(
      email: email,
      phone: 'phone',
      name: name,
      uId: uId,
      cover:
          'https://sceel.io/wp-content/uploads/2019/10/blog-flutter-header.jpeg',
      image:
          'https://img.freepik.com/free-photo/front-view-smiley-woman-with-fireworks_52683-98180.jpg?w=1060&t=st=1692707618~exp=1692708218~hmac=973faf1ef60fc8b84b6061254022ecd915ad4efe7057f4eaa4589f782c42414f',
      bio: 'write your bio ..',
    );
    _firebaseService.saveData(
      collection: 'users',
      documentId: uId,
      data: userModel.toMap(),
    );
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uId)
    //     .set(userModel.toMap())
    //     .then((value) {
    //       debugPrint(userModel.name);
    //     });
  }
}
