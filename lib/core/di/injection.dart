import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpaul_eats/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devpaul_eats/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:devpaul_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_cubit.dart';
// Vendors
import 'package:devpaul_eats/features/vendors/data/datasources/vendor_remote_datasource.dart';
import 'package:devpaul_eats/features/vendors/data/repositories/vendor_repository_impl.dart';
import 'package:devpaul_eats/features/vendors/domain/repositories/vendor_repository.dart';
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendor_by_id_usecase.dart';
import 'package:devpaul_eats/features/vendors/domain/usecases/get_vendors_usecase.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_detail_cubit.dart';
import 'package:devpaul_eats/features/vendors/presentation/cubit/vendor_list_cubit.dart';
// Menu
import 'package:devpaul_eats/features/menu/data/datasources/menu_remote_datasource.dart';
import 'package:devpaul_eats/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:devpaul_eats/features/menu/domain/repositories/menu_repository.dart';
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_item_usecase.dart';
import 'package:devpaul_eats/features/menu/domain/usecases/get_menu_items_usecase.dart';
import 'package:devpaul_eats/features/menu/presentation/cubit/item_customizer_cubit.dart';
// Cart
import 'package:devpaul_eats/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:devpaul_eats/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:devpaul_eats/features/cart/domain/repositories/cart_repository.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:devpaul_eats/features/cart/presentation/cubit/cart_cubit.dart';
// Orders
import 'package:devpaul_eats/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:devpaul_eats/features/orders/data/repositories/order_repository_impl.dart';
import 'package:devpaul_eats/features/orders/domain/repositories/order_repository.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/place_order_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/get_client_orders_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/get_vendor_orders_usecase.dart';
import 'package:devpaul_eats/features/orders/domain/usecases/update_order_status_usecase.dart';
import 'package:devpaul_eats/features/orders/presentation/cubit/order_cubit.dart';
// Vendor Panel
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/vendor_panel_cubit.dart';
import 'package:devpaul_eats/features/vendor_panel/presentation/cubit/menu_manager_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:devpaul_eats/core/di/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  if (!getIt.isRegistered<FirebaseAuth>()) {
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
  if (!getIt.isRegistered<FirebaseFirestore>()) {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }
  if (!getIt.isRegistered<FirebaseStorage>()) {
    getIt.registerLazySingleton<FirebaseStorage>(
      () => FirebaseStorage.instance,
    );
  }
  getIt.init();
}
