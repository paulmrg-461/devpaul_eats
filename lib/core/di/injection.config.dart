// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:devpaul_eats/core/services/storage_service.dart' as _i1003;
import 'package:devpaul_eats/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i874;
import 'package:devpaul_eats/features/auth/data/repositories/auth_repository_impl.dart'
    as _i402;
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart'
    as _i646;
import 'package:devpaul_eats/features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i1044;
import 'package:devpaul_eats/features/auth/domain/usecases/sign_in_usecase.dart'
    as _i81;
import 'package:devpaul_eats/features/auth/domain/usecases/sign_out_usecase.dart'
    as _i164;
import 'package:devpaul_eats/features/auth/domain/usecases/sign_up_usecase.dart'
    as _i199;
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart'
    as _i935;
import 'package:devpaul_eats/features/cart/data/datasources/cart_remote_datasource.dart'
    as _i831;
import 'package:devpaul_eats/features/cart/data/repositories/cart_repository_impl.dart'
    as _i583;
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart'
    as _i580;
import 'package:devpaul_eats/features/cart/domain/usecases/add_to_cart_usecase.dart'
    as _i726;
import 'package:devpaul_eats/features/cart/domain/usecases/clear_cart_usecase.dart'
    as _i280;
import 'package:devpaul_eats/features/cart/domain/usecases/get_cart_usecase.dart'
    as _i576;
import 'package:devpaul_eats/features/cart/domain/usecases/remove_from_cart_usecase.dart'
    as _i68;
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_cubit.dart'
    as _i598;
import 'package:devpaul_eats/features/menu/data/datasources/menu_remote_datasource.dart'
    as _i635;
import 'package:devpaul_eats/features/menu/data/repositories/menu_repository_impl.dart'
    as _i43;
import 'package:devpaul_eats/features/menu/domain/repositories/menu_repository.dart'
    as _i904;
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_item_usecase.dart'
    as _i1054;
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_items_usecase.dart'
    as _i882;
import 'package:devpaul_eats/features/menu/presentation/cubit/item_customizer_cubit.dart'
    as _i368;
import 'package:devpaul_eats/features/orders/data/datasources/order_remote_datasource.dart'
    as _i909;
import 'package:devpaul_eats/features/orders/data/repositories/order_repository_impl.dart'
    as _i177;
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart'
    as _i66;
import 'package:devpaul_eats/features/orders/domain/usecases/get_client_orders_usecase.dart'
    as _i734;
import 'package:devpaul_eats/features/orders/domain/usecases/get_vendor_orders_usecase.dart'
    as _i666;
import 'package:devpaul_eats/features/orders/domain/usecases/place_order_usecase.dart'
    as _i11;
import 'package:devpaul_eats/features/orders/domain/usecases/update_order_status_usecase.dart'
    as _i380;
import 'package:devpaul_eats/features/orders/presentation/cubit/order_cubit.dart'
    as _i195;
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart'
    as _i299;
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_cubit.dart'
    as _i895;
import 'package:devpaul_eats/features/vendors/data/datasources/vendor_remote_datasource.dart'
    as _i175;
