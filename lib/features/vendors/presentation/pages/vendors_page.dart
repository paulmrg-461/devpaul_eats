import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devpaul_eats/core/di/injection.dart';
import 'package:devpaul_eats/core/theme/app_colors.dart';
import 'package:devpaul_eats/core/theme/app_text_styles.dart';
import 'package:devpaul_eats/features/vendors/domain/entities/vendor.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_list_cubit.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_list_state.dart';
import 'package:devpaul_eats/features/vendors/presentation/widgets/vendor_card.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VendorListCubit>()..loadVendors(),
      child: const _VendorsView(),
    );
  }
}

class _VendorsView extends StatefulWidget {
  const _VendorsView();

  @override
  State<_VendorsView> createState() => _VendorsViewState();
}

class _VendorsViewState extends State<_VendorsView> {
  final TextEditingController _searchController = TextEditingController();
  VendorCategory? _selectedCategory;

  static const _categories = [
    null,
    VendorCategory.burgers,
    VendorCategory.tacos,
    VendorCategory.pizza,
    VendorCategory.bowls,
    VendorCategory.pasta,
    VendorCategory.other,
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _categoryLabel(VendorCategory? c) {
    if (c == null) return 'Todos';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          context.read<VendorListCubit>().loadVendors();
        },
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(context),
            _buildCategoryFilter(context),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.primary,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.accent],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppColors.paddingL,
                AppColors.paddingM,
                AppColors.paddingL,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Hola! 👋',
                    style: AppTextStyles.h2Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '¿Qué se te antoja hoy?',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        collapseMode: CollapseMode.parallax,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            AppColors.paddingM,
            0,
            AppColors.paddingM,
            AppColors.paddingS,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppColors.radiusS),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (q) => context.read<VendorListCubit>().search(q),
            decoration: InputDecoration(
              hintText: 'Buscar restaurantes...',
              hintStyle: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.textSecondary,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: AppColors.paddingM,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildCategoryFilter(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 48,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: AppColors.paddingM,
            vertical: 6,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final cat = _categories[index];
            final isSelected = _selectedCategory == cat;
            return GestureDetector(
              onTap: () {
                setState(() => _selectedCategory = cat);
                context.read<VendorListCubit>().filterByCategory(cat);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppColors.paddingM,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color:
                        isSelected ? AppColors.primary : AppColors.divider,
                  ),
                ),
                child: Text(
                  _categoryLabel(cat),
                  style: AppTextStyles.caption.copyWith(
                    color: isSelected
                        ? Colors.white
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<VendorListCubit, VendorListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          ),
          loaded: (vendors, filtered) {
            if (filtered.isEmpty) {
              return SliverFillRemaining(
                child: _EmptyState(hasSearch: _searchController.text.isNotEmpty),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(AppColors.paddingM),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppColors.paddingM,
                  mainAxisSpacing: AppColors.paddingM,
                  childAspectRatio: 0.78,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => VendorCard(vendor: filtered[index]),
                  childCount: filtered.length,
                ),
              ),
            );
          },
          error: (message) => SliverFillRemaining(
            child: _ErrorState(
              message: message,
              onRetry: () => context.read<VendorListCubit>().loadVendors(),
            ),
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool hasSearch;

  const _EmptyState({required this.hasSearch});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.storefront_outlined,
            size: 72,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: AppColors.paddingM),
          Text(
            hasSearch
                ? 'Sin resultados para tu búsqueda'
                : 'No hay restaurantes disponibles',
            style: AppTextStyles.h3Bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            hasSearch
                ? 'Prueba con otro término o categoría'
                : 'Vuelve pronto, pronto habrá más opciones',
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: AppColors.paddingM),
          Text(
            'Algo salió mal',
            style: AppTextStyles.h3Bold,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppColors.paddingL),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Reintentar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppColors.radiusS),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
