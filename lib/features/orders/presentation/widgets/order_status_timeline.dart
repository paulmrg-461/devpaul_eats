import 'package:flutter/material.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';

class OrderStatusTimeline extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderStatusTimeline({super.key, required this.currentStatus});

  static const _steps = [
    (OrderStatus.pending, 'Pendiente', Icons.schedule),
    (OrderStatus.accepted, 'Aceptado', Icons.check_circle_outline),
    (OrderStatus.preparing, 'Preparando', Icons.restaurant),
    (OrderStatus.ready, 'Listo', Icons.done_all),
    (OrderStatus.delivered, 'Entregado', Icons.delivery_dining),
  ];

  int get _currentIndex =>
      _steps.indexWhere((s) => s.$1 == currentStatus);

  @override
  Widget build(BuildContext context) {
    final activeIdx = _currentIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Estado del pedido',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(_steps.length, (i) {
          final (_, label, icon) = _steps[i];
          final isCompleted = i < activeIdx;
          final isCurrent = i == activeIdx;
          final isFuture = i > activeIdx;

          Color circleColor;
          Color lineColor;
          if (isCompleted) {
            circleColor = const Color(0xFF4CAF50);
            lineColor = const Color(0xFF4CAF50);
          } else if (isCurrent) {
            circleColor = const Color(0xFFFF6B35);
            lineColor = const Color(0xFFBDBDBD);
          } else {
            circleColor = const Color(0xFFBDBDBD);
            lineColor = const Color(0xFFBDBDBD);
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isFuture ? Colors.transparent : circleColor,
                      shape: BoxShape.circle,
                      border: isFuture
                          ? Border.all(color: circleColor, width: 2)
                          : null,
                    ),
                    child: Icon(
                      icon,
                      size: 16,
                      color: isFuture ? circleColor : Colors.white,
                    ),
                  ),
                  if (i < _steps.length - 1)
                    Container(
                      width: 2,
                      height: 32,
                      color: lineColor,
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight:
                        isCurrent ? FontWeight.w700 : FontWeight.normal,
                    color: isFuture
                        ? const Color(0xFFBDBDBD)
                        : const Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
