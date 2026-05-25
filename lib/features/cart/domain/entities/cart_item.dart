import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class SelectedTopping with _$SelectedTopping {
  const factory SelectedTopping({
    required String toppingId,
    required String name,
    required int grams,
    required double pricePerGram,
  }) = _SelectedTopping;
}

extension SelectedToppingX on SelectedTopping {
  double get totalPrice => grams * pricePerGram;
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required String menuItemId,
    required String menuItemName,
    required String vendorId,
    required double basePrice,
    String? photoUrl,
    required List<SelectedTopping> selectedToppings,
  }) = _CartItem;
}

extension CartItemX on CartItem {
  double get totalPrice =>
      basePrice +
      selectedToppings.fold(0.0, (sum, t) => sum + t.totalPrice);
}