import 'package:devpaul_eats/features/vendors/data/repositories/vendor_repository_impl.dart'
    as _i720;
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart'
    as _i1003;
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendor_by_id_usecase.dart'
    as _i209;
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendors_usecase.dart'
    as _i359;
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_detail_cubit.dart'
    as _i340;
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_list_cubit.dart'
    as _i404;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i368.ItemCustomizerCubit>(() => _i368.ItemCustomizerCubit());
    gh.lazySingleton<_i1003.StorageService>(
      () => _i1003.StorageServiceImpl(gh<_i457.FirebaseStorage>()),
    );
    gh.lazySingleton<_i909.OrderRemoteDataSource>(
      () => _i909.OrderRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i635.MenuRemoteDataSource>(
      () => _i635.MenuRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i175.VendorRemoteDataSource>(
      () => _i175.VendorRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i904.MenuRepository>(
      () => _i43.MenuRepositoryImpl(gh<_i635.MenuRemoteDataSourceImpl>()),
    );
    gh.lazySingleton<_i874.AuthRemoteDataSource>(
      () => _i874.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i831.CartRemoteDataSource>(
      () => _i831.CartRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i882.GetMenuItemsUseCase>(
      () => _i882.GetMenuItemsUseCase(gh<_i904.MenuRepository>()),
    );
    gh.lazySingleton<_i1054.GetMenuItemUseCase>(
      () => _i1054.GetMenuItemUseCase(gh<_i904.MenuRepository>()),
    );
    gh.lazySingleton<_i580.CartRepository>(
      () => _i583.CartRepositoryImpl(gh<_i831.CartRemoteDataSource>()),
    );
    gh.lazySingleton<_i576.GetCartUseCase>(
      () => _i576.GetCartUseCase(gh<_i580.CartRepository>()),
    );
    gh.lazySingleton<_i726.AddToCartUseCase>(
      () => _i726.AddToCartUseCase(gh<_i580.CartRepository>()),
    );
    gh.lazySingleton<_i68.RemoveFromCartUseCase>(
      () => _i68.RemoveFromCartUseCase(gh<_i580.CartRepository>()),
    );
    gh.lazySingleton<_i280.ClearCartUseCase>(
      () => _i280.ClearCartUseCase(gh<_i580.CartRepository>()),
    );
    gh.lazySingleton<_i646.AuthRepository>(
      () => _i402.AuthRepositoryImpl(gh<_i874.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i66.OrderRepository>(
      () => _i177.OrderRepositoryImpl(gh<_i909.OrderRemoteDataSource>()),
    );
    gh.lazySingleton<_i598.CartCubit>(
      () => _i598.CartCubit(
        gh<_i576.GetCartUseCase>(),
        gh<_i726.AddToCartUseCase>(),
        gh<_i68.RemoveFromCartUseCase>(),
        gh<_i280.ClearCartUseCase>(),
      ),
    );
    gh.lazySingleton<_i1003.VendorRepository>(
      () => _i720.VendorRepositoryImpl(gh<_i175.VendorRemoteDataSource>()),
    );
    gh.factory<_i299.MenuManagerCubit>(
      () => _i299.MenuManagerCubit(
        gh<_i882.GetMenuItemsUseCase>(),
        gh<_i635.MenuRemoteDataSourceImpl>(),
      ),
    );
    gh.lazySingleton<_i359.GetVendorsUseCase>(
      () => _i359.GetVendorsUseCase(gh<_i1003.VendorRepository>()),
    );
    gh.lazySingleton<_i209.GetVendorByIdUseCase>(
      () => _i209.GetVendorByIdUseCase(gh<_i1003.VendorRepository>()),
    );
    gh.lazySingleton<_i81.SignInUseCase>(
      () => _i81.SignInUseCase(gh<_i646.AuthRepository>()),
    );
    gh.lazySingleton<_i199.SignUpUseCase>(
      () => _i199.SignUpUseCase(gh<_i646.AuthRepository>()),
    );
    gh.lazySingleton<_i164.SignOutUseCase>(
      () => _i164.SignOutUseCase(gh<_i646.AuthRepository>()),
    );
    gh.lazySingleton<_i1044.GetCurrentUserUseCase>(
      () => _i1044.GetCurrentUserUseCase(gh<_i646.AuthRepository>()),
    );
    gh.factory<_i404.VendorListCubit>(
      () => _i404.VendorListCubit(gh<_i359.GetVendorsUseCase>()),
    );
    gh.factory<_i340.VendorDetailCubit>(
      () => _i340.VendorDetailCubit(
        gh<_i209.GetVendorByIdUseCase>(),
        gh<_i882.GetMenuItemsUseCase>(),
      ),
    );
    gh.lazySingleton<_i11.PlaceOrderUseCase>(
      () => _i11.PlaceOrderUseCase(gh<_i66.OrderRepository>()),
    );
    gh.lazySingleton<_i734.GetClientOrdersUseCase>(
      () => _i734.GetClientOrdersUseCase(gh<_i66.OrderRepository>()),
    );
    gh.lazySingleton<_i666.GetVendorOrdersUseCase>(
      () => _i666.GetVendorOrdersUseCase(gh<_i66.OrderRepository>()),
    );
    gh.lazySingleton<_i380.UpdateOrderStatusUseCase>(
      () => _i380.UpdateOrderStatusUseCase(gh<_i66.OrderRepository>()),
    );
    gh.factory<_i895.VendorPanelCubit>(
      () => _i895.VendorPanelCubit(
        gh<_i1003.VendorRepository>(),
        gh<_i380.UpdateOrderStatusUseCase>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i935.AuthCubit>(
      () => _i935.AuthCubit(
        gh<_i81.SignInUseCase>(),
        gh<_i199.SignUpUseCase>(),
        gh<_i164.SignOutUseCase>(),
        gh<_i1044.GetCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i195.OrderCubit>(
      () => _i195.OrderCubit(
        gh<_i11.PlaceOrderUseCase>(),
        gh<_i734.GetClientOrdersUseCase>(),
        gh<_i666.GetVendorOrdersUseCase>(),
        gh<_i380.UpdateOrderStatusUseCase>(),
      ),
    );
    return this;
  }
}
