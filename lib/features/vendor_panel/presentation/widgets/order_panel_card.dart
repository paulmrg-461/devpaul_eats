import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:flutter/material.dart';

class OrderPanelCard extends StatelessWidget {
  final Order order;
  final ValueChanged<OrderStatus> onStatusChange;

  const OrderPanelCard({
    super.key,
    required this.order,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildItemsList(),
            const SizedBox(height: 12),
            if (order.note != null && order.note!.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(Icons.note_outlined, size: 14, color: Color(0xFF757575)),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      order.note!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757575),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            _buildTotalRow(),
            const SizedBox(height: 12),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido #${order.id.substring(0, order.id.length >= 8 ? 8 : order.id.length)}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _formatTime(order.createdAt),
              style: const TextStyle(fontSize: 12, color: Color(0xFF757575)),
            ),
          ],
        ),
        _StatusChip(status: order.status),
      ],
    );
  }

  Widget _buildItemsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: order.items.map((item) {
        final toppingsText = item.selectedToppings.isNotEmpty
            ? item.selectedToppings.map((t) => '${t.grams}g ${t.name}').join(', ')
            : null;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ${item.menuItemName}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              if (toppingsText != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    toppingsText,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Text(
          '\$${order.total.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: Color(0xFFFF6B35),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    switch (order.status) {
      case OrderStatus.pending:
        return Row(
          children: [
            Expanded(
              child: _ActionButton(
                label: 'Aceptar',
                color: const Color(0xFF4CAF50),
                onTap: () => onStatusChange(OrderStatus.accepted),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _ActionButton(
                label: 'Rechazar',
                color: const Color(0xFFD62828),
                onTap: () => onStatusChange(OrderStatus.cancelled),
              ),
            ),
          ],
        );
      case OrderStatus.accepted:
        return _ActionButton(
          label: 'Marcar Preparando',
          color: const Color(0xFFFF6B35),
          onTap: () => onStatusChange(OrderStatus.preparing),
          fullWidth: true,
        );
      case OrderStatus.preparing:
        return _ActionButton(
          label: 'Marcar Listo',
          color: const Color(0xFF1565C0),
          onTap: () => onStatusChange(OrderStatus.ready),
          fullWidth: true,
        );
      case OrderStatus.ready:
        return _ActionButton(
          label: 'Marcar Entregado',
          color: const Color(0xFF4CAF50),
          onTap: () => onStatusChange(OrderStatus.delivered),
          fullWidth: true,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '$hour:$min';
  }
}

class _StatusChip extends StatelessWidget {
  final OrderStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      OrderStatus.pending => ('Pendiente', const Color(0xFFFFA726)),
      OrderStatus.accepted => ('Aceptado', const Color(0xFF1565C0)),
      OrderStatus.preparing => ('Preparando', const Color(0xFFFF6B35)),
      OrderStatus.ready => ('Listo', const Color(0xFF4CAF50)),
      OrderStatus.delivered => ('Entregado', const Color(0xFF757575)),
      OrderStatus.cancelled => ('Cancelado', const Color(0xFFD62828)),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool fullWidth;

  const _ActionButton({
    required this.label,
    required this.color,
    required this.onTap,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
