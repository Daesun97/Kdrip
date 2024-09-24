import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class CoffeeRecipe with _$CoffeeRecipe {
  const factory CoffeeRecipe({
    required String recipeName,
    required String distributionDiagram,
    required int coffeeBeansAmount,
    required int waterAmount,
    required int waterTemperature,
    required int totalTime,
    required List<Map<String, int>> extractionSteps,
  }) = _CoffeeRecipe;

  factory CoffeeRecipe.fromJson(Map<String, dynamic> json) =>
      _$CoffeeRecipeFromJson(json);
}
