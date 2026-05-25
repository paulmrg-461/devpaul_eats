import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';

part 'vendor_list_state.freezed.dart';

@freezed
class VendorListState with _$VendorListState {
  const factory VendorListState.initial() = _Initial;
  const factory VendorListState.loading() = _Loading;
  const factory VendorListState.loaded(
    List<Vendor> vendors,
    List<Vendor> filtered,
  ) = _Loaded;
  const factory VendorListState.error(String message) = _Error;
}
