import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:devpaul_eats/features/vendors/data/models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> getVendors();
  Future<VendorModel> getVendorById(String id);
  Future<VendorModel> createVendor(VendorModel vendor);
  Future<VendorModel> updateVendor(VendorModel vendor);
  Stream<List<VendorModel>> watchVendors();
}

@LazySingleton(as: VendorRemoteDataSource)
class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {
  final FirebaseFirestore _firestore;

  static const String _collection = 'vendors';

  VendorRemoteDataSourceImpl(this._firestore);

  CollectionReference<Map<String, dynamic>> get _ref =>
      _firestore.collection(_collection);

  @override
  Future<List<VendorModel>> getVendors() async {
    final snapshot =
        await _ref.orderBy('rating', descending: true).get();
    return snapshot.docs
        .map((doc) => VendorModel.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<VendorModel> getVendorById(String id) async {
    final doc = await _ref.doc(id).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Vendor not found: $id');
    }
    return VendorModel.fromJson(doc.data()!, id: doc.id);
  }

  @override
  Future<VendorModel> createVendor(VendorModel vendor) async {
    final json = vendor.toJson()..remove('id');
    final docRef = await _ref.add(json);
    final created = await docRef.get();
    return VendorModel.fromJson(created.data()!, id: created.id);
  }

  @override
  Future<VendorModel> updateVendor(VendorModel vendor) async {
    final json = vendor.toJson()..remove('id');
    await _ref.doc(vendor.id).update(json);
    final updated = await _ref.doc(vendor.id).get();
    return VendorModel.fromJson(updated.data()!, id: updated.id);
  }

  @override
  Stream<List<VendorModel>> watchVendors() {
    return _ref
        .orderBy('rating', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => VendorModel.fromJson(doc.data(), id: doc.id))
            .toList());
  }
}
