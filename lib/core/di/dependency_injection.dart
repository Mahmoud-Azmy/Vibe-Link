import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:vibe_link/core/network/firebase_service.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/data/sources/auth_data_source.dart';

final sl = GetIt.instance;

Future<void> getItInit() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(
        firebaseAuth: sl<FirebaseAuth>(),
        firestore: sl<FirebaseFirestore>(),
      ));
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(sl<FirebaseService>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl<AuthDataSourceImpl>()));
}
