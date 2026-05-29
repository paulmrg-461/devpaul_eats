import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/menu/domain/entities/topping.dart';

class ToppingSliderCard extends StatelessWidget {
  final Topping topping;
  final int currentGrams;
  final ValueChanged<int> onGramsChanged;

  const ToppingSliderCard({
    super.key,
    required this.topping,
    required this.currentGrams,
    required this.onGramsChanged,
  });

  bool get _isActive => currentGrams > topping.minGrams;

  int get _step {
    final range = topping.maxGrams - topping.minGrams;
    return range <= 50 ? 5 : 10;
  }

  String get _unitLabel =>
      topping.unit == ToppingUnit.ml ? 'ml' : 'g';

  double get _subtotal => currentGrams * topping.pricePerGram;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(
        horizontal: AppColors.paddingM,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.radiusM),
        border: Border.all(
          color: _isActive
              ? AppColors.primary.withValues(alpha: 0.6)
              : AppColors.divider,
          width: _isActive ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: _isActive
                ? AppColors.primary.withValues(alpha: 0.08)
                : AppColors.shadow,
            blurRadius: _isActive ? 8 : 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppColors.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              topping: topping,
              currentGrams: currentGrams,
              unitLabel: _unitLabel,
              subtotal: _subtotal,
            ),
            const SizedBox(height: 12),
            _SliderRow(
              topping: topping,
              currentGrams: currentGrams,
              step: _step,
              unitLabel: _unitLabel,
              onGramsChanged: onGramsChanged,
            ),
          ],
        ),
      ),
    )
        .animate(key: ValueKey(topping.id))
        .fadeIn(duration: 300.ms)
        .slideX(begin: 0.05, end: 0, duration: 300.ms, curve: Curves.easeOut);
  }
}

class _Header extends StatelessWidget {
  final Topping topping;
  final int currentGrams;
  final String unitLabel;
  final double subtotal;

  const _Header({
    required this.topping,
    required this.currentGrams,
    required this.unitLabel,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(topping.name, style: AppTextStyles.bodyBold),
              const SizedBox(height: 2),
              Text(
                '\$${topping.pricePerGram.toStringAsFixed(2)}/$unitLabel',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Current grams badge
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: Container(
            key: ValueKey(currentGrams),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: currentGrams > topping.minGrams
                  ? AppColors.primary
                  : AppColors.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$currentGrams$unitLabel',
              style: AppTextStyles.captionBold.copyWith(
                color: currentGrams > topping.minGrams
                    ? Colors.white
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Subtotal
        Text(
          '= \$${subtotal.toStringAsFixed(2)}',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SliderRow extends StatelessWidget {
  final Topping topping;
  final int currentGrams;
  final int step;
  final String unitLabel;
  final ValueChanged<int> onGramsChanged;

  const _SliderRow({
    required this.topping,
    required this.currentGrams,
    required this.step,
    required this.unitLabel,
    required this.onGramsChanged,
  });

  void _decrement() {
    final newVal = (currentGrams - step).clamp(topping.minGrams, topping.maxGrams);
    onGramsChanged(newVal);
  }

  void _increment() {
    final newVal = (currentGrams + step).clamp(topping.minGrams, topping.maxGrams);
    onGramsChanged(newVal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircleButton(
          icon: Icons.remove,
          onPressed: currentGrams > topping.minGrams ? _decrement : null,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.primary.withValues(alpha: 0.15),
              thumbColor: AppColors.primary,
              overlayColor: AppColors.primary.withValues(alpha: 0.12),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            ),
            child: Slider(
              value: currentGrams.toDouble(),
              min: topping.minGrams.toDouble(),
              max: topping.maxGrams.toDouble(),
              divisions: topping.maxGrams - topping.minGrams > 0
                  ? topping.maxGrams - topping.minGrams
                  : null,
              onChanged: (val) => onGramsChanged(val.round()),
            ),
          ),
        ),
        _CircleButton(
          icon: Icons.add,
          onPressed: currentGrams < topping.maxGrams ? _increment : null,
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CircleButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEnabled
              ? AppColors.primary.withValues(alpha: 0.12)
              : AppColors.divider,
        ),
        child: Icon(
          icon,
          size: 16,
          color: isEnabled ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
    );
  }
}
