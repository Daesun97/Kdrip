import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HarioV60Recipe extends StatefulWidget {
  const HarioV60Recipe({super.key});

  @override
  _HarioV60RecipeState createState() => _HarioV60RecipeState();
}

class _HarioV60RecipeState extends State<HarioV60Recipe> {
  final List<Map<String, String>> coffeeRecipes = [];

  Future<void> _saveRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(coffeeRecipes);
    await prefs.setString('coffeeRecipes', jsonString);
  }

  void _addRecipe() {
    setState(() {
      coffeeRecipes.add({'title': 'New Coffee Recipe', 'time': '5:00'});
    });
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
          return ListTile(
            leading: const Icon(Icons.local_cafe),
            title: Text(coffeeRecipes[index]['title']!),
            subtitle: Text(coffeeRecipes[index]['time']!),
            onTap: () {
              // Handle tap for detailed recipe view or other actions
            },
          );
        },
      ),
    );
  }
}
