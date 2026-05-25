import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class SignOutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return _repository.signOut();
  }
}
