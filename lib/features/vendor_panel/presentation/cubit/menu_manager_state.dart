import 'package:devpaul_eats/features/menu/domain/entities/menu_item.dart';

sealed class MenuManagerState {
  const MenuManagerState();
}

class MenuManagerInitial extends MenuManagerState {
  const MenuManagerInitial();
}

class MenuManagerLoading extends MenuManagerState {
  const MenuManagerLoading();
}

class MenuManagerLoaded extends MenuManagerState {
  final List<MenuItem> items;
  const MenuManagerLoaded(this.items);

  MenuManagerLoaded copyWith({List<MenuItem>? items}) {
    return MenuManagerLoaded(items ?? this.items);
  }
}

class MenuManagerError extends MenuManagerState {
  final String message;
  const MenuManagerError(this.message);
}
