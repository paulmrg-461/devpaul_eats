import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';

sealed class VendorPanelState {
  const VendorPanelState();
}

class VendorPanelInitial extends VendorPanelState {
  const VendorPanelInitial();
}

class VendorPanelLoading extends VendorPanelState {
  const VendorPanelLoading();
}

class VendorPanelLoaded extends VendorPanelState {
  final Vendor vendor;
  final List<Order> pendingOrders;

  const VendorPanelLoaded({
    required this.vendor,
    required this.pendingOrders,
  });

  VendorPanelLoaded copyWith({
    Vendor? vendor,
    List<Order>? pendingOrders,
  }) {
    return VendorPanelLoaded(
      vendor: vendor ?? this.vendor,
      pendingOrders: pendingOrders ?? this.pendingOrders,
    );
  }
}

class VendorPanelError extends VendorPanelState {
  final String message;
  const VendorPanelError(this.message);
}
