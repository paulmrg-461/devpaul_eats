import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:devpaul_eats/features/auth/presentation/pages/login_page.dart';
import 'package:devpaul_eats/features/auth/presentation/pages/profile_page.dart';
import 'package:devpaul_eats/features/auth/presentation/pages/register_page.dart';
import 'package:devpaul_eats/features/auth/presentation/pages/splash_page.dart';
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:devpaul_eats/features/cart/presentation/pages/cart_page.dart';
import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';
import 'package:devpaul_eats/features/menu/presentation/pages/item_customizer_page.dart';
import 'package:devpaul_eats/features/orders/domain/entities/order.dart';
import 'package:devpaul_eats/features/orders/presentation/cubit/order_cubit.dart';
import 'package:devpaul_eats/features/orders/presentation/pages/checkout_page.dart';
import 'package:devpaul_eats/features/orders/presentation/pages/order_success_page.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/pages/menu_manager_page.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/pages/vendor_panel_page.dart';
import 'package:devpaul_eats/features/vendors/presentation/pages/vendor_detail_page.dart';
import 'package:devpaul_eats/features/vendors/presentation/pages/vendors_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// ---------------------------------------------------------------------------
// Route name constants
// ---------------------------------------------------------------------------
abstract final class AppRoutes {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String vendors = 'vendors';
  static const String cart = 'cart';
  static const String profile = 'profile';
  static const String vendorDetail = 'vendor-detail';
  static const String itemCustomizer = 'item-customizer';
  static const String checkout = 'checkout';
  static const String orderSuccess = 'order-success';
  static const String vendorPanel = 'vendor-panel';
  static const String menuManager = 'menu-manager';
}

// ---------------------------------------------------------------------------
// Shell scaffold with bottom navigation
// ---------------------------------------------------------------------------
class _HomeShell extends StatelessWidget {
  const _HomeShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) =>
            navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront),
            label: 'Vendedores',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Router definition
// ---------------------------------------------------------------------------
abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // Splash
      GoRoute(
        path: '/',
        name: AppRoutes.splash,
        builder: (context, state) => BlocProvider<AuthCubit>(
          create: (_) => GetIt.instance<AuthCubit>(),
          child: const SplashPage(),
        ),
      ),

      // Auth
      GoRoute(
        path: '/login',
        name: AppRoutes.login,
        builder: (context, state) => BlocProvider<AuthCubit>(
          create: (_) => GetIt.instance<AuthCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: AppRoutes.register,
        builder: (context, state) => BlocProvider<AuthCubit>(
          create: (_) => GetIt.instance<AuthCubit>(),
          child: const RegisterPage(),
        ),
      ),

      // Home — shell with bottom nav
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MultiBlocProvider(
          providers: [
            BlocProvider<CartCubit>(
              create: (_) => GetIt.instance<CartCubit>(),
            ),
          ],
          child: _HomeShell(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/vendors',
                name: AppRoutes.vendors,
                builder: (context, state) => const VendorsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/cart',
                name: AppRoutes.cart,
                builder: (context, state) => const CartPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/profile',
                name: AppRoutes.profile,
                builder: (context, state) => BlocProvider<AuthCubit>(
                  create: (_) =>
                      GetIt.instance<AuthCubit>()..checkAuthStatus(),
                  child: const ProfilePage(),
                ),
              ),
            ],
          ),
        ],
      ),

      // Vendor detail
      GoRoute(
        path: '/vendor/:vendorId',
        name: AppRoutes.vendorDetail,
        builder: (context, state) {
          final vendorId = state.pathParameters['vendorId']!;
          return VendorDetailPage(vendorId: vendorId);
        },
      ),

      // Item customizer — MenuItem passed as extra
      GoRoute(
        path: '/item/:itemId',
        name: AppRoutes.itemCustomizer,
        builder: (context, state) {
          final menuItem = state.extra as MenuItem;
          return ItemCustomizerPage(menuItem: menuItem);
        },
      ),

      // Checkout
      GoRoute(
        path: '/checkout',
        name: AppRoutes.checkout,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<OrderCubit>(
              create: (_) => GetIt.instance<OrderCubit>(),
            ),
            BlocProvider<AuthCubit>(
              create: (_) => GetIt.instance<AuthCubit>()..checkAuthStatus(),
            ),
          ],
          child: const CheckoutPage(),
        ),
      ),

      // Order success
      GoRoute(
        path: '/order-success',
        name: AppRoutes.orderSuccess,
        builder: (context, state) {
          final order = state.extra as Order;
          return OrderSuccessPage(order: order);
        },
      ),

      // Vendor panel
      GoRoute(
        path: '/vendor-panel',
        name: AppRoutes.vendorPanel,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (_) =>
                  GetIt.instance<AuthCubit>()..checkAuthStatus(),
            ),
            BlocProvider<VendorPanelCubit>(
              create: (_) => GetIt.instance<VendorPanelCubit>(),
            ),
          ],
          child: const VendorPanelPage(),
        ),
        routes: [
          GoRoute(
            path: 'menu',
            name: AppRoutes.menuManager,
            builder: (context, state) {
              final vendorId = state.extra as String? ?? '';
              return BlocProvider<MenuManagerCubit>(
                create: (_) => GetIt.instance<MenuManagerCubit>(),
                child: MenuManagerPage(vendorId: vendorId),
              );
            },
          ),
        ],
      ),
    ],
  );
}
