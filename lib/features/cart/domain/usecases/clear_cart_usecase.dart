import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class ClearCartUseCase implements UseCase<Unit, ClearCartParams> {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(ClearCartParams params) {
    return _repository.clearCart(params.userId);
  }
}

class ClearCartParams extends Equatable {
  final String userId;

  const ClearCartParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
