import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/presentation/cubit/item_customizer_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ItemCustomizerCubit extends Cubit<ItemCustomizerState> {
  ItemCustomizerCubit() : super(const ItemCustomizerInitial());

  void loadItem(MenuItem item) {
    final initialGrams = <String, int>{};
    for (final topping in item.toppings) {
      if (topping.isAvailable) {
        initialGrams[topping.id] = topping.minGrams;
      }
    }
    final price = _calculateTotal(item, initialGrams);
    emit(ItemCustomizerReady(
      menuItem: item,
      selectedGrams: initialGrams,
      totalPrice: price,
    ));
  }

  void updateToppingGrams(String toppingId, int grams) {
    final current = state;
    if (current is! ItemCustomizerReady) return;

    final updatedGrams = Map<String, int>.from(current.selectedGrams);
    updatedGrams[toppingId] = grams;
    final price = _calculateTotal(current.menuItem, updatedGrams);

    emit(current.copyWith(selectedGrams: updatedGrams, totalPrice: price));
  }

  int getToppingGrams(String toppingId) {
    final current = state;
    if (current is! ItemCustomizerReady) return 0;
    return current.selectedGrams[toppingId] ?? 0;
  }

  CartItem? buildCartItem() {
    final current = state;
    if (current is! ItemCustomizerReady) return null;

    final selectedToppings = <SelectedTopping>[];
    for (final topping in current.menuItem.toppings) {
      final grams = current.selectedGrams[topping.id] ?? topping.minGrams;
      if (grams > 0) {
        selectedToppings.add(SelectedTopping(
          toppingId: topping.id,
          name: topping.name,
          grams: grams,
          pricePerGram: topping.pricePerGram,
        ));
      }
    }

    final cartItemId = DateTime.now().millisecondsSinceEpoch.toString();

    return CartItem(
      id: cartItemId,
      menuItemId: current.menuItem.id,
      menuItemName: current.menuItem.name,
      vendorId: current.menuItem.vendorId,
      basePrice: current.menuItem.basePrice,
      photoUrl: current.menuItem.photoUrl,
      selectedToppings: selectedToppings,
    );
  }

  double _calculateTotal(MenuItem item, Map<String, int> grams) {
    double total = item.basePrice;
    for (final topping in item.toppings) {
      if (!topping.isAvailable) continue;
      final selectedG = grams[topping.id] ?? topping.minGrams;
      total += selectedG * topping.pricePerGram;
    }
    return total;
  }
}
