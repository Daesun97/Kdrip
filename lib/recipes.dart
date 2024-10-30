import 'package:drip/recipe_model/recipe_model.dart';

List<CoffeeRecipe> coffeeRecipes_Hario = [
  const CoffeeRecipe(
    dripperName: '하리오 V60',
    recipeName: '하리오 V60',
    grindSize: '굵게',
    coffeeBeansAmount: 30,
    waterAmount: 360,
    waterTemperature: 92,
    totalTime: 165,
    extractionSteps: [
      {'뜸들이기': 30},
      {'스왈링': 10},
      {'물 붓기': 50},
      {'기다리기': 30},
      {'물 붓기': 45},
    ],
  ),
  const CoffeeRecipe(
    dripperName: '하리오 V60',
    recipeName: '칼리타',
    grindSize: '중간',
    coffeeBeansAmount: 40,
    waterAmount: 600,
    waterTemperature: 93,
    totalTime: 210,
    extractionSteps: [
      {'뜸들이기': 40},
      {'물 붓기': 60},
      {'물 붓기': 60},
      {'물 붓기': 50},
    ],
  ),
  const CoffeeRecipe(
    dripperName: '하리오 V60',
    recipeName: '프렌치 프레스',
    grindSize: '가늘게',
    coffeeBeansAmount: 50,
    waterAmount: 500,
    waterTemperature: 96,
    totalTime: 240,
    extractionSteps: [
      {'Stir': 30},
      {'Press': 60},
      {'Pour': 60},
    ],
  ),
];
