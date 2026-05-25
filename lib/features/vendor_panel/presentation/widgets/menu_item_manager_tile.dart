import 'package:cached_network_image/cached_network_image.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/widgets/add_menu_item_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemManagerTile extends StatelessWidget {
  final MenuItem item;
  final String vendorId;

  const MenuItemManagerTile({
    super.key,
    required this.item,
    required this.vendorId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildThumbnail(),
            const SizedBox(width: 12),
            Expanded(child: _buildInfo()),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: item.photoUrl != null
          ? CachedNetworkImage(
              imageUrl: item.photoUrl!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: (_, __) => const _PlaceholderBox(),
              errorWidget: (_, __, ___) => const _PlaceholderBox(),
            )
          : const _PlaceholderBox(),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF1A1A1A),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          item.category,
          style: const TextStyle(fontSize: 11, color: Color(0xFF757575)),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${item.basePrice.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFFFF6B35),
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: item.isAvailable,
          activeColor: const Color(0xFF4CAF50),
          onChanged: (_) {
            context.read<MenuManagerCubit>().toggleItemAvailability(item);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _showEditSheet(context),
              child: const Icon(
                Icons.edit_outlined,
                size: 20,
                color: Color(0xFF757575),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _showDeleteDialog(context),
              child: const Icon(
                Icons.delete_outline,
                size: 20,
                color: Color(0xFFD62828),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showEditSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<MenuManagerCubit>(),
        child: AddMenuItemBottomSheet(
          vendorId: vendorId,
          existingItem: item,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar ítem'),
        content: Text('¿Eliminar "${item.name}"? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<MenuManagerCubit>().deleteItem(vendorId, item.id);
            },
            child: const Text('Eliminar', style: TextStyle(color: Color(0xFFD62828))),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderBox extends StatelessWidget {
  const _PlaceholderBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: const Color(0xFFFFF8F0),
      child: const Icon(Icons.fastfood_outlined, size: 24, color: Color(0xFFFF6B35)),
    );
  }
}
