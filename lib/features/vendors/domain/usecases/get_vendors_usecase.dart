import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class GetVendorsUseCase implements UseCase<List<Vendor>, NoParams> {
  final VendorRepository _repository;

  GetVendorsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Vendor>>> call(NoParams params) {
    return _repository.getVendors();
  }
}
