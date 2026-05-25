import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_state.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/widgets/add_menu_item_bottom_sheet.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/widgets/menu_item_manager_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuManagerPage extends StatefulWidget {
  /// The vendorId is passed from VendorPanelPage via GoRouter extra.
  final String vendorId;

  const MenuManagerPage({super.key, required this.vendorId});

  @override
  State<MenuManagerPage> createState() => _MenuManagerPageState();
}

class _MenuManagerPageState extends State<MenuManagerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<MenuManagerCubit>().loadMenu(widget.vendorId),
    );
  }

  void _showAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<MenuManagerCubit>(),
        child: AddMenuItemBottomSheet(vendorId: widget.vendorId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Gestión de Menú',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFFFF6B35), size: 28),
            onPressed: _showAddSheet,
          ),
        ],
      ),
      body: BlocBuilder<MenuManagerCubit, MenuManagerState>(
        builder: (context, state) {
          return switch (state) {
            MenuManagerInitial() || MenuManagerLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MenuManagerError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: Color(0xFFD62828)),
                    const SizedBox(height: 12),
                    Text(message, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<MenuManagerCubit>()
                          .loadMenu(widget.vendorId),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            MenuManagerLoaded(:final items) when items.isEmpty => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.restaurant_menu_outlined,
                        size: 64, color: Color(0xFF757575)),
                    const SizedBox(height: 12),
                    const Text(
                      'Sin ítems en el menú',
                      style:
                          TextStyle(fontSize: 16, color: Color(0xFF757575)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _showAddSheet,
                      icon: const Icon(Icons.add),
                      label: const Text('Agregar primer ítem'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B35),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            MenuManagerLoaded(:final items) => ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    key: Key(item.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 24),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD62828),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (_) async {
                      return await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Eliminar ítem'),
                          content: Text(
                            '¿Eliminar "${item.name}"? Esta acción no se puede deshacer.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(false),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(true),
                              child: const Text(
                                'Eliminar',
                                style: TextStyle(color: Color(0xFFD62828)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (_) {
                      context
                          .read<MenuManagerCubit>()
                          .deleteItem(widget.vendorId, item.id);
                    },
                    child: MenuItemManagerTile(
                      item: item,
                      vendorId: widget.vendorId,
                    ),
                  );
                },
              ),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSheet,
        backgroundColor: const Color(0xFFFF6B35),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
