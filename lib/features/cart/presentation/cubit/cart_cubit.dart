import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCart;
  final AddToCartUseCase _addToCart;
  final RemoveFromCartUseCase _removeFromCart;
  final ClearCartUseCase _clearCart;

  String? _currentUserId;

  CartCubit(
    this._getCart,
    this._addToCart,
    this._removeFromCart,
    this._clearCart,
  ) : super(const CartState.initial());

  int get itemCount => state.maybeWhen(
        loaded: (cart) => cart.itemCount,
        orElse: () => 0,
      );

  Future<void> loadCart(String userId) async {
    _currentUserId = userId;
    emit(const CartState.loading());
    final result = await _getCart(GetCartParams(userId: userId));
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (cart) => emit(CartState.loaded(cart)),
    );
  }

  Future<void> addItem(
    CartItem item,
    String vendorId,
    String vendorName,
  ) async {
    final userId = _currentUserId;
    if (userId == null) return;

    final result = await _addToCart(
      AddToCartParams(
        userId: userId,
        item: item,
        vendorId: vendorId,
        vendorName: vendorName,
      ),
    );
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (cart) => emit(CartState.loaded(cart)),
    );
  }

  Future<void> removeItem(String cartItemId) async {
    final userId = _currentUserId;
    if (userId == null) return;

    final result = await _removeFromCart(
      RemoveFromCartParams(userId: userId, cartItemId: cartItemId),
    );
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (cart) => emit(CartState.loaded(cart)),
    );
  }

  Future<void> clearCart() async {
    final userId = _currentUserId;
    if (userId == null) return;

    final result = await _clearCart(ClearCartParams(userId: userId));
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (_) => emit(const CartState.loaded(Cart(items: []))),
    );
  }
}
