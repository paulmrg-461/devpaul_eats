import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetVendorByIdUseCase implements UseCase<Vendor, VendorIdParams> {
  final VendorRepository _repository;

  GetVendorByIdUseCase(this._repository);

  @override
  Future<Either<Failure, Vendor>> call(VendorIdParams params) {
    return _repository.getVendorById(params.vendorId);
  }
}

class VendorIdParams extends Equatable {
  final String vendorId;

  const VendorIdParams({required this.vendorId});

  @override
  List<Object?> get props => [vendorId];
}
