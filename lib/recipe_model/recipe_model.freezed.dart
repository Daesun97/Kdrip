// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoffeeRecipe _$CoffeeRecipeFromJson(Map<String, dynamic> json) {
  return _CoffeeRecipe.fromJson(json);
}

/// @nodoc
mixin _$CoffeeRecipe {
  int get coffeeBeansAmount => throw _privateConstructorUsedError;
  int get waterAmount => throw _privateConstructorUsedError;
  int get waterTemperature => throw _privateConstructorUsedError;
  int get totalTime => throw _privateConstructorUsedError;
  List<Map<String, int>> get extractionSteps =>
      throw _privateConstructorUsedError;
  String get recipeName => throw _privateConstructorUsedError;
  String get grindSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeRecipeCopyWith<CoffeeRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeRecipeCopyWith<$Res> {
  factory $CoffeeRecipeCopyWith(
          CoffeeRecipe value, $Res Function(CoffeeRecipe) then) =
      _$CoffeeRecipeCopyWithImpl<$Res, CoffeeRecipe>;
  @useResult
  $Res call(
      {int coffeeBeansAmount,
      int waterAmount,
      int waterTemperature,
      int totalTime,
      List<Map<String, int>> extractionSteps,
      String recipeName,
      String grindSize});
}

/// @nodoc
class _$CoffeeRecipeCopyWithImpl<$Res, $Val extends CoffeeRecipe>
    implements $CoffeeRecipeCopyWith<$Res> {
  _$CoffeeRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffeeBeansAmount = null,
    Object? waterAmount = null,
    Object? waterTemperature = null,
    Object? totalTime = null,
    Object? extractionSteps = null,
    Object? recipeName = null,
    Object? grindSize = null,
  }) {
    return _then(_value.copyWith(
      coffeeBeansAmount: null == coffeeBeansAmount
          ? _value.coffeeBeansAmount
          : coffeeBeansAmount // ignore: cast_nullable_to_non_nullable
              as int,
      waterAmount: null == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as int,
      waterTemperature: null == waterTemperature
          ? _value.waterTemperature
          : waterTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      extractionSteps: null == extractionSteps
          ? _value.extractionSteps
          : extractionSteps // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>>,
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
      grindSize: null == grindSize
          ? _value.grindSize
          : grindSize // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeRecipeImplCopyWith<$Res>
    implements $CoffeeRecipeCopyWith<$Res> {
  factory _$$CoffeeRecipeImplCopyWith(
          _$CoffeeRecipeImpl value, $Res Function(_$CoffeeRecipeImpl) then) =
      __$$CoffeeRecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int coffeeBeansAmount,
      int waterAmount,
      int waterTemperature,
      int totalTime,
      List<Map<String, int>> extractionSteps,
      String recipeName,
      String grindSize});
}

/// @nodoc
class __$$CoffeeRecipeImplCopyWithImpl<$Res>
    extends _$CoffeeRecipeCopyWithImpl<$Res, _$CoffeeRecipeImpl>
    implements _$$CoffeeRecipeImplCopyWith<$Res> {
  __$$CoffeeRecipeImplCopyWithImpl(
      _$CoffeeRecipeImpl _value, $Res Function(_$CoffeeRecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coffeeBeansAmount = null,
    Object? waterAmount = null,
    Object? waterTemperature = null,
    Object? totalTime = null,
    Object? extractionSteps = null,
    Object? recipeName = null,
    Object? grindSize = null,
  }) {
    return _then(_$CoffeeRecipeImpl(
      coffeeBeansAmount: null == coffeeBeansAmount
          ? _value.coffeeBeansAmount
          : coffeeBeansAmount // ignore: cast_nullable_to_non_nullable
              as int,
      waterAmount: null == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as int,
      waterTemperature: null == waterTemperature
          ? _value.waterTemperature
          : waterTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      extractionSteps: null == extractionSteps
          ? _value._extractionSteps
          : extractionSteps // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>>,
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
      grindSize: null == grindSize
          ? _value.grindSize
          : grindSize // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeRecipeImpl implements _CoffeeRecipe {
  const _$CoffeeRecipeImpl(
      {required this.coffeeBeansAmount,
      required this.waterAmount,
      required this.waterTemperature,
      required this.totalTime,
      required final List<Map<String, int>> extractionSteps,
      required this.recipeName,
      required this.grindSize})
      : _extractionSteps = extractionSteps;

  factory _$CoffeeRecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeRecipeImplFromJson(json);

  @override
  final int coffeeBeansAmount;
  @override
  final int waterAmount;
  @override
  final int waterTemperature;
  @override
  final int totalTime;
  final List<Map<String, int>> _extractionSteps;
  @override
  List<Map<String, int>> get extractionSteps {
    if (_extractionSteps is EqualUnmodifiableListView) return _extractionSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extractionSteps);
  }

  @override
  final String recipeName;
  @override
  final String grindSize;

  @override
  String toString() {
    return 'CoffeeRecipe(coffeeBeansAmount: $coffeeBeansAmount, waterAmount: $waterAmount, waterTemperature: $waterTemperature, totalTime: $totalTime, extractionSteps: $extractionSteps, recipeName: $recipeName, grindSize: $grindSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeRecipeImpl &&
            (identical(other.coffeeBeansAmount, coffeeBeansAmount) ||
                other.coffeeBeansAmount == coffeeBeansAmount) &&
            (identical(other.waterAmount, waterAmount) ||
                other.waterAmount == waterAmount) &&
            (identical(other.waterTemperature, waterTemperature) ||
                other.waterTemperature == waterTemperature) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            const DeepCollectionEquality()
                .equals(other._extractionSteps, _extractionSteps) &&
            (identical(other.recipeName, recipeName) ||
                other.recipeName == recipeName) &&
            (identical(other.grindSize, grindSize) ||
                other.grindSize == grindSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coffeeBeansAmount,
      waterAmount,
      waterTemperature,
      totalTime,
      const DeepCollectionEquality().hash(_extractionSteps),
      recipeName,
      grindSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeRecipeImplCopyWith<_$CoffeeRecipeImpl> get copyWith =>
      __$$CoffeeRecipeImplCopyWithImpl<_$CoffeeRecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeRecipeImplToJson(
      this,
    );
  }
}

abstract class _CoffeeRecipe implements CoffeeRecipe {
  const factory _CoffeeRecipe(
      {required final int coffeeBeansAmount,
      required final int waterAmount,
      required final int waterTemperature,
      required final int totalTime,
      required final List<Map<String, int>> extractionSteps,
      required final String recipeName,
      required final String grindSize}) = _$CoffeeRecipeImpl;

  factory _CoffeeRecipe.fromJson(Map<String, dynamic> json) =
      _$CoffeeRecipeImpl.fromJson;

  @override
  int get coffeeBeansAmount;
  @override
  int get waterAmount;
  @override
  int get waterTemperature;
  @override
  int get totalTime;
  @override
  List<Map<String, int>> get extractionSteps;
  @override
  String get recipeName;
  @override
  String get grindSize;
  @override
  @JsonKey(ignore: true)
  _$$CoffeeRecipeImplCopyWith<_$CoffeeRecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
