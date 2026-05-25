// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VendorDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Vendor vendor, List<MenuItem> menuItems) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailInitial value) initial,
    required TResult Function(_DetailLoading value) loading,
    required TResult Function(_DetailLoaded value) loaded,
    required TResult Function(_DetailError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DetailInitial value)? initial,
    TResult? Function(_DetailLoading value)? loading,
    TResult? Function(_DetailLoaded value)? loaded,
    TResult? Function(_DetailError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailInitial value)? initial,
    TResult Function(_DetailLoading value)? loading,
    TResult Function(_DetailLoaded value)? loaded,
    TResult Function(_DetailError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDetailStateCopyWith<$Res> {
  factory $VendorDetailStateCopyWith(
    VendorDetailState value,
    $Res Function(VendorDetailState) then,
  ) = _$VendorDetailStateCopyWithImpl<$Res, VendorDetailState>;
}

/// @nodoc
class _$VendorDetailStateCopyWithImpl<$Res, $Val extends VendorDetailState>
    implements $VendorDetailStateCopyWith<$Res> {
  _$VendorDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DetailInitialImplCopyWith<$Res> {
  factory _$$DetailInitialImplCopyWith(
    _$DetailInitialImpl value,
    $Res Function(_$DetailInitialImpl) then,
  ) = __$$DetailInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailInitialImplCopyWithImpl<$Res>
    extends _$VendorDetailStateCopyWithImpl<$Res, _$DetailInitialImpl>
    implements _$$DetailInitialImplCopyWith<$Res> {
  __$$DetailInitialImplCopyWithImpl(
    _$DetailInitialImpl _value,
    $Res Function(_$DetailInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailInitialImpl implements _DetailInitial {
  const _$DetailInitialImpl();

  @override
  String toString() {
    return 'VendorDetailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetailInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Vendor vendor, List<MenuItem> menuItems) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
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
    required TResult Function(_DetailInitial value) initial,
    required TResult Function(_DetailLoading value) loading,
    required TResult Function(_DetailLoaded value) loaded,
    required TResult Function(_DetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DetailInitial value)? initial,
    TResult? Function(_DetailLoading value)? loading,
    TResult? Function(_DetailLoaded value)? loaded,
    TResult? Function(_DetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailInitial value)? initial,
    TResult Function(_DetailLoading value)? loading,
    TResult Function(_DetailLoaded value)? loaded,
    TResult Function(_DetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DetailInitial implements VendorDetailState {
  const factory _DetailInitial() = _$DetailInitialImpl;
}

/// @nodoc
abstract class _$$DetailLoadingImplCopyWith<$Res> {
  factory _$$DetailLoadingImplCopyWith(
    _$DetailLoadingImpl value,
    $Res Function(_$DetailLoadingImpl) then,
  ) = __$$DetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailLoadingImplCopyWithImpl<$Res>
    extends _$VendorDetailStateCopyWithImpl<$Res, _$DetailLoadingImpl>
    implements _$$DetailLoadingImplCopyWith<$Res> {
  __$$DetailLoadingImplCopyWithImpl(
    _$DetailLoadingImpl _value,
    $Res Function(_$DetailLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailLoadingImpl implements _DetailLoading {
  const _$DetailLoadingImpl();

  @override
  String toString() {
    return 'VendorDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Vendor vendor, List<MenuItem> menuItems) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
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
    required TResult Function(_DetailInitial value) initial,
    required TResult Function(_DetailLoading value) loading,
    required TResult Function(_DetailLoaded value) loaded,
    required TResult Function(_DetailError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DetailInitial value)? initial,
    TResult? Function(_DetailLoading value)? loading,
    TResult? Function(_DetailLoaded value)? loaded,
    TResult? Function(_DetailError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailInitial value)? initial,
    TResult Function(_DetailLoading value)? loading,
    TResult Function(_DetailLoaded value)? loaded,
    TResult Function(_DetailError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DetailLoading implements VendorDetailState {
  const factory _DetailLoading() = _$DetailLoadingImpl;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
    _$DetailLoadedImpl value,
    $Res Function(_$DetailLoadedImpl) then,
  ) = __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Vendor vendor, List<MenuItem> menuItems});

  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$VendorDetailStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
    _$DetailLoadedImpl _value,
    $Res Function(_$DetailLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? vendor = null, Object? menuItems = null}) {
    return _then(
      _$DetailLoadedImpl(
        null == vendor
            ? _value.vendor
            : vendor // ignore: cast_nullable_to_non_nullable
                  as Vendor,
        null == menuItems
            ? _value._menuItems
            : menuItems // ignore: cast_nullable_to_non_nullable
                  as List<MenuItem>,
      ),
    );
  }

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value));
    });
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.vendor, final List<MenuItem> menuItems)
    : _menuItems = menuItems;

  @override
  final Vendor vendor;
  final List<MenuItem> _menuItems;
  @override
  List<MenuItem> get menuItems {
    if (_menuItems is EqualUnmodifiableListView) return _menuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItems);
  }

  @override
  String toString() {
    return 'VendorDetailState.loaded(vendor: $vendor, menuItems: $menuItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            const DeepCollectionEquality().equals(
              other._menuItems,
              _menuItems,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    vendor,
    const DeepCollectionEquality().hash(_menuItems),
  );

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      __$$DetailLoadedImplCopyWithImpl<_$DetailLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Vendor vendor, List<MenuItem> menuItems) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(vendor, menuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(vendor, menuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(vendor, menuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailInitial value) initial,
    required TResult Function(_DetailLoading value) loading,
    required TResult Function(_DetailLoaded value) loaded,
    required TResult Function(_DetailError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DetailInitial value)? initial,
    TResult? Function(_DetailLoading value)? loading,
    TResult? Function(_DetailLoaded value)? loaded,
    TResult? Function(_DetailError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailInitial value)? initial,
    TResult Function(_DetailLoading value)? loading,
    TResult Function(_DetailLoaded value)? loaded,
    TResult Function(_DetailError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _DetailLoaded implements VendorDetailState {
  const factory _DetailLoaded(
    final Vendor vendor,
    final List<MenuItem> menuItems,
  ) = _$DetailLoadedImpl;

  Vendor get vendor;
  List<MenuItem> get menuItems;

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailErrorImplCopyWith<$Res> {
  factory _$$DetailErrorImplCopyWith(
    _$DetailErrorImpl value,
    $Res Function(_$DetailErrorImpl) then,
  ) = __$$DetailErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DetailErrorImplCopyWithImpl<$Res>
    extends _$VendorDetailStateCopyWithImpl<$Res, _$DetailErrorImpl>
    implements _$$DetailErrorImplCopyWith<$Res> {
  __$$DetailErrorImplCopyWithImpl(
    _$DetailErrorImpl _value,
    $Res Function(_$DetailErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$DetailErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DetailErrorImpl implements _DetailError {
  const _$DetailErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VendorDetailState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailErrorImplCopyWith<_$DetailErrorImpl> get copyWith =>
      __$$DetailErrorImplCopyWithImpl<_$DetailErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Vendor vendor, List<MenuItem> menuItems) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Vendor vendor, List<MenuItem> menuItems)? loaded,
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
    required TResult Function(_DetailInitial value) initial,
    required TResult Function(_DetailLoading value) loading,
    required TResult Function(_DetailLoaded value) loaded,
    required TResult Function(_DetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DetailInitial value)? initial,
    TResult? Function(_DetailLoading value)? loading,
    TResult? Function(_DetailLoaded value)? loaded,
    TResult? Function(_DetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailInitial value)? initial,
    TResult Function(_DetailLoading value)? loading,
    TResult Function(_DetailLoaded value)? loaded,
    TResult Function(_DetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DetailError implements VendorDetailState {
  const factory _DetailError(final String message) = _$DetailErrorImpl;

  String get message;

  /// Create a copy of VendorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailErrorImplCopyWith<_$DetailErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
