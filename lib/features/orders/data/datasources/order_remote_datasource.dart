import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/orders/data/models/order_model.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:injectable/injectable.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderModel order);
  Future<List<OrderModel>> getClientOrders(String clientId);
  Future<List<OrderModel>> getVendorOrders(String vendorId);
  Future<OrderModel> updateOrderStatus(String orderId, OrderStatus status);
  Stream<List<OrderModel>> watchVendorOrders(String vendorId);
  Stream<List<OrderModel>> watchClientOrders(String clientId);
}

@LazySingleton(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final FirebaseFirestore _firestore;

  OrderRemoteDataSourceImpl(this._firestore);

  CollectionReference get _col => _firestore.collection('orders');

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    final data = order.toJson();
    await _col.doc(order.id).set(data);
    return order;
  }

  @override
  Future<List<OrderModel>> getClientOrders(String clientId) async {
    final snap = await _col
        .where('clientId', isEqualTo: clientId)
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs
        .map((d) => OrderModel.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<OrderModel>> getVendorOrders(String vendorId) async {
    final snap = await _col
        .where('vendorId', isEqualTo: vendorId)
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs
        .map((d) => OrderModel.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<OrderModel> updateOrderStatus(
    String orderId,
    OrderStatus status,
  ) async {
    final now = DateTime.now();
    await _col.doc(orderId).update({
      'status': status.name,
      'updatedAt': Timestamp.fromDate(now),
    });
    final snap = await _col.doc(orderId).get();
    return OrderModel.fromJson(snap.data() as Map<String, dynamic>);
  }

  @override
  Stream<List<OrderModel>> watchVendorOrders(String vendorId) {
    return _col
        .where('vendorId', isEqualTo: vendorId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map(
                (d) => OrderModel.fromJson(d.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }

  @override
  Stream<List<OrderModel>> watchClientOrders(String clientId) {
    return _col
        .where('clientId', isEqualTo: clientId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map(
                (d) => OrderModel.fromJson(d.data() as Map<String, dynamic>),
              )
              .toList(),
        );
  }
}
