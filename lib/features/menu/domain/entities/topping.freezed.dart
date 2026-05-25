// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Topping {
  String get id => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get pricePerGram => throw _privateConstructorUsedError;
  int get minGrams => throw _privateConstructorUsedError;
  int get maxGrams => throw _privateConstructorUsedError;
  ToppingUnit get unit => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Create a copy of Topping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToppingCopyWith<Topping> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToppingCopyWith<$Res> {
  factory $ToppingCopyWith(Topping value, $Res Function(Topping) then) =
      _$ToppingCopyWithImpl<$Res, Topping>;
  @useResult
  $Res call({
    String id,
    String menuItemId,
    String name,
    double pricePerGram,
    int minGrams,
    int maxGrams,
    ToppingUnit unit,
    bool isAvailable,
  });
}

/// @nodoc
class _$ToppingCopyWithImpl<$Res, $Val extends Topping>
    implements $ToppingCopyWith<$Res> {
  _$ToppingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Topping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? name = null,
    Object? pricePerGram = null,
    Object? minGrams = null,
    Object? maxGrams = null,
    Object? unit = null,
    Object? isAvailable = null,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            pricePerGram: null == pricePerGram
                ? _value.pricePerGram
                : pricePerGram // ignore: cast_nullable_to_non_nullable
                      as double,
            minGrams: null == minGrams
                ? _value.minGrams
                : minGrams // ignore: cast_nullable_to_non_nullable
                      as int,
            maxGrams: null == maxGrams
                ? _value.maxGrams
                : maxGrams // ignore: cast_nullable_to_non_nullable
                      as int,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as ToppingUnit,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToppingImplCopyWith<$Res> implements $ToppingCopyWith<$Res> {
  factory _$$ToppingImplCopyWith(
    _$ToppingImpl value,
    $Res Function(_$ToppingImpl) then,
  ) = __$$ToppingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String menuItemId,
    String name,
    double pricePerGram,
    int minGrams,
    int maxGrams,
    ToppingUnit unit,
    bool isAvailable,
  });
}

/// @nodoc
class __$$ToppingImplCopyWithImpl<$Res>
    extends _$ToppingCopyWithImpl<$Res, _$ToppingImpl>
    implements _$$ToppingImplCopyWith<$Res> {
  __$$ToppingImplCopyWithImpl(
    _$ToppingImpl _value,
    $Res Function(_$ToppingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Topping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? name = null,
    Object? pricePerGram = null,
    Object? minGrams = null,
    Object? maxGrams = null,
    Object? unit = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _$ToppingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        menuItemId: null == menuItemId
            ? _value.menuItemId
            : menuItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        pricePerGram: null == pricePerGram
            ? _value.pricePerGram
            : pricePerGram // ignore: cast_nullable_to_non_nullable
                  as double,
        minGrams: null == minGrams
            ? _value.minGrams
            : minGrams // ignore: cast_nullable_to_non_nullable
                  as int,
        maxGrams: null == maxGrams
            ? _value.maxGrams
            : maxGrams // ignore: cast_nullable_to_non_nullable
                  as int,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as ToppingUnit,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ToppingImpl implements _Topping {
  const _$ToppingImpl({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.pricePerGram,
    required this.minGrams,
    required this.maxGrams,
    required this.unit,
    required this.isAvailable,
  });

  @override
  final String id;
  @override
  final String menuItemId;
  @override
  final String name;
  @override
  final double pricePerGram;
  @override
  final int minGrams;
  @override
  final int maxGrams;
  @override
  final ToppingUnit unit;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'Topping(id: $id, menuItemId: $menuItemId, name: $name, pricePerGram: $pricePerGram, minGrams: $minGrams, maxGrams: $maxGrams, unit: $unit, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToppingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pricePerGram, pricePerGram) ||
                other.pricePerGram == pricePerGram) &&
            (identical(other.minGrams, minGrams) ||
                other.minGrams == minGrams) &&
            (identical(other.maxGrams, maxGrams) ||
                other.maxGrams == maxGrams) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    menuItemId,
    name,
    pricePerGram,
    minGrams,
    maxGrams,
    unit,
    isAvailable,
  );

  /// Create a copy of Topping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToppingImplCopyWith<_$ToppingImpl> get copyWith =>
      __$$ToppingImplCopyWithImpl<_$ToppingImpl>(this, _$identity);
}

abstract class _Topping implements Topping {
  const factory _Topping({
    required final String id,
    required final String menuItemId,
    required final String name,
    required final double pricePerGram,
    required final int minGrams,
    required final int maxGrams,
    required final ToppingUnit unit,
    required final bool isAvailable,
  }) = _$ToppingImpl;

  @override
  String get id;
  @override
  String get menuItemId;
  @override
  String get name;
  @override
  double get pricePerGram;
  @override
  int get minGrams;
  @override
  int get maxGrams;
  @override
  ToppingUnit get unit;
  @override
  bool get isAvailable;

  /// Create a copy of Topping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToppingImplCopyWith<_$ToppingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
