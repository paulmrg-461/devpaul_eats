import 'package:dartz/dartz.dart' hide Order;
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:devpaul_eats/features/orders/data/models/order_model.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import 'package:injectable/injectable.dart' hide Order;

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, Order>> placeOrder(Order order) async {
    try {
      final model = OrderModel.fromEntity(order);
      final result = await _dataSource.createOrder(model);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getClientOrders(
    String clientId,
  ) async {
    try {
      final models = await _dataSource.getClientOrders(clientId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getVendorOrders(
    String vendorId,
  ) async {
    try {
      final models = await _dataSource.getVendorOrders(vendorId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> updateOrderStatus(
    String orderId,
    OrderStatus status,
  ) async {
    try {
      final model = await _dataSource.updateOrderStatus(orderId, status);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<Order>> watchVendorOrders(String vendorId) {
    return _dataSource
        .watchVendorOrders(vendorId)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Stream<List<Order>> watchClientOrders(String clientId) {
    return _dataSource
        .watchClientOrders(clientId)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
