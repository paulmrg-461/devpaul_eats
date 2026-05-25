// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MenuItem {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  List<Topping> get toppings => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call({
    String id,
    String vendorId,
    String name,
    String description,
    double basePrice,
    String? photoUrl,
    String category,
    bool isAvailable,
    List<Topping> toppings,
  });
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? name = null,
    Object? description = null,
    Object? basePrice = null,
    Object? photoUrl = freezed,
    Object? category = null,
    Object? isAvailable = null,
    Object? toppings = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            toppings: null == toppings
                ? _value.toppings
                : toppings // ignore: cast_nullable_to_non_nullable
                      as List<Topping>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
    _$MenuItemImpl value,
    $Res Function(_$MenuItemImpl) then,
  ) = __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String vendorId,
    String name,
    String description,
    double basePrice,
    String? photoUrl,
    String category,
    bool isAvailable,
    List<Topping> toppings,
  });
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
    _$MenuItemImpl _value,
    $Res Function(_$MenuItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? name = null,
    Object? description = null,
    Object? basePrice = null,
    Object? photoUrl = freezed,
    Object? category = null,
    Object? isAvailable = null,
    Object? toppings = null,
  }) {
    return _then(
      _$MenuItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        toppings: null == toppings
            ? _value._toppings
            : toppings // ignore: cast_nullable_to_non_nullable
                  as List<Topping>,
      ),
    );
  }
}

/// @nodoc

class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.description,
    required this.basePrice,
    this.photoUrl,
    required this.category,
    required this.isAvailable,
    required final List<Topping> toppings,
  }) : _toppings = toppings;

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String name;
  @override
  final String description;
  @override
  final double basePrice;
  @override
  final String? photoUrl;
  @override
  final String category;
  @override
  final bool isAvailable;
  final List<Topping> _toppings;
  @override
  List<Topping> get toppings {
    if (_toppings is EqualUnmodifiableListView) return _toppings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toppings);
  }

  @override
  String toString() {
    return 'MenuItem(id: $id, vendorId: $vendorId, name: $name, description: $description, basePrice: $basePrice, photoUrl: $photoUrl, category: $category, isAvailable: $isAvailable, toppings: $toppings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality().equals(other._toppings, _toppings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vendorId,
    name,
    description,
    basePrice,
    photoUrl,
    category,
    isAvailable,
    const DeepCollectionEquality().hash(_toppings),
  );

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem({
    required final String id,
    required final String vendorId,
    required final String name,
    required final String description,
    required final double basePrice,
    final String? photoUrl,
    required final String category,
    required final bool isAvailable,
    required final List<Topping> toppings,
  }) = _$MenuItemImpl;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String get name;
  @override
  String get description;
  @override
  double get basePrice;
  @override
  String? get photoUrl;
  @override
  String get category;
  @override
  bool get isAvailable;
  @override
  List<Topping> get toppings;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
