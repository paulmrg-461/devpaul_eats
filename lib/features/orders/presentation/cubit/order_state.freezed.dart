// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
    OrderState value,
    $Res Function(OrderState) then,
  ) = _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OrderState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrderState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OrderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PlacingImplCopyWith<$Res> {
  factory _$$PlacingImplCopyWith(
    _$PlacingImpl value,
    $Res Function(_$PlacingImpl) then,
  ) = __$$PlacingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlacingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$PlacingImpl>
    implements _$$PlacingImplCopyWith<$Res> {
  __$$PlacingImplCopyWithImpl(
    _$PlacingImpl _value,
    $Res Function(_$PlacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlacingImpl implements _Placing {
  const _$PlacingImpl();

  @override
  String toString() {
    return 'OrderState.placing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlacingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return placing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return placing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (placing != null) {
      return placing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return placing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return placing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (placing != null) {
      return placing(this);
    }
    return orElse();
  }
}

abstract class _Placing implements OrderState {
  const factory _Placing() = _$PlacingImpl;
}

/// @nodoc
abstract class _$$PlacedImplCopyWith<$Res> {
  factory _$$PlacedImplCopyWith(
    _$PlacedImpl value,
    $Res Function(_$PlacedImpl) then,
  ) = __$$PlacedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Order order});

  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$PlacedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$PlacedImpl>
    implements _$$PlacedImplCopyWith<$Res> {
  __$$PlacedImplCopyWithImpl(
    _$PlacedImpl _value,
    $Res Function(_$PlacedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? order = null}) {
    return _then(
      _$PlacedImpl(
        null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as Order,
      ),
    );
  }

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$PlacedImpl implements _Placed {
  const _$PlacedImpl(this.order);

  @override
  final Order order;

  @override
  String toString() {
    return 'OrderState.placed(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacedImplCopyWith<_$PlacedImpl> get copyWith =>
      __$$PlacedImplCopyWithImpl<_$PlacedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return placed(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return placed?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (placed != null) {
      return placed(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return placed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return placed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (placed != null) {
      return placed(this);
    }
    return orElse();
  }
}

abstract class _Placed implements OrderState {
  const factory _Placed(final Order order) = _$PlacedImpl;

  Order get order;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacedImplCopyWith<_$PlacedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrdersLoadedImplCopyWith<$Res> {
  factory _$$OrdersLoadedImplCopyWith(
    _$OrdersLoadedImpl value,
    $Res Function(_$OrdersLoadedImpl) then,
  ) = __$$OrdersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Order> orders});
}

/// @nodoc
class __$$OrdersLoadedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrdersLoadedImpl>
    implements _$$OrdersLoadedImplCopyWith<$Res> {
  __$$OrdersLoadedImplCopyWithImpl(
    _$OrdersLoadedImpl _value,
    $Res Function(_$OrdersLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null}) {
    return _then(
      _$OrdersLoadedImpl(
        null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<Order>,
      ),
    );
  }
}

/// @nodoc

class _$OrdersLoadedImpl implements _OrdersLoaded {
  const _$OrdersLoadedImpl(final List<Order> orders) : _orders = orders;

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrderState.ordersLoaded(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersLoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersLoadedImplCopyWith<_$OrdersLoadedImpl> get copyWith =>
      __$$OrdersLoadedImplCopyWithImpl<_$OrdersLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return ordersLoaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return ordersLoaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (ordersLoaded != null) {
      return ordersLoaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return ordersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return ordersLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ordersLoaded != null) {
      return ordersLoaded(this);
    }
    return orElse();
  }
}

abstract class _OrdersLoaded implements OrderState {
  const factory _OrdersLoaded(final List<Order> orders) = _$OrdersLoadedImpl;

  List<Order> get orders;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersLoadedImplCopyWith<_$OrdersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() placing,
    required TResult Function(Order order) placed,
    required TResult Function(List<Order> orders) ordersLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? placing,
    TResult? Function(Order order)? placed,
    TResult? Function(List<Order> orders)? ordersLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? placing,
    TResult Function(Order order)? placed,
    TResult Function(List<Order> orders)? ordersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Placing value) placing,
    required TResult Function(_Placed value) placed,
    required TResult Function(_OrdersLoaded value) ordersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Placing value)? placing,
    TResult? Function(_Placed value)? placed,
    TResult? Function(_OrdersLoaded value)? ordersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Placing value)? placing,
    TResult Function(_Placed value)? placed,
    TResult Function(_OrdersLoaded value)? ordersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OrderState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
