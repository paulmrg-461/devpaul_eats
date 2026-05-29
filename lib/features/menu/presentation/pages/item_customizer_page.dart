import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/presentation/cubit/item_customizer_cubit.dart';
import 'package:devpaul_eats/features/menu/presentation/cubit/item_customizer_state.dart';
import 'package:devpaul_eats/features/menu/presentation/widgets/price_summary_widget.dart';
import 'package:devpaul_eats/features/menu/presentation/widgets/topping_slider_card.dart';

class ItemCustomizerPage extends StatelessWidget {
  final MenuItem menuItem;

  const ItemCustomizerPage({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemCustomizerCubit()..loadItem(menuItem),
      child: const _ItemCustomizerView(),
    );
  }
}

class _ItemCustomizerView extends StatelessWidget {
  const _ItemCustomizerView();

  Widget _buildBody(ItemCustomizerState state) {
    if (state is ItemCustomizerReady) {
      return _ReadyBody(state: state);
    } else if (state is ItemCustomizerError) {
      return _ErrorBody(message: state.message);
    }
    return const _LoadingBody();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCustomizerCubit, ItemCustomizerState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: _buildBody(state),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Ready state body
// ---------------------------------------------------------------------------

class _ReadyBody extends StatelessWidget {
  final ItemCustomizerReady state;

  const _ReadyBody({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemCustomizerCubit>();
    final availableToppings =
        state.menuItem.toppings.where((t) => t.isAvailable).toList();

    return Stack(
      children: [
        // Scrollable content
        CustomScrollView(
          slivers: [
            // Hero image app bar
            SliverAppBar(
              expandedHeight: 260,
              pinned: true,
              backgroundColor: AppColors.primary,
              leading: _BackButton(),
              flexibleSpace: FlexibleSpaceBar(
                background: _HeroImage(photoUrl: state.menuItem.photoUrl),
                collapseMode: CollapseMode.parallax,
              ),
            ),

            // Item info card
            SliverToBoxAdapter(
              child: _ItemInfoCard(menuItem: state.menuItem)
                  .animate()
                  .fadeIn(duration: 350.ms, delay: 100.ms)
                  .slideY(begin: 0.1, end: 0, duration: 350.ms),
            ),

            // Toppings section
            if (availableToppings.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: _ToppingsSectionHeader()
                    .animate()
                    .fadeIn(duration: 300.ms, delay: 200.ms),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final topping = availableToppings[index];
                    return ToppingSliderCard(
                      topping: topping,
                      currentGrams: state.selectedGrams[topping.id] ?? topping.minGrams,
                      onGramsChanged: (grams) =>
                          cubit.updateToppingGrams(topping.id, grams),
                    );
                  },
                  childCount: availableToppings.length,
                ),
              ),
            ],

            // Bottom spacing so content isn't hidden behind summary
            const SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        ),

        // Fixed bottom price summary
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: PriceSummaryWidget(
            menuItem: state.menuItem,
            selectedGrams: state.selectedGrams,
            totalPrice: state.totalPrice,
            onAddToCart: () {
              final cartItem = cubit.buildCartItem();
              if (cartItem != null) {
                Navigator.of(context).pop(cartItem);
              }
            },
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hero image header
// ---------------------------------------------------------------------------

class _HeroImage extends StatelessWidget {
  final String? photoUrl;

  const _HeroImage({this.photoUrl});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (photoUrl == null || photoUrl!.isEmpty) {
      imageWidget = Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.accent],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.fastfood_rounded,
            size: 80,
            color: Colors.white54,
          ),
        ),
      );
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: photoUrl!,
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
            child: Icon(
              Icons.fastfood_rounded,
              size: 80,
              color: Colors.white54,
            ),
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        imageWidget,
        // Gradient overlay at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.45),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Back button
// ---------------------------------------------------------------------------

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(AppColors.radiusS),
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Item info card
// ---------------------------------------------------------------------------

class _ItemInfoCard extends StatelessWidget {
  final MenuItem menuItem;

  const _ItemInfoCard({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppColors.paddingM),
      padding: const EdgeInsets.all(AppColors.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            menuItem.name,
            style: AppTextStyles.h1Bold,
          ),
          const SizedBox(height: 8),
          // Description
          if (menuItem.description.isNotEmpty) ...[
            Text(
              menuItem.description,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
          ],
          // Base price badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppColors.radiusS),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.local_offer_outlined,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Precio base: \$${menuItem.basePrice.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Toppings section header
// ---------------------------------------------------------------------------

class _ToppingsSectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppColors.paddingM,
        AppColors.paddingM,
        AppColors.paddingM,
        AppColors.paddingS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personaliza tu orden',
            style: AppTextStyles.h2Bold,
          ),
          const SizedBox(height: 4),
          Text(
            'Ajusta las cantidades a tu gusto',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Loading body
// ---------------------------------------------------------------------------

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error body
// ---------------------------------------------------------------------------

class _ErrorBody extends StatelessWidget {
  final String message;

  const _ErrorBody({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        leading: _BackButton(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppColors.paddingL),
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
              Text(
                message,
                style:
                    AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
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
      ),
    );
  }
}
