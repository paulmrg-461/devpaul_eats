import 'package:dartz/dartz.dart' hide Order;
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import "package:injectable/injectable.dart" hide Order;

@lazySingleton
class GetClientOrdersUseCase
    implements UseCase<List<Order>, GetClientOrdersParams> {
  final OrderRepository _repository;

  GetClientOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, List<Order>>> call(GetClientOrdersParams params) {
    return _repository.getClientOrders(params.clientId);
  }
}

class GetClientOrdersParams extends Equatable {
  final String clientId;

  const GetClientOrdersParams({required this.clientId});

  @override
  List<Object?> get props => [clientId];
}
