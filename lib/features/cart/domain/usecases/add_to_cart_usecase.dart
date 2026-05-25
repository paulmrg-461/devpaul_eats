import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class AddToCartUseCase implements UseCase<Cart, AddToCartParams> {
  final CartRepository _repository;

  AddToCartUseCase(this._repository);

  @override
  Future<Either<Failure, Cart>> call(AddToCartParams params) {
    return _repository.addItem(
      params.userId,
      params.item,
      params.vendorId,
      params.vendorName,
    );
  }
}

class AddToCartParams extends Equatable {
  final String userId;
  final CartItem item;
  final String vendorId;
  final String vendorName;

  const AddToCartParams({
    required this.userId,
    required this.item,
    required this.vendorId,
    required this.vendorName,
  });

  @override
  List<Object?> get props => [userId, item, vendorId, vendorName];
}
