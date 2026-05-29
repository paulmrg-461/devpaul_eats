import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;

  const VendorCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/vendor/${vendor.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.radiusM),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CoverImage(coverPhotoUrl: vendor.coverPhotoUrl),
            Padding(
              padding: const EdgeInsets.all(AppColors.paddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendor.storeName,
                    style: AppTextStyles.bodyBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _CategoryChip(category: vendor.category),
                      const Spacer(),
                      _OpenBadge(isOpen: vendor.isOpen),
                    ],
                  ),
                  const SizedBox(height: 4),
                  _RatingRow(rating: vendor.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  final String? coverPhotoUrl;

  const _CoverImage({this.coverPhotoUrl});

  @override
  Widget build(BuildContext context) {
    if (coverPhotoUrl == null || coverPhotoUrl!.isEmpty) {
      return _Fallback();
    }
    return CachedNetworkImage(
      imageUrl: coverPhotoUrl!,
      height: 120,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 120,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => _Fallback(),
    );
  }
}

class _Fallback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: AppColors.background,
      child: const Icon(
        Icons.restaurant,
        size: 40,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final VendorCategory category;

  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _label(category),
        style: AppTextStyles.caption.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _label(VendorCategory c) {
    switch (c) {
      case VendorCategory.burgers:
        return 'Burgers';
      case VendorCategory.tacos:
        return 'Tacos';
      case VendorCategory.pizza:
        return 'Pizza';
      case VendorCategory.bowls:
        return 'Bowls';
      case VendorCategory.pasta:
        return 'Pasta';
      case VendorCategory.other:
        return 'Otros';
    }
  }
}

class _OpenBadge extends StatelessWidget {
  final bool isOpen;

  const _OpenBadge({required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isOpen
            ? const Color(0xFF2E7D32).withValues(alpha: 0.12)
            : AppColors.error.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isOpen ? 'Abierto' : 'Cerrado',
        style: AppTextStyles.caption.copyWith(
          color: isOpen ? const Color(0xFF2E7D32) : AppColors.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  final double rating;

  const _RatingRow({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Color(0xFFFFA726), size: 16),
        const SizedBox(width: 2),
        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
