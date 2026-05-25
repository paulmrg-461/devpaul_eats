import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';

part 'vendor_detail_state.freezed.dart';

@freezed
class VendorDetailState with _$VendorDetailState {
  const factory VendorDetailState.initial() = _DetailInitial;
  const factory VendorDetailState.loading() = _DetailLoading;
  const factory VendorDetailState.loaded(
    Vendor vendor,
    List<MenuItem> menuItems,
  ) = _DetailLoaded;
  const factory VendorDetailState.error(String message) = _DetailError;
}
