import 'package:dartz/dartz.dart' hide Order;
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, Order>> placeOrder(Order order);

  Future<Either<Failure, List<Order>>> getClientOrders(String clientId);

  Future<Either<Failure, List<Order>>> getVendorOrders(String vendorId);

  Future<Either<Failure, Order>> updateOrderStatus(
    String orderId,
    OrderStatus status,
  );

  Stream<List<Order>> watchVendorOrders(String vendorId);

  Stream<List<Order>> watchClientOrders(String clientId);
}
