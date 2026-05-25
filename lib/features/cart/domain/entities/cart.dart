import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    String? vendorId,
    String? vendorName,
    required List<CartItem> items,
  }) = _Cart;
}

extension CartX on Cart {
  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  bool get isEmpty => items.isEmpty;

  int get itemCount => items.length;
}
