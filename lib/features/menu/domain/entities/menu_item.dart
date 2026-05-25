import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';

part 'menu_item.freezed.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String vendorId,
    required String name,
    required String description,
    required double basePrice,
    String? photoUrl,
    required String category,
    required bool isAvailable,
    required List<Topping> toppings,
  }) = _MenuItem;
}
