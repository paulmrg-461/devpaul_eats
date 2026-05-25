import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.placing() = _Placing;
  const factory OrderState.placed(Order order) = _Placed;
  const factory OrderState.ordersLoaded(List<Order> orders) = _OrdersLoaded;
  const factory OrderState.error(String message) = _Error;
}
