import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/cart/data/models/cart_item_model.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:injectable/injectable.dart';

abstract class CartRemoteDataSource {
  Future<Cart> getCart(String userId);
  Future<Cart> saveCart(
    String userId,
    String? vendorId,
    String? vendorName,
    List<CartItem> items,
  );
  Future<void> clearCart(String userId);
}

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final FirebaseFirestore _firestore;

  CartRemoteDataSourceImpl(this._firestore);

  DocumentReference _doc(String userId) =>
      _firestore.collection('carts').doc(userId);

  @override
  Future<Cart> getCart(String userId) async {
    final snap = await _doc(userId).get();
    if (!snap.exists || snap.data() == null) {
      return const Cart(items: []);
    }
    final data = snap.data()! as Map<String, dynamic>;
    final items = (data['items'] as List<dynamic>? ?? [])
        .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>).toEntity())
        .toList();
    return Cart(
      vendorId: data['vendorId'] as String?,
      vendorName: data['vendorName'] as String?,
      items: items,
    );
  }

  @override
  Future<Cart> saveCart(
    String userId,
    String? vendorId,
    String? vendorName,
    List<CartItem> items,
  ) async {
    final data = {
      'vendorId': vendorId,
      'vendorName': vendorName,
      'items': items.map((i) => CartItemModel.fromEntity(i).toJson()).toList(),
    };
    await _doc(userId).set(data);
    return Cart(vendorId: vendorId, vendorName: vendorName, items: items);
  }

  @override
  Future<void> clearCart(String userId) async {
    await _doc(userId).delete();
  }
}
