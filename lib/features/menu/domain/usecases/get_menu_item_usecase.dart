import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/repositories/menu_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetMenuItemUseCase implements UseCase<MenuItem, GetMenuItemParams> {
  final MenuRepository _repository;

  GetMenuItemUseCase(this._repository);

  @override
  Future<Either<Failure, MenuItem>> call(GetMenuItemParams params) {
    return _repository.getMenuItemById(params.vendorId, params.itemId);
  }
}

class GetMenuItemParams extends Equatable {
  final String vendorId;
  final String itemId;

  const GetMenuItemParams({required this.vendorId, required this.itemId});

  @override
  List<Object?> get props => [vendorId, itemId];
}
