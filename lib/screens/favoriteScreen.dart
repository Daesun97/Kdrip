import 'package:flutter/material.dart';

class Favoritescreen extends StatelessWidget {
  const Favoritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Favorites',
        style: Theme.of(context).textTheme.bodyLarge,
      )),
    );
  }
}
