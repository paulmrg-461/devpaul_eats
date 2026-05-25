import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/repositories/menu_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetMenuItemsUseCase implements UseCase<List<MenuItem>, GetMenuItemsParams> {
  final MenuRepository _repository;

  GetMenuItemsUseCase(this._repository);

  @override
  Future<Either<Failure, List<MenuItem>>> call(GetMenuItemsParams params) {
    return _repository.getMenuItems(params.vendorId);
  }
}

class GetMenuItemsParams extends Equatable {
  final String vendorId;

  const GetMenuItemsParams({required this.vendorId});

  @override
  List<Object?> get props => [vendorId];
}
