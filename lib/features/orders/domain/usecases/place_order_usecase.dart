import 'package:dartz/dartz.dart' hide Order;
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import "package:injectable/injectable.dart" hide Order;

@lazySingleton
class PlaceOrderUseCase implements UseCase<Order, PlaceOrderParams> {
  final OrderRepository _repository;

  PlaceOrderUseCase(this._repository);

  @override
  Future<Either<Failure, Order>> call(PlaceOrderParams params) {
    return _repository.placeOrder(params.order);
  }
}

class PlaceOrderParams extends Equatable {
  final Order order;

  const PlaceOrderParams({required this.order});

  @override
  List<Object?> get props => [order];
}
