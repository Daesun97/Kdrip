import 'dart:convert';

import 'package:drip/recipe_model/recipe_model.dart';
import 'package:drip/screens/drip_details/add_recipe_screen.dart';
import 'package:drip/screens/drip_details/recipe_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HarioV60Recipe extends StatefulWidget {
  const HarioV60Recipe({super.key});

  @override
  _HarioV60RecipeState createState() => _HarioV60RecipeState();
}

class _HarioV60RecipeState extends State<HarioV60Recipe> {
  List<CoffeeRecipe> coffeeRecipes = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500));
    _loadRecipes();
  }

  recipe_tap(CoffeeRecipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailScreen(recipe: recipe),
      ),
    );
  }

  Future<void> _saveRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString =
        jsonEncode(coffeeRecipes.map((recipe) => recipe.toJson()).toList());
    await prefs.setString('coffeeRecipes', jsonString);
  }

  Future<void> _loadRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('coffeeRecipes');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      setState(() {
        coffeeRecipes = List<CoffeeRecipe>.from(
          jsonList.map(
            (item) => CoffeeRecipe.fromJson(item as Map<String, dynamic>),
          ),
        );
      });
    } else {
      // 새로운 레시피가 없으면 기존 레시피
      setState(() {
        coffeeRecipes = [
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
      });
    }
  }

  void _addRecipe() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddRecipeScreen(),
      ),
    );
    // setState(() {
    //   _saveRecipes();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hario V60'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addRecipe,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: coffeeRecipes.length,
        itemBuilder: (context, index) {
          final recipe = coffeeRecipes[index];
          return ListTile(
            title: Text(recipe.recipeName),
            subtitle: Text(
                '커피 량: ${recipe.coffeeBeansAmount}g, 물 량: ${recipe.waterAmount}ml'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => recipe_tap(recipe),
          );
        },
      ),
    );
  }
}
