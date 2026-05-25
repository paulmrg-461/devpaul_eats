import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:devpaul_eats/features/cart/data/models/cart_item_model.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';

class OrderModel {
  final String id;
  final String clientId;
  final String vendorId;
  final String vendorName;
  final String status;
  final List<CartItemModel> items;
  final double subtotal;
  final double total;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderModel({
    required this.id,
    required this.clientId,
    required this.vendorId,
    required this.vendorName,
    required this.status,
    required this.items,
    required this.subtotal,
    required this.total,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime parseDate(dynamic value) {
      if (value is Timestamp) return value.toDate();
      if (value is String) return DateTime.parse(value);
      return DateTime.now();
    }

    return OrderModel(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      vendorId: json['vendorId'] as String,
      vendorName: json['vendorName'] as String,
      status: json['status'] as String,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      note: json['note'] as String?,
      createdAt: parseDate(json['createdAt']),
      updatedAt: parseDate(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'clientId': clientId,
        'vendorId': vendorId,
        'vendorName': vendorName,
        'status': status,
        'items': items.map((i) => i.toJson()).toList(),
        'subtotal': subtotal,
        'total': total,
        'note': note,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory OrderModel.fromEntity(Order entity) {
    return OrderModel(
      id: entity.id,
      clientId: entity.clientId,
      vendorId: entity.vendorId,
      vendorName: entity.vendorName,
      status: entity.status.name,
      items: entity.items.map(CartItemModel.fromEntity).toList(),
      subtotal: entity.subtotal,
      total: entity.total,
      note: entity.note,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  Order toEntity() {
    OrderStatus parseStatus(String s) {
      return OrderStatus.values.firstWhere(
        (e) => e.name == s,
        orElse: () => OrderStatus.pending,
      );
    }

    return Order(
      id: id,
      clientId: clientId,
      vendorId: vendorId,
      vendorName: vendorName,
      status: parseStatus(status),
      items: items.map((i) => i.toEntity()).toList(),
      subtotal: subtotal,
      total: total,
      note: note,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
