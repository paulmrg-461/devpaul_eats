import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser>> signIn(String email, String password);

  Future<Either<Failure, AppUser>> signUp(
    String email,
    String password,
    String name,
    UserRole role,
  );

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, AppUser?>> getCurrentUser();

  Stream<AppUser?> get authStateChanges;
}
