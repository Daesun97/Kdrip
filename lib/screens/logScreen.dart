import 'package:flutter/material.dart';

class Logscreen extends StatelessWidget {
  const Logscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Log',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
