import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, AppUser>> signIn(
    String email,
    String password,
  ) async {
    try {
      final model = await _dataSource.signIn(email, password);
      return Right(model.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(_mapFirebaseAuthError(e.code)));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> signUp(
    String email,
    String password,
    String name,
    UserRole role,
  ) async {
    try {
      final model = await _dataSource.signUp(email, password, name, role);
      return Right(model.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(_mapFirebaseAuthError(e.code)));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _dataSource.signOut();
      return const Right(unit);
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser?>> getCurrentUser() async {
    try {
      final model = await _dataSource.getCurrentUser();
      return Right(model?.toEntity());
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Stream<AppUser?> get authStateChanges {
    return _dataSource.authStateChanges.map((model) => model?.toEntity());
  }

  String _mapFirebaseAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Usuario no encontrado.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'email-already-in-use':
        return 'El correo ya está registrado.';
      case 'invalid-email':
        return 'Correo electrónico inválido.';
      case 'weak-password':
        return 'La contraseña es muy débil (mínimo 6 caracteres).';
      case 'network-request-failed':
        return 'Sin conexión a internet.';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde.';
      case 'user-disabled':
        return 'La cuenta ha sido deshabilitada.';
      case 'invalid-credential':
        return 'Credenciales inválidas. Verifica tu correo y contraseña.';
      default:
        return 'Error de autenticación. Intenta de nuevo.';
    }
  }
}
