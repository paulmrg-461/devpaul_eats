import 'package:devpaul_eats/features/menu/data/models/topping_model.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';

class MenuItemModel {
  final String id;
  final String vendorId;
  final String name;
  final String description;
  final double basePrice;
  final String? photoUrl;
  final String category;
  final bool isAvailable;

  const MenuItemModel({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.description,
    required this.basePrice,
    this.photoUrl,
    required this.category,
    required this.isAvailable,
  });

  factory MenuItemModel.fromJson(
    Map<String, dynamic> json, {
    required String id,
    required String vendorId,
  }) {
    return MenuItemModel(
      id: id,
      vendorId: vendorId,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      basePrice: (json['basePrice'] as num? ?? 0).toDouble(),
      photoUrl: json['photoUrl'] as String?,
      category: json['category'] as String? ?? 'General',
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  factory MenuItemModel.fromEntity(MenuItem item) {
    return MenuItemModel(
      id: item.id,
      vendorId: item.vendorId,
      name: item.name,
      description: item.description,
      basePrice: item.basePrice,
      photoUrl: item.photoUrl,
      category: item.category,
      isAvailable: item.isAvailable,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vendorId': vendorId,
      'name': name,
      'description': description,
      'basePrice': basePrice,
      'photoUrl': photoUrl,
      'category': category,
      'isAvailable': isAvailable,
    };
  }

  /// Toppings are stored as subcollection — pass them in separately.
  MenuItem toEntity(List<ToppingModel> toppings) {
    return MenuItem(
      id: id,
      vendorId: vendorId,
      name: name,
      description: description,
      basePrice: basePrice,
      photoUrl: photoUrl,
      category: category,
      isAvailable: isAvailable,
      toppings: toppings.map((t) => t.toEntity()).toList(),
    );
  }
}
