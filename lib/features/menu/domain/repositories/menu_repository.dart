import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuItem>>> getMenuItems(String vendorId);

  Future<Either<Failure, MenuItem>> getMenuItemById(
    String vendorId,
    String itemId,
  );

  Future<Either<Failure, MenuItem>> createMenuItem(MenuItem item);

  Future<Either<Failure, MenuItem>> updateMenuItem(MenuItem item);

  Future<Either<Failure, Unit>> deleteMenuItem(
    String vendorId,
    String itemId,
  );

  Future<Either<Failure, Topping>> addTopping(Topping topping);

  Future<Either<Failure, Unit>> deleteTopping(
    String vendorId,
    String itemId,
    String toppingId,
  );
}
