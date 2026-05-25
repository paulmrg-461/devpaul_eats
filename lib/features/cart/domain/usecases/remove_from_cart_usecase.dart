import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class RemoveFromCartUseCase implements UseCase<Cart, RemoveFromCartParams> {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  @override
  Future<Either<Failure, Cart>> call(RemoveFromCartParams params) {
    return _repository.removeItem(params.userId, params.cartItemId);
  }
}

class RemoveFromCartParams extends Equatable {
  final String userId;
  final String cartItemId;

  const RemoveFromCartParams({
    required this.userId,
    required this.cartItemId,
  });

  @override
  List<Object?> get props => [userId, cartItemId];
}
