import 'package:dartz/dartz.dart';
import 'package:devpaul_eats/core/errors/failures.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<Vendor>>> getVendors();

  Future<Either<Failure, Vendor>> getVendorById(String id);

  Future<Either<Failure, Vendor>> createVendor(Vendor vendor);

  Future<Either<Failure, Vendor>> updateVendor(Vendor vendor);

  Stream<List<Vendor>> watchVendors();
}
