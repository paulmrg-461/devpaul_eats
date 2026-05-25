import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetCurrentUserUseCase implements UseCase<AppUser?, NoParams> {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, AppUser?>> call(NoParams params) {
    return _repository.getCurrentUser();
  }
}
