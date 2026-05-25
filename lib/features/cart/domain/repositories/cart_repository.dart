import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart(String userId);

  Future<Either<Failure, Cart>> addItem(
    String userId,
    CartItem item,
    String vendorId,
    String vendorName,
  );

  Future<Either<Failure, Cart>> removeItem(String userId, String cartItemId);

  Future<Either<Failure, Unit>> clearCart(String userId);
}
