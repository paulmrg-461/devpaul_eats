import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class SignInUseCase implements UseCase<AppUser, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, AppUser>> call(SignInParams params) {
    return _repository.signIn(params.email, params.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
