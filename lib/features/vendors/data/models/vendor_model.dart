import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';

class VendorModel {
  final String id;
  final String userId;
  final String storeName;
  final String description;
  final String category;
  final String? coverPhotoUrl;
  final num rating;
  final int totalOrders;
  final bool isOpen;
  final Timestamp createdAt;

  const VendorModel({
    required this.id,
    required this.userId,
    required this.storeName,
    required this.description,
    required this.category,
    this.coverPhotoUrl,
    required this.rating,
    required this.totalOrders,
    required this.isOpen,
    required this.createdAt,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return VendorModel(
      id: id ?? json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      storeName: json['storeName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? 'other',
      coverPhotoUrl: json['coverPhotoUrl'] as String?,
      rating: json['rating'] as num? ?? 0,
      totalOrders: json['totalOrders'] as int? ?? 0,
      isOpen: json['isOpen'] as bool? ?? false,
      createdAt: json['createdAt'] is Timestamp
          ? json['createdAt'] as Timestamp
          : Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'storeName': storeName,
      'description': description,
      'category': category,
      'coverPhotoUrl': coverPhotoUrl,
      'rating': rating,
      'totalOrders': totalOrders,
      'isOpen': isOpen,
      'createdAt': createdAt,
    };
  }

  Vendor toEntity() {
    return Vendor(
      id: id,
      userId: userId,
      storeName: storeName,
      description: description,
      category: _categoryFromString(category),
      coverPhotoUrl: coverPhotoUrl,
      rating: rating.toDouble(),
      totalOrders: totalOrders,
      isOpen: isOpen,
      createdAt: createdAt.toDate(),
    );
  }

  factory VendorModel.fromEntity(Vendor vendor) {
    return VendorModel(
      id: vendor.id,
      userId: vendor.userId,
      storeName: vendor.storeName,
      description: vendor.description,
      category: _categoryToString(vendor.category),
      coverPhotoUrl: vendor.coverPhotoUrl,
      rating: vendor.rating,
      totalOrders: vendor.totalOrders,
      isOpen: vendor.isOpen,
      createdAt: Timestamp.fromDate(vendor.createdAt),
    );
  }

  static VendorCategory _categoryFromString(String value) {
    switch (value.toLowerCase()) {
      case 'burgers':
        return VendorCategory.burgers;
      case 'tacos':
        return VendorCategory.tacos;
      case 'pizza':
        return VendorCategory.pizza;
      case 'bowls':
        return VendorCategory.bowls;
      case 'pasta':
        return VendorCategory.pasta;
      default:
        return VendorCategory.other;
    }
  }

  static String _categoryToString(VendorCategory category) {
    return category.name;
  }
}
