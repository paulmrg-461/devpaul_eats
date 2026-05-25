import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class SignUpUseCase implements UseCase<AppUser, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, AppUser>> call(SignUpParams params) {
    return _repository.signUp(
      params.email,
      params.password,
      params.name,
      params.role,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final UserRole role;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [email, password, name, role];
}
