import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _dataSource;

  CartRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, Cart>> getCart(String userId) async {
    try {
      final cart = await _dataSource.getCart(userId);
      return Right(cart);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addItem(
    String userId,
    CartItem item,
    String vendorId,
    String vendorName,
  ) async {
    try {
      final current = await _dataSource.getCart(userId);

      List<CartItem> updatedItems;
      if (current.vendorId != null && current.vendorId != vendorId) {
        // Different vendor — clear and start fresh
        updatedItems = [item];
      } else {
        updatedItems = [...current.items, item];
      }

      final saved = await _dataSource.saveCart(
        userId,
        vendorId,
        vendorName,
        updatedItems,
      );
      return Right(saved);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeItem(
    String userId,
    String cartItemId,
  ) async {
    try {
      final current = await _dataSource.getCart(userId);
      final updatedItems =
          current.items.where((i) => i.id != cartItemId).toList();

      if (updatedItems.isEmpty) {
        await _dataSource.clearCart(userId);
        return const Right(Cart(items: []));
      }

      final saved = await _dataSource.saveCart(
        userId,
        current.vendorId,
        current.vendorName,
        updatedItems,
      );
      return Right(saved);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCart(String userId) async {
    try {
      await _dataSource.clearCart(userId);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
