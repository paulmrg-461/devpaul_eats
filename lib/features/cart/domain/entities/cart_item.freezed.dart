// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SelectedTopping {
  String get toppingId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get grams => throw _privateConstructorUsedError;
  double get pricePerGram => throw _privateConstructorUsedError;

  /// Create a copy of SelectedTopping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedToppingCopyWith<SelectedTopping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedToppingCopyWith<$Res> {
  factory $SelectedToppingCopyWith(
    SelectedTopping value,
    $Res Function(SelectedTopping) then,
  ) = _$SelectedToppingCopyWithImpl<$Res, SelectedTopping>;
  @useResult
  $Res call({String toppingId, String name, int grams, double pricePerGram});
}

/// @nodoc
class _$SelectedToppingCopyWithImpl<$Res, $Val extends SelectedTopping>
    implements $SelectedToppingCopyWith<$Res> {
  _$SelectedToppingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedTopping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toppingId = null,
    Object? name = null,
    Object? grams = null,
    Object? pricePerGram = null,
  }) {
    return _then(
      _value.copyWith(
            toppingId: null == toppingId
                ? _value.toppingId
                : toppingId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            grams: null == grams
                ? _value.grams
                : grams // ignore: cast_nullable_to_non_nullable
                      as int,
            pricePerGram: null == pricePerGram
                ? _value.pricePerGram
                : pricePerGram // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelectedToppingImplCopyWith<$Res>
    implements $SelectedToppingCopyWith<$Res> {
  factory _$$SelectedToppingImplCopyWith(
    _$SelectedToppingImpl value,
    $Res Function(_$SelectedToppingImpl) then,
  ) = __$$SelectedToppingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String toppingId, String name, int grams, double pricePerGram});
}

/// @nodoc
class __$$SelectedToppingImplCopyWithImpl<$Res>
    extends _$SelectedToppingCopyWithImpl<$Res, _$SelectedToppingImpl>
    implements _$$SelectedToppingImplCopyWith<$Res> {
  __$$SelectedToppingImplCopyWithImpl(
    _$SelectedToppingImpl _value,
    $Res Function(_$SelectedToppingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelectedTopping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toppingId = null,
    Object? name = null,
    Object? grams = null,
    Object? pricePerGram = null,
  }) {
    return _then(
      _$SelectedToppingImpl(
        toppingId: null == toppingId
            ? _value.toppingId
            : toppingId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        grams: null == grams
            ? _value.grams
            : grams // ignore: cast_nullable_to_non_nullable
                  as int,
        pricePerGram: null == pricePerGram
            ? _value.pricePerGram
            : pricePerGram // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$SelectedToppingImpl implements _SelectedTopping {
  const _$SelectedToppingImpl({
    required this.toppingId,
    required this.name,
    required this.grams,
    required this.pricePerGram,
  });

  @override
  final String toppingId;
  @override
  final String name;
  @override
  final int grams;
  @override
  final double pricePerGram;

  @override
  String toString() {
    return 'SelectedTopping(toppingId: $toppingId, name: $name, grams: $grams, pricePerGram: $pricePerGram)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedToppingImpl &&
            (identical(other.toppingId, toppingId) ||
                other.toppingId == toppingId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grams, grams) || other.grams == grams) &&
            (identical(other.pricePerGram, pricePerGram) ||
                other.pricePerGram == pricePerGram));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, toppingId, name, grams, pricePerGram);

  /// Create a copy of SelectedTopping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedToppingImplCopyWith<_$SelectedToppingImpl> get copyWith =>
      __$$SelectedToppingImplCopyWithImpl<_$SelectedToppingImpl>(
        this,
        _$identity,
      );
}

abstract class _SelectedTopping implements SelectedTopping {
  const factory _SelectedTopping({
    required final String toppingId,
    required final String name,
    required final int grams,
    required final double pricePerGram,
  }) = _$SelectedToppingImpl;

  @override
  String get toppingId;
  @override
  String get name;
  @override
  int get grams;
  @override
  double get pricePerGram;

  /// Create a copy of SelectedTopping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedToppingImplCopyWith<_$SelectedToppingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartItem {
  String get id => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;
  String get menuItemName => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<SelectedTopping> get selectedToppings =>
      throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({
    String id,
    String menuItemId,
    String menuItemName,
    String vendorId,
    double basePrice,
    String? photoUrl,
    List<SelectedTopping> selectedToppings,
  });
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? menuItemName = null,
    Object? vendorId = null,
    Object? basePrice = null,
    Object? photoUrl = freezed,
    Object? selectedToppings = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            menuItemId: null == menuItemId
                ? _value.menuItemId
                : menuItemId // ignore: cast_nullable_to_non_nullable
                      as String,
            menuItemName: null == menuItemName
                ? _value.menuItemName
                : menuItemName // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedToppings: null == selectedToppings
                ? _value.selectedToppings
                : selectedToppings // ignore: cast_nullable_to_non_nullable
                      as List<SelectedTopping>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
    _$CartItemImpl value,
    $Res Function(_$CartItemImpl) then,
  ) = __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String menuItemId,
    String menuItemName,
    String vendorId,
    double basePrice,
    String? photoUrl,
    List<SelectedTopping> selectedToppings,
  });
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
    _$CartItemImpl _value,
    $Res Function(_$CartItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? menuItemName = null,
    Object? vendorId = null,
    Object? basePrice = null,
    Object? photoUrl = freezed,
    Object? selectedToppings = null,
  }) {
    return _then(
      _$CartItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        menuItemId: null == menuItemId
            ? _value.menuItemId
            : menuItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        menuItemName: null == menuItemName
            ? _value.menuItemName
            : menuItemName // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedToppings: null == selectedToppings
            ? _value._selectedToppings
            : selectedToppings // ignore: cast_nullable_to_non_nullable
                  as List<SelectedTopping>,
      ),
    );
  }
}

/// @nodoc

class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    required this.vendorId,
    required this.basePrice,
    this.photoUrl,
    required final List<SelectedTopping> selectedToppings,
  }) : _selectedToppings = selectedToppings;

  @override
  final String id;
  @override
  final String menuItemId;
  @override
  final String menuItemName;
  @override
  final String vendorId;
  @override
  final double basePrice;
  @override
  final String? photoUrl;
  final List<SelectedTopping> _selectedToppings;
  @override
  List<SelectedTopping> get selectedToppings {
    if (_selectedToppings is EqualUnmodifiableListView)
      return _selectedToppings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedToppings);
  }

  @override
  String toString() {
    return 'CartItem(id: $id, menuItemId: $menuItemId, menuItemName: $menuItemName, vendorId: $vendorId, basePrice: $basePrice, photoUrl: $photoUrl, selectedToppings: $selectedToppings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.menuItemName, menuItemName) ||
                other.menuItemName == menuItemName) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(
              other._selectedToppings,
              _selectedToppings,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    menuItemId,
    menuItemName,
    vendorId,
    basePrice,
    photoUrl,
    const DeepCollectionEquality().hash(_selectedToppings),
  );

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);
}

abstract class _CartItem implements CartItem {
  const factory _CartItem({
    required final String id,
    required final String menuItemId,
    required final String menuItemName,
    required final String vendorId,
    required final double basePrice,
    final String? photoUrl,
    required final List<SelectedTopping> selectedToppings,
  }) = _$CartItemImpl;

  @override
  String get id;
  @override
  String get menuItemId;
  @override
  String get menuItemName;
  @override
  String get vendorId;
  @override
  double get basePrice;
  @override
  String? get photoUrl;
  @override
  List<SelectedTopping> get selectedToppings;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
