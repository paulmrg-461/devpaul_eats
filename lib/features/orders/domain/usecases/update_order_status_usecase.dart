import 'package:dartz/dartz.dart' hide Order;
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import "package:injectable/injectable.dart" hide Order;

@lazySingleton
class UpdateOrderStatusUseCase
    implements UseCase<Order, UpdateOrderStatusParams> {
  final OrderRepository _repository;

  UpdateOrderStatusUseCase(this._repository);

  @override
  Future<Either<Failure, Order>> call(UpdateOrderStatusParams params) {
    return _repository.updateOrderStatus(params.orderId, params.status);
  }
}

class UpdateOrderStatusParams extends Equatable {
  final String orderId;
  final OrderStatus status;

  const UpdateOrderStatusParams({
    required this.orderId,
    required this.status,
  });

  @override
  List<Object?> get props => [orderId, status];
}
