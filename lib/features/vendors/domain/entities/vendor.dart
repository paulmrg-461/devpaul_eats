import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor.freezed.dart';

enum VendorCategory { burgers, tacos, pizza, bowls, pasta, other }

@freezed
class Vendor with _$Vendor {
  const factory Vendor({
    required String id,
    required String userId,
    required String storeName,
    required String description,
    required VendorCategory category,
    String? coverPhotoUrl,
    required double rating,
    required int totalOrders,
    required bool isOpen,
    required DateTime createdAt,
  }) = _Vendor;
}
