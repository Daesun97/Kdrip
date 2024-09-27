import 'dart:convert';

import 'package:drip/screens/drip_details/recipe_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HarioV60Recipe extends StatefulWidget {
  const HarioV60Recipe({super.key});

  @override
  _HarioV60RecipeState createState() => _HarioV60RecipeState();
}

class _HarioV60RecipeState extends State<HarioV60Recipe> {
  List<Map<String, String>> coffeeRecipes = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500));
    _loadRecipes();
  }

  recipe_tap(String? recipeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetialScreen(recipeName: recipeName),
      ),
    );
  }

  Future<void> _saveRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(coffeeRecipes);
    await prefs.setString('coffeeRecipes', jsonString);
  }

  Future<void> _loadRecipes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('coffeeRecipes');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      setState(() {
        coffeeRecipes = List<Map<String, String>>.from(
          jsonList.map(
            (item) => Map<String, String>.from(item),
          ),
        );
      });
    } else {
      // 새로운 레시피가 없으면 기존 레시피
      setState(() {
        coffeeRecipes = [
          {'title': 'Hario - make it easy', 'time': '4:00'},
          {'title': 'Hario - make rich taste', 'time': '3:00'},
          {'title': 'Hario on ice', 'time': '4:00'},
          {'title': 'Sweet and easy', 'time': '3:30'},
          {'title': 'V60 recipe by Hario Co., Ltd.', 'time': '3:30'},
        ];
      });
    }
  }

  void _addRecipe() {
    setState(() {
      coffeeRecipes.add({'title': 'New Coffee Recipe', 'time': '5:00'});
      _saveRecipes();
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
            onTap: () => recipe_tap(coffeeRecipes[index]['title']),
          );
        },
      ),
    );
  }
}
