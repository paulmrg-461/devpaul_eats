import 'package:devpaul_eats/features/menu/data/datasources/menu_remote_datasource.dart';
import 'package:devpaul_eats/features/menu/data/models/menu_item_model.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_items_usecase.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MenuManagerCubit extends Cubit<MenuManagerState> {
  final GetMenuItemsUseCase _getMenuItemsUseCase;
  final MenuRemoteDataSource _menuDataSource;

  MenuManagerCubit(
    this._getMenuItemsUseCase,
    this._menuDataSource,
  ) : super(const MenuManagerInitial());

  Future<void> loadMenu(String vendorId) async {
    emit(const MenuManagerLoading());
    final result = await _getMenuItemsUseCase(
      GetMenuItemsParams(vendorId: vendorId),
    );
    result.fold(
      (failure) => emit(MenuManagerError(failure.message)),
      (items) => emit(MenuManagerLoaded(items)),
    );
  }

  Future<void> deleteItem(String vendorId, String itemId) async {
    final current = state;
    if (current is! MenuManagerLoaded) return;

    try {
      await _menuDataSource.deleteMenuItem(vendorId, itemId);
      final updated = current.items.where((i) => i.id != itemId).toList();
      emit(current.copyWith(items: updated));
    } catch (e) {
      emit(MenuManagerError(e.toString()));
      emit(current);
    }
  }

  Future<void> toggleItemAvailability(MenuItem item) async {
    final current = state;
    if (current is! MenuManagerLoaded) return;

    final updated = item.copyWith(isAvailable: !item.isAvailable);
    try {
      await _menuDataSource.updateMenuItem(MenuItemModel.fromEntity(updated));
      final updatedList = current.items.map((i) {
        return i.id == item.id ? updated : i;
      }).toList();
      emit(current.copyWith(items: updatedList));
    } catch (e) {
      emit(MenuManagerError(e.toString()));
      emit(current);
    }
  }

  Future<void> refreshMenu(String vendorId) async {
    await loadMenu(vendorId);
  }
}
