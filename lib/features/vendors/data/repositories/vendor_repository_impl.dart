import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/vendors/data/datasources/vendor_remote_datasource.dart';
import 'package:devpaul_eats/features/vendors/data/models/vendor_model.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';

@LazySingleton(as: VendorRepository)
class VendorRepositoryImpl implements VendorRepository {
  final VendorRemoteDataSource _dataSource;

  VendorRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Vendor>>> getVendors() async {
    try {
      final models = await _dataSource.getVendors();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vendor>> getVendorById(String id) async {
    try {
      final model = await _dataSource.getVendorById(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vendor>> createVendor(Vendor vendor) async {
    try {
      final model = VendorModel.fromEntity(vendor);
      final created = await _dataSource.createVendor(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Vendor>> updateVendor(Vendor vendor) async {
    try {
      final model = VendorModel.fromEntity(vendor);
      final updated = await _dataSource.updateVendor(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<Vendor>> watchVendors() {
    return _dataSource
        .watchVendors()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
