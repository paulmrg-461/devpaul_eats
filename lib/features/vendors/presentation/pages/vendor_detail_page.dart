import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:devpaul_eats/core/di/injection.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_detail_cubit.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_detail_state.dart';
import 'package:devpaul_eats/features/vendors/presentation/widgets/menu_item_card.dart';

class VendorDetailPage extends StatelessWidget {
  final String vendorId;

  const VendorDetailPage({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VendorDetailCubit>()..loadVendor(vendorId),
      child: const _VendorDetailView(),
    );
  }
}

class _VendorDetailView extends StatelessWidget {
  const _VendorDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorDetailCubit, VendorDetailState>(
      builder: (context, state) {
        return state.when(
          initial: () => _loadingScaffold(),
          loading: () => _loadingScaffold(),
          loaded: (vendor, menuItems) =>
              _LoadedView(vendor: vendor, menuItems: menuItems),
          error: (message) => _ErrorView(message: message),
        );
      },
    );
  }

  Widget _loadingScaffold() {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final Vendor vendor;
  final List<MenuItem> menuItems;

  const _LoadedView({required this.vendor, required this.menuItems});

  Map<String, List<MenuItem>> _groupByCategory(List<MenuItem> items) {
    final map = <String, List<MenuItem>>{};
    for (final item in items) {
      map.putIfAbsent(item.category, () => []).add(item);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupByCategory(menuItems);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _VendorSliverAppBar(vendor: vendor),
          _VendorInfoSection(vendor: vendor),
          if (menuItems.isEmpty)
            const SliverFillRemaining(
              child: _EmptyMenuState(),
            )
          else
            _MenuSection(grouped: grouped),
        ],
      ),
    );
  }
}

class _VendorSliverAppBar extends StatelessWidget {
  final Vendor vendor;

  const _VendorSliverAppBar({required this.vendor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(AppColors.radiusS),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: _HeaderImage(coverPhotoUrl: vendor.coverPhotoUrl),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final String? coverPhotoUrl;

  const _HeaderImage({this.coverPhotoUrl});

  @override
  Widget build(BuildContext context) {
    if (coverPhotoUrl == null || coverPhotoUrl!.isEmpty) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.accent],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.restaurant_menu,
            size: 72,
            color: Colors.white54,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: coverPhotoUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(color: Colors.white),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.accent],
          ),
        ),
        child: const Center(
          child: Icon(Icons.restaurant_menu, size: 72, color: Colors.white54),
        ),
      ),
    );
  }
}

class _VendorInfoSection extends StatelessWidget {
  final Vendor vendor;

  const _VendorInfoSection({required this.vendor});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.surface,
        padding: const EdgeInsets.all(AppColors.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vendor.storeName, style: AppTextStyles.h1Bold),
            const SizedBox(height: 8),
            Text(
              vendor.description,
              style: AppTextStyles.body
                  .copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _InfoChip(
                  icon: Icons.category_outlined,
                  label: _categoryLabel(vendor.category),
                  color: AppColors.primary,
                ),
                _InfoChip(
                  icon: Icons.star_rounded,
                  label: vendor.rating.toStringAsFixed(1),
                  color: const Color(0xFFFFA726),
                ),
                _InfoChip(
                  icon: vendor.isOpen
                      ? Icons.check_circle_outline
                      : Icons.cancel_outlined,
                  label: vendor.isOpen ? 'Abierto' : 'Cerrado',
                  color: vendor.isOpen
                      ? const Color(0xFF2E7D32)
                      : AppColors.error,
                ),
                _InfoChip(
                  icon: Icons.receipt_long_outlined,
                  label: '${vendor.totalOrders} pedidos',
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _categoryLabel(VendorCategory c) {
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

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final Map<String, List<MenuItem>> grouped;

  const _MenuSection({required this.grouped});

  @override
  Widget build(BuildContext context) {
    final categories = grouped.keys.toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final category = categories[index];
          final items = grouped[category]!;
          return _CategorySection(category: category, items: items);
        },
        childCount: categories.length,
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String category;
  final List<MenuItem> items;

  const _CategorySection({required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppColors.paddingM,
            AppColors.paddingM,
            AppColors.paddingM,
            AppColors.paddingS,
          ),
          child: Text(
            category,
            style: AppTextStyles.h3Bold,
          ),
        ),
        ...items.map((item) => MenuItemCard(item: item)),
        const SizedBox(height: AppColors.paddingS),
      ],
    );
  }
}

class _EmptyMenuState extends StatelessWidget {
  const _EmptyMenuState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.menu_book_outlined,
            size: 64,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: AppColors.paddingM),
          Text(
            'Sin platillos por ahora',
            style: AppTextStyles.h3Bold,
          ),
          const SizedBox(height: 8),
          Text(
            'Este restaurante aún no tiene menú disponible',
            style:
                AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppColors.paddingM),
            Text('Error al cargar', style: AppTextStyles.h3Bold),
            const SizedBox(height: 8),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppColors.paddingL),
              child: Text(
                message,
                style:
                    AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppColors.paddingL),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppColors.radiusS),
                ),
              ),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
