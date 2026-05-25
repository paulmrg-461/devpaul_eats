import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';

/// ItemCustomizer states (manual sealed class — no code gen required).
abstract class ItemCustomizerState {
  const ItemCustomizerState();
}

class ItemCustomizerInitial extends ItemCustomizerState {
  const ItemCustomizerInitial();
}

class ItemCustomizerLoading extends ItemCustomizerState {
  const ItemCustomizerLoading();
}

class ItemCustomizerReady extends ItemCustomizerState {
  final MenuItem menuItem;
  final Map<String, int> selectedGrams;
  final double totalPrice;

  const ItemCustomizerReady({
    required this.menuItem,
    required this.selectedGrams,
    required this.totalPrice,
  });

  ItemCustomizerReady copyWith({
    MenuItem? menuItem,
    Map<String, int>? selectedGrams,
    double? totalPrice,
  }) {
    return ItemCustomizerReady(
      menuItem: menuItem ?? this.menuItem,
      selectedGrams: selectedGrams ?? this.selectedGrams,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class ItemCustomizerError extends ItemCustomizerState {
  final String message;
  const ItemCustomizerError(this.message);
}
