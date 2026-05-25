import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';

part 'order.freezed.dart';

enum OrderStatus { pending, accepted, preparing, ready, delivered, cancelled }

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String clientId,
    required String vendorId,
    required String vendorName,
    required OrderStatus status,
    required List<CartItem> items,
    required double subtotal,
    required double total,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Order;
}
