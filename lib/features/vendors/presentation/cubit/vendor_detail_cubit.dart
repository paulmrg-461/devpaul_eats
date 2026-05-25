import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_items_usecase.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendor_by_id_usecase.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_detail_state.dart';

@injectable
class VendorDetailCubit extends Cubit<VendorDetailState> {
  final GetVendorByIdUseCase _getVendorByIdUseCase;
  final GetMenuItemsUseCase _getMenuItemsUseCase;

  VendorDetailCubit(
    this._getVendorByIdUseCase,
    this._getMenuItemsUseCase,
  ) : super(const VendorDetailState.initial());

  Future<void> loadVendor(String vendorId) async {
    emit(const VendorDetailState.loading());

    final vendorResult =
        await _getVendorByIdUseCase(VendorIdParams(vendorId: vendorId));

    vendorResult.fold(
      (failure) => emit(VendorDetailState.error(failure.message)),
      (vendor) async {
        final menuResult = await _getMenuItemsUseCase(
          GetMenuItemsParams(vendorId: vendorId),
        );
        menuResult.fold(
          (failure) => emit(VendorDetailState.error(failure.message)),
          (items) => emit(VendorDetailState.loaded(vendor, items)),
        );
      },
    );
  }
}
