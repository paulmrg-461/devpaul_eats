import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';

class ToppingModel {
  final String id;
  final String menuItemId;
  final String name;
  final double pricePerGram;
  final int minGrams;
  final int maxGrams;
  final String unit;
  final bool isAvailable;

  const ToppingModel({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.pricePerGram,
    required this.minGrams,
    required this.maxGrams,
    required this.unit,
    required this.isAvailable,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json, {required String id, required String menuItemId}) {
    return ToppingModel(
      id: id,
      menuItemId: menuItemId,
      name: json['name'] as String? ?? '',
      pricePerGram: (json['pricePerGram'] as num? ?? 0).toDouble(),
      minGrams: (json['minGrams'] as num? ?? 0).toInt(),
      maxGrams: (json['maxGrams'] as num? ?? 100).toInt(),
      unit: json['unit'] as String? ?? 'grams',
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  factory ToppingModel.fromEntity(Topping topping) {
    return ToppingModel(
      id: topping.id,
      menuItemId: topping.menuItemId,
      name: topping.name,
      pricePerGram: topping.pricePerGram,
      minGrams: topping.minGrams,
      maxGrams: topping.maxGrams,
      unit: topping.unit == ToppingUnit.ml ? 'ml' : 'grams',
      isAvailable: topping.isAvailable,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pricePerGram': pricePerGram,
      'minGrams': minGrams,
      'maxGrams': maxGrams,
      'unit': unit,
      'isAvailable': isAvailable,
    };
  }

  Topping toEntity() {
    return Topping(
      id: id,
      menuItemId: menuItemId,
      name: name,
      pricePerGram: pricePerGram,
      minGrams: minGrams,
      maxGrams: maxGrams,
      unit: unit == 'ml' ? ToppingUnit.ml : ToppingUnit.grams,
      isAvailable: isAvailable,
    );
  }
}
