import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';

class SelectedToppingModel {
  final String toppingId;
  final String name;
  final int grams;
  final double pricePerGram;

  const SelectedToppingModel({
    required this.toppingId,
    required this.name,
    required this.grams,
    required this.pricePerGram,
  });

  factory SelectedToppingModel.fromJson(Map<String, dynamic> json) {
    return SelectedToppingModel(
      toppingId: json['toppingId'] as String,
      name: json['name'] as String,
      grams: (json['grams'] as num).toInt(),
      pricePerGram: (json['pricePerGram'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'toppingId': toppingId,
        'name': name,
        'grams': grams,
        'pricePerGram': pricePerGram,
      };

  factory SelectedToppingModel.fromEntity(SelectedTopping entity) {
    return SelectedToppingModel(
      toppingId: entity.toppingId,
      name: entity.name,
      grams: entity.grams,
      pricePerGram: entity.pricePerGram,
    );
  }

  SelectedTopping toEntity() => SelectedTopping(
        toppingId: toppingId,
        name: name,
        grams: grams,
        pricePerGram: pricePerGram,
      );
}

class CartItemModel {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final String vendorId;
  final double basePrice;
  final String? photoUrl;
  final List<SelectedToppingModel> selectedToppings;

  const CartItemModel({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    required this.vendorId,
    required this.basePrice,
    this.photoUrl,
    required this.selectedToppings,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String,
      menuItemName: json['menuItemName'] as String,
      vendorId: json['vendorId'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      photoUrl: json['photoUrl'] as String?,
      selectedToppings: (json['selectedToppings'] as List<dynamic>? ?? [])
          .map((e) => SelectedToppingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'menuItemId': menuItemId,
        'menuItemName': menuItemName,
        'vendorId': vendorId,
        'basePrice': basePrice,
        'photoUrl': photoUrl,
        'selectedToppings': selectedToppings.map((t) => t.toJson()).toList(),
      };

  factory CartItemModel.fromEntity(CartItem entity) {
    return CartItemModel(
      id: entity.id,
      menuItemId: entity.menuItemId,
      menuItemName: entity.menuItemName,
      vendorId: entity.vendorId,
      basePrice: entity.basePrice,
      photoUrl: entity.photoUrl,
      selectedToppings: entity.selectedToppings
          .map(SelectedToppingModel.fromEntity)
          .toList(),
    );
  }

  CartItem toEntity() => CartItem(
        id: id,
        menuItemId: menuItemId,
        menuItemName: menuItemName,
        vendorId: vendorId,
        basePrice: basePrice,
        photoUrl: photoUrl,
        selectedToppings: selectedToppings.map((t) => t.toEntity()).toList(),
      );
}
