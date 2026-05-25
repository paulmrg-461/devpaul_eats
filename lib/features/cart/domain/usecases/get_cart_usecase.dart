import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetCartUseCase implements UseCase<Cart, GetCartParams> {
  final CartRepository _repository;

  GetCartUseCase(this._repository);

  @override
  Future<Either<Failure, Cart>> call(GetCartParams params) {
    return _repository.getCart(params.userId);
  }
}

class GetCartParams extends Equatable {
  final String userId;

  const GetCartParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
