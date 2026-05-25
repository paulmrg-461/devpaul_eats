import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_state.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart.dart';
import 'package:devpaul_eats/features/cart/domain/entities/cart_item.dart';
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_state.dart';
import 'package:devpaul_eats/features/orders/presentation/cubit/order_cubit.dart';
import 'package:devpaul_eats/features/orders/presentation/cubit/order_state.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        state.whenOrNull(
          placed: (order) {
            context.read<CartCubit>().clearCart();
            context.go('/order-success', extra: order);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: const Color(0xFFD62828),
              ),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Confirmar Pedido',
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
            onPressed: () => context.pop(),
          ),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            final cart = cartState.maybeWhen(
              loaded: (c) => c,
              orElse: () => const Cart(items: []),
            );
            if (cart.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/home/cart');
              });
              return const SizedBox.shrink();
            }
            return _CheckoutBody(cart: cart, noteController: _noteController);
          },
        ),
      ),
    );
  }
}

class _CheckoutBody extends StatelessWidget {
  final Cart cart;
  final TextEditingController noteController;

  const _CheckoutBody({required this.cart, required this.noteController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, orderState) {
        final isPlacing = orderState.maybeWhen(
          placing: () => true,
          orElse: () => false,
        );

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order items summary
                    _sectionTitle('Resumen del pedido'),
                    const SizedBox(height: 8),
                    _ItemsSummaryCard(cart: cart),
                    const SizedBox(height: 16),

                    // Note field
                    _sectionTitle('Nota para el cocinero'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: noteController,
                        maxLines: 3,
                        maxLength: 200,
                        decoration: const InputDecoration(
                          hintText: 'Ej: sin cebolla, extra picante...',
                          hintStyle: TextStyle(color: Color(0xFF757575)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                          counterStyle: TextStyle(color: Color(0xFF757575)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Price breakdown
                    _sectionTitle('Desglose de precios'),
                    const SizedBox(height: 8),
                    _PriceCard(cart: cart),
                    const SizedBox(height: 24),

                    // Confirm button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isPlacing
                            ? null
                            : () => _confirm(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B35),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor:
                              const Color(0xFFFF6B35).withValues(alpha: 0.5),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: isPlacing
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Confirmar Pedido',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirm(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    authState.maybeWhen(
      authenticated: (user) {
        context.read<OrderCubit>().placeOrder(
              cart,
              user,
              noteController.text,
            );
      },
      orElse: () {},
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A1A1A),
        ),
      );
}

class _ItemsSummaryCard extends StatelessWidget {
  final Cart cart;

  const _ItemsSummaryCard({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: cart.items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.menuItemName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          if (item.selectedToppings.isNotEmpty)
                            Text(
                              item.selectedToppings
                                  .map((t) => '${t.name}: ${t.grams}g')
                                  .join(', '),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF757575),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${item.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF6B35),
                      ),
                    ),
                  ],
                ),
              ),
              if (i < cart.items.length - 1)
                const Divider(height: 1, indent: 16, endIndent: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final Cart cart;

  const _PriceCard({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _row('Subtotal', '\$${cart.subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),
          _row(
            'Total',
            '\$${cart.subtotal.toStringAsFixed(2)}',
            bold: true,
            valueColor: const Color(0xFFFF6B35),
          ),
        ],
      ),
    );
  }

  Widget _row(
    String label,
    String value, {
    bool bold = false,
    Color? valueColor,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: bold ? 16 : 14,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: bold ? 16 : 14,
              fontWeight: bold ? FontWeight.bold : FontWeight.w600,
              color: valueColor ?? const Color(0xFF1A1A1A),
            ),
          ),
        ],
      );
}
