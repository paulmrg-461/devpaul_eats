import 'package:freezed_annotation/freezed_annotation.dart';

part 'topping.freezed.dart';

enum ToppingUnit { grams, ml }

@freezed
class Topping with _$Topping {
  const factory Topping({
    required String id,
    required String menuItemId,
    required String name,
    required double pricePerGram,
    required int minGrams,
    required int maxGrams,
    required ToppingUnit unit,
    required bool isAvailable,
  }) = _Topping;
}
