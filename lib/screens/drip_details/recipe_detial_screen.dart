import 'package:drip/constants/sizes.dart';
import 'package:drip/recipe_model/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final CoffeeRecipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.recipeName!),
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.size12),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
            )
          ],
        ),
      ),
    );
  }
}
