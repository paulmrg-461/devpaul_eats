import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/menu/data/datasources/menu_remote_datasource.dart';
import 'package:devpaul_eats/features/menu/data/models/menu_item_model.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';
import 'package:devpaul_eats/features/menu/domain/repositories/menu_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSourceImpl _dataSource;

  MenuRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<MenuItem>>> getMenuItems(String vendorId) async {
    try {
      final results = await _dataSource.getMenuItemsWithToppings(vendorId);
      final items = results.map((pair) {
        final (model, toppings) = pair;
        return model.toEntity(toppings);
      }).toList();
      return Right(items);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MenuItem>> getMenuItemById(
    String vendorId,
    String itemId,
  ) async {
    try {
      final (model, toppings) =
          await _dataSource.getMenuItemWithToppings(vendorId, itemId);
      return Right(model.toEntity(toppings));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MenuItem>> createMenuItem(MenuItem item) async {
    try {
      final model = MenuItemModel.fromEntity(item);
      final newId = await _dataSource.createMenuItem(item.vendorId, model);
      return Right(item.copyWith(id: newId));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MenuItem>> updateMenuItem(MenuItem item) async {
    try {
      final model = MenuItemModel.fromEntity(item);
      await _dataSource.updateMenuItem(model);
      return Right(item);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMenuItem(
    String vendorId,
    String itemId,
  ) async {
    try {
      await _dataSource.deleteMenuItem(vendorId, itemId);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Note: vendorId is not stored on Topping entity.
  /// The caller must ensure menuItemId is prefixed as "vendorId/itemId"
  /// or this operation is invoked via a higher-level API that provides vendorId.
  @override
  Future<Either<Failure, Topping>> addTopping(Topping topping) async {
    return const Left(ServerFailure('addTopping requires vendorId — use admin API'));
  }

  @override
  Future<Either<Failure, Unit>> deleteTopping(
    String vendorId,
    String itemId,
    String toppingId,
  ) async {
    try {
      await _dataSource.deleteTopping(vendorId, itemId, toppingId);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
