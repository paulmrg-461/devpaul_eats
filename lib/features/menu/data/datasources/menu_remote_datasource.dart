import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/menu/data/models/menu_item_model.dart';
import 'package:devpaul_eats/features/menu/data/models/topping_model.dart';
import 'package:injectable/injectable.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuItemModel>> getMenuItems(String vendorId);
  Future<MenuItemModel> getMenuItemById(String vendorId, String itemId);
  Future<String> createMenuItem(String vendorId, MenuItemModel model);
  Future<void> updateMenuItem(MenuItemModel model);
  Future<void> deleteMenuItem(String vendorId, String itemId);
  Future<String> addTopping(String vendorId, String itemId, ToppingModel model);
  Future<void> deleteTopping(String vendorId, String itemId, String toppingId);
}

@LazySingleton(as: MenuRemoteDataSource)
class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final FirebaseFirestore _firestore;

  MenuRemoteDataSourceImpl(this._firestore);

  CollectionReference<Map<String, dynamic>> _itemsRef(String vendorId) =>
      _firestore.collection('vendors').doc(vendorId).collection('menu_items');

  CollectionReference<Map<String, dynamic>> _toppingsRef(
    String vendorId,
    String itemId,
  ) =>
      _itemsRef(vendorId).doc(itemId).collection('toppings');

  Future<List<ToppingModel>> _fetchToppings(
    String vendorId,
    String itemId,
  ) async {
    final snap = await _toppingsRef(vendorId, itemId).get();
    return snap.docs
        .map(
          (doc) => ToppingModel.fromJson(
            doc.data(),
            id: doc.id,
            menuItemId: itemId,
          ),
        )
        .toList();
  }

  @override
  Future<List<MenuItemModel>> getMenuItems(String vendorId) async {
    final snap = await _itemsRef(vendorId).get();
    return snap.docs
        .map(
          (doc) => MenuItemModel.fromJson(
            doc.data(),
            id: doc.id,
            vendorId: vendorId,
          ),
        )
        .toList();
  }

  @override
  Future<MenuItemModel> getMenuItemById(String vendorId, String itemId) async {
    final doc = await _itemsRef(vendorId).doc(itemId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('MenuItem not found: $itemId');
    }
    return MenuItemModel.fromJson(doc.data()!, id: doc.id, vendorId: vendorId);
  }

  @override
  Future<String> createMenuItem(String vendorId, MenuItemModel model) async {
    final ref = await _itemsRef(vendorId).add(model.toJson());
    return ref.id;
  }

  @override
  Future<void> updateMenuItem(MenuItemModel model) async {
    await _itemsRef(model.vendorId).doc(model.id).update(model.toJson());
  }

  @override
  Future<void> deleteMenuItem(String vendorId, String itemId) async {
    await _itemsRef(vendorId).doc(itemId).delete();
  }

  @override
  Future<String> addTopping(String vendorId, String itemId, ToppingModel model) async {
    final ref = await _toppingsRef(vendorId, itemId).add(model.toJson());
    return ref.id;
  }

  @override
  Future<void> deleteTopping(
    String vendorId,
    String itemId,
    String toppingId,
  ) async {
    await _toppingsRef(vendorId, itemId).doc(toppingId).delete();
  }

  /// Fetches item model AND its toppings subcollection.
  Future<(MenuItemModel, List<ToppingModel>)> getMenuItemWithToppings(
    String vendorId,
    String itemId,
  ) async {
    final model = await getMenuItemById(vendorId, itemId);
    final toppings = await _fetchToppings(vendorId, itemId);
    return (model, toppings);
  }

  /// Fetches all items for a vendor including their toppings subcollections.
  Future<List<(MenuItemModel, List<ToppingModel>)>> getMenuItemsWithToppings(
    String vendorId,
  ) async {
    final items = await getMenuItems(vendorId);
    final results = <(MenuItemModel, List<ToppingModel>)>[];
    for (final item in items) {
      final toppings = await _fetchToppings(vendorId, item.id);
      results.add((item, toppings));
    }
    return results;
  }
}
