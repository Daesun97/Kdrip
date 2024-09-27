import 'package:drip/constants/sizes.dart';
import 'package:flutter/material.dart';

class RecipeDetialScreen extends StatefulWidget {
  final String? recipeName;
  const RecipeDetialScreen({super.key, required this.recipeName});

  @override
  State<RecipeDetialScreen> createState() => _RecipeDetialScreenState();
}

class _RecipeDetialScreenState extends State<RecipeDetialScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.recipeName);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.recipeName}'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.size12),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
