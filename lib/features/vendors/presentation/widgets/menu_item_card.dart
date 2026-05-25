import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppColors.paddingM,
        vertical: AppColors.paddingS / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.radiusS),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          _ItemImage(photoUrl: item.photoUrl),
          const SizedBox(width: AppColors.paddingS),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppColors.paddingS,
                horizontal: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: AppTextStyles.bodyBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.description,
                    style: AppTextStyles.caption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${item.basePrice.toStringAsFixed(2)}',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppColors.paddingS),
            child: ElevatedButton(
              onPressed: () => context.push('/item/${item.id}', extra: item),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppColors.radiusS),
                ),
              ),
              child: Text(
                'Personalizar',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemImage extends StatelessWidget {
  final String? photoUrl;

  const _ItemImage({this.photoUrl});

  @override
  Widget build(BuildContext context) {
    if (photoUrl == null || photoUrl!.isEmpty) {
      return _Fallback();
    }
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppColors.radiusS),
        bottomLeft: Radius.circular(AppColors.radiusS),
      ),
      child: CachedNetworkImage(
        imageUrl: photoUrl!,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80,
            height: 80,
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => _Fallback(),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppColors.radiusS),
        bottomLeft: Radius.circular(AppColors.radiusS),
      ),
      child: Container(
        width: 80,
        height: 80,
        color: AppColors.background,
        child: const Icon(
          Icons.fastfood_outlined,
          size: 32,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
