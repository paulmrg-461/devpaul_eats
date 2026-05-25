import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendors_usecase.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_list_state.dart';

@injectable
class VendorListCubit extends Cubit<VendorListState> {
  final GetVendorsUseCase _getVendorsUseCase;

  VendorListCubit(this._getVendorsUseCase)
      : super(const VendorListState.initial());

  Future<void> loadVendors() async {
    emit(const VendorListState.loading());
    final result = await _getVendorsUseCase(const NoParams());
    result.fold(
      (failure) => emit(VendorListState.error(failure.message)),
      (vendors) => emit(VendorListState.loaded(vendors, vendors)),
    );
  }

  void filterByCategory(VendorCategory? category) {
    state.maybeWhen(
      loaded: (vendors, _) {
        if (category == null) {
          emit(VendorListState.loaded(vendors, vendors));
        } else {
          emit(VendorListState.loaded(
            vendors,
            vendors.where((v) => v.category == category).toList(),
          ));
        }
      },
      orElse: () {},
    );
  }

  void search(String query) {
    state.maybeWhen(
      loaded: (vendors, _) {
        if (query.trim().isEmpty) {
          emit(VendorListState.loaded(vendors, vendors));
        } else {
          final q = query.toLowerCase();
          emit(VendorListState.loaded(
            vendors,
            vendors.where((v) => v.storeName.toLowerCase().contains(q)).toList(),
          ));
        }
      },
      orElse: () {},
    );
  }
}
