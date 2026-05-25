import 'package:dartz/dartz.dart' hide Order;
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import "package:injectable/injectable.dart" hide Order;

@lazySingleton
class GetVendorOrdersUseCase
    implements UseCase<List<Order>, GetVendorOrdersParams> {
  final OrderRepository _repository;

  GetVendorOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, List<Order>>> call(GetVendorOrdersParams params) {
    return _repository.getVendorOrders(params.vendorId);
  }
}

class GetVendorOrdersParams extends Equatable {
  final String vendorId;

  const GetVendorOrdersParams({required this.vendorId});

  @override
  List<Object?> get props => [vendorId];
}
