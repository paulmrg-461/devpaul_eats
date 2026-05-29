import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_state.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/pages/vendor_setup_page.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/widgets/order_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VendorPanelPage extends StatefulWidget {
  const VendorPanelPage({super.key});

  @override
  State<VendorPanelPage> createState() => _VendorPanelPageState();
}

class _VendorPanelPageState extends State<VendorPanelPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initPanel());
  }

  void _initPanel() {
    final authState = context.read<AuthCubit>().state;
    authState.maybeWhen(
      authenticated: (user) {
        context.read<VendorPanelCubit>().loadPanel(user.id);
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorPanelCubit, VendorPanelState>(
      listener: (context, state) {
        if (state is VendorPanelError && state.message == 'no_vendor') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const VendorSetupPage()),
          );
        }
      },
      builder: (context, state) {
        return switch (state) {
          VendorPanelInitial() || VendorPanelLoading() => const Scaffold(
              backgroundColor: Color(0xFFFFF8F0),
              body: Center(child: CircularProgressIndicator()),
            ),
          VendorPanelError(:final message) when message == 'no_vendor' =>
            const Scaffold(
              backgroundColor: Color(0xFFFFF8F0),
              body: Center(child: CircularProgressIndicator()),
            ),
          VendorPanelError(:final message) => Scaffold(
              backgroundColor: Color(0xFFFFF8F0),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Color(0xFFD62828)),
                    const SizedBox(height: 16),
                    Text(message, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _initPanel,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            ),
          VendorPanelLoaded(:final vendor, :final pendingOrders) => Scaffold(
              backgroundColor: const Color(0xFFFFF8F0),
              appBar: _buildAppBar(context, vendor.storeName, vendor.isOpen),
              body: RefreshIndicator(
                onRefresh: () async => _initPanel(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _StatsRow(
                        totalOrders: vendor.totalOrders,
                        pendingCount: pendingOrders
                            .where((o) => o.status == OrderStatus.pending)
                            .length,
                        rating: vendor.rating,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          'Pedidos Activos (${pendingOrders.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                    ),
                    if (pendingOrders.isEmpty)
                      const SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.inbox_outlined, size: 64, color: Color(0xFF757575)),
                              SizedBox(height: 12),
                              Text(
                                'Sin pedidos activos',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final order = pendingOrders[index];
                            return OrderPanelCard(
                              order: order,
                              onStatusChange: (newStatus) {
                                context
                                    .read<VendorPanelCubit>()
                                    .updateOrderStatus(order.id, newStatus);
                              },
                            );
                          },
                          childCount: pendingOrders.length,
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 80)),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    context.push('/vendor-panel/menu', extra: vendor.id),
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                child: const Icon(Icons.restaurant_menu),
              ),
            ),
        };
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    String storeName,
    bool isOpen,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        storeName,
        style: const TextStyle(
          color: Color(0xFF1A1A1A),
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: [
        Row(
          children: [
            Text(
              isOpen ? 'Abierto' : 'Cerrado',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isOpen ? const Color(0xFF4CAF50) : const Color(0xFFD62828),
              ),
            ),
            Switch(
              value: isOpen,
              activeThumbColor: const Color(0xFF4CAF50),
              inactiveThumbColor: const Color(0xFFD62828),
              onChanged: (_) =>
                  context.read<VendorPanelCubit>().toggleStoreOpen(),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int totalOrders;
  final int pendingCount;
  final double rating;

  const _StatsRow({
    required this.totalOrders,
    required this.pendingCount,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              label: 'Pedidos Hoy',
              value: totalOrders.toString(),
              icon: Icons.receipt_long_outlined,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              label: 'Pendientes',
              value: pendingCount.toString(),
              icon: Icons.pending_outlined,
              valueColor: pendingCount > 0 ? const Color(0xFFFF6B35) : null,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              label: 'Calificación',
              value: rating.toStringAsFixed(1),
              icon: Icons.star_outlined,
              valueColor: const Color(0xFFFFA726),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFFF6B35), size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: valueColor ?? const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF757575),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
