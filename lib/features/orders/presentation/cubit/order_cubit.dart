import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/place_order_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/get_vendor_orders_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/update_order_status_usecase.dart';
import 'package:devpaul_eats/features/orders/presentation/cubit/order_state.dart';
import 'package:injectable/injectable.dart' hide Order;

@injectable
class OrderCubit extends Cubit<OrderState> {
  final PlaceOrderUseCase _placeOrder;
  final GetClientOrdersUseCase _getClientOrders;
  final GetVendorOrdersUseCase _getVendorOrders;
  final UpdateOrderStatusUseCase _updateOrderStatus;

  OrderCubit(
    this._placeOrder,
    this._getClientOrders,
    this._getVendorOrders,
    this._updateOrderStatus,
  ) : super(const OrderState.initial());

  Future<void> placeOrder(Cart cart, AppUser user, String note) async {
    emit(const OrderState.placing());

    final now = DateTime.now();
    final order = Order(
      id: 'order_${now.millisecondsSinceEpoch}',
      clientId: user.id,
      vendorId: cart.vendorId ?? '',
      vendorName: cart.vendorName ?? '',
      status: OrderStatus.pending,
      items: cart.items,
      subtotal: cart.subtotal,
      total: cart.subtotal,
      note: note.trim().isEmpty ? null : note.trim(),
      createdAt: now,
      updatedAt: now,
    );

    final result = await _placeOrder(PlaceOrderParams(order: order));
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (placed) => emit(OrderState.placed(placed)),
    );
  }

  Future<void> loadClientOrders(String clientId) async {
    emit(const OrderState.loading());
    final result = await _getClientOrders(
      GetClientOrdersParams(clientId: clientId),
    );
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (orders) => emit(OrderState.ordersLoaded(orders)),
    );
  }

  Future<void> loadVendorOrders(String vendorId) async {
    emit(const OrderState.loading());
    final result = await _getVendorOrders(
      GetVendorOrdersParams(vendorId: vendorId),
    );
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (orders) => emit(OrderState.ordersLoaded(orders)),
    );
  }

  Future<void> updateStatus(String orderId, OrderStatus status) async {
    final result = await _updateOrderStatus(
      UpdateOrderStatusParams(orderId: orderId, status: status),
    );
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (updatedOrder) {
        final current = state;
        current.maybeWhen(
          ordersLoaded: (orders) {
            final updated = orders
                .map((o) => o.id == orderId ? updatedOrder : o)
                .toList();
            emit(OrderState.ordersLoaded(updated));
          },
          orElse: () {},
        );
      },
    );
  }
}
