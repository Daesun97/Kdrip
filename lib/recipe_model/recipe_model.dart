import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

//모델에 드립퍼종류도 들어가야함
@freezed
class CoffeeRecipe with _$CoffeeRecipe {
  const factory CoffeeRecipe({
    required String dripperName,
    required String recipeName,
    required String grindSize,
    required int coffeeBeansAmount,
    required int waterAmount,
    required int waterTemperature,
    required int totalTime,
    required List<Map<String, int>> extractionSteps,
  }) = _CoffeeRecipe;

  factory CoffeeRecipe.fromJson(Map<String, dynamic> json) =>
      _$CoffeeRecipeFromJson(json);
}
