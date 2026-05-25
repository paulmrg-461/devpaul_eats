import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/auth/data/models/app_user_model.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<AppUserModel> signIn(String email, String password);

  Future<AppUserModel> signUp(
    String email,
    String password,
    String name,
    UserRole role,
  );

  Future<void> signOut();

  Future<AppUserModel?> getCurrentUser();

  Stream<AppUserModel?> get authStateChanges;
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  @override
  Future<AppUserModel> signIn(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists || doc.data() == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No se encontró el perfil del usuario.',
      );
    }
    return AppUserModel.fromJson({...doc.data()!, 'id': uid});
  }

  @override
  Future<AppUserModel> signUp(
    String email,
    String password,
    String name,
    UserRole role,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    final model = AppUserModel.fromFirebaseUser(
      user,
      name: name,
      role: role,
    );
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(model.toJson());
    return model;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<AppUserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (!doc.exists || doc.data() == null) return null;
    return AppUserModel.fromJson({...doc.data()!, 'id': user.uid});
  }

  @override
  Stream<AppUserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (!doc.exists || doc.data() == null) return null;
      return AppUserModel.fromJson({...doc.data()!, 'id': user.uid});
    });
  }
}
