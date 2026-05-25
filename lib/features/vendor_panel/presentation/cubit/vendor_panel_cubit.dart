import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:devpaul_eats/features/orders/data/models/order_model.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/update_order_status_usecase.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_state.dart';
import 'package:devpaul_eats/features/vendors/data/models/vendor_model.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;

@injectable
class VendorPanelCubit extends Cubit<VendorPanelState> {
  final VendorRepository _vendorRepository;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final FirebaseFirestore _firestore;

  StreamSubscription<List<Order>>? _ordersSub;

  VendorPanelCubit(
    this._vendorRepository,
    this._updateOrderStatusUseCase,
    this._firestore,
  ) : super(const VendorPanelInitial());

  /// Loads vendor profile by userId.
  /// If no vendor found → emits VendorPanelError('no_vendor') so UI shows setup.
  Future<void> loadPanel(String userId) async {
    emit(const VendorPanelLoading());
    try {
      final snap = await _firestore
          .collection('vendors')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (snap.docs.isEmpty) {
        emit(const VendorPanelError('no_vendor'));
        return;
      }

      final doc = snap.docs.first;
      final vendor = VendorModel.fromJson(doc.data(), id: doc.id).toEntity();

      emit(VendorPanelLoaded(vendor: vendor, pendingOrders: const []));
      _subscribeToOrders(vendor.id);
    } catch (e) {
      emit(VendorPanelError(e.toString()));
    }
  }

  void _subscribeToOrders(String vendorId) {
    _ordersSub?.cancel();
    _ordersSub = _firestore
        .collection('orders')
        .where('vendorId', isEqualTo: vendorId)
        .where('status', whereIn: ['pending', 'accepted', 'preparing', 'ready'])
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) {
              final data = doc.data()..['id'] = doc.id;
              return OrderModel.fromJson(data).toEntity();
            })
            .toList())
        .listen((orders) {
          final current = state;
          if (current is VendorPanelLoaded) {
            emit(current.copyWith(pendingOrders: orders));
          }
        });
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    final snapshot = state;
    final result = await _updateOrderStatusUseCase(
      UpdateOrderStatusParams(orderId: orderId, status: status),
    );
    result.fold(
      (failure) {
        if (snapshot is VendorPanelLoaded) {
          // Briefly show error then restore loaded state
          emit(VendorPanelError(failure.message));
          emit(snapshot);
        }
      },
      (_) {}, // stream subscription updates state automatically
    );
  }

  Future<void> toggleStoreOpen() async {
    final current = state;
    if (current is! VendorPanelLoaded) return;

    final updated = current.vendor.copyWith(isOpen: !current.vendor.isOpen);
    final result = await _vendorRepository.updateVendor(updated);
    result.fold(
      (failure) => null,
      (vendor) => emit(current.copyWith(vendor: vendor)),
    );
  }

  @override
  Future<void> close() {
    _ordersSub?.cancel();
    return super.close();
  }
}
