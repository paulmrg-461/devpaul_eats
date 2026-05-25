import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';

class PriceSummaryWidget extends StatelessWidget {
  final MenuItem menuItem;
  final Map<String, int> selectedGrams;
  final double totalPrice;
  final VoidCallback onAddToCart;

  const PriceSummaryWidget({
    super.key,
    required this.menuItem,
    required this.selectedGrams,
    required this.totalPrice,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppColors.radiusL),
          topRight: Radius.circular(AppColors.radiusL),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppColors.paddingL,
            AppColors.paddingM,
            AppColors.paddingL,
            AppColors.paddingM,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle visual
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Breakdown
              _PriceBreakdown(
                menuItem: menuItem,
                selectedGrams: selectedGrams,
              ),
              const Divider(height: 20, color: AppColors.divider),
              // Total row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: AppTextStyles.h2Bold),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.3),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      key: ValueKey(totalPrice.toStringAsFixed(2)),
                      style: AppTextStyles.h1Bold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Add to cart button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: onAddToCart,
                  icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                  label: Text(
                    'Agregar al carrito',
                    style: AppTextStyles.bodyBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppColors.radiusM),
                    ),
                  ),
                )
                    .animate()
                    .shimmer(
                      duration: 2000.ms,
                      delay: 800.ms,
                      color: Colors.white24,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceBreakdown extends StatelessWidget {
  final MenuItem menuItem;
  final Map<String, int> selectedGrams;

  const _PriceBreakdown({
    required this.menuItem,
    required this.selectedGrams,
  });

  @override
  Widget build(BuildContext context) {
    final activeRows = <Widget>[
      _BreakdownRow(
        label: 'Precio base',
        value: '\$${menuItem.basePrice.toStringAsFixed(2)}',
        isBase: true,
      ),
    ];

    for (final topping in menuItem.toppings) {
      if (!topping.isAvailable) continue;
      final grams = selectedGrams[topping.id] ?? topping.minGrams;
      if (grams <= 0) continue;
      final unitLabel = topping.unit == ToppingUnit.ml ? 'ml' : 'g';
      final subtotal = grams * topping.pricePerGram;
      activeRows.add(
        _BreakdownRow(
          label: '${topping.name}: $grams$unitLabel',
          value: '\$${subtotal.toStringAsFixed(2)}',
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: activeRows,
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBase;

  const _BreakdownRow({
    required this.label,
    required this.value,
    this.isBase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBase
                ? AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)
                : AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              value,
              key: ValueKey(value),
              style: AppTextStyles.body.copyWith(
                color: isBase ? AppColors.textPrimary : AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
