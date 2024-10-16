import 'package:drip/constants/sizes.dart';
import 'package:drip/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K-Drip',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: Sizes.size52,
            foregroundColor: Colors.brown),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontFamily: 'Kotra_Son',
              fontSize: Sizes.size28,
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontFamily: 'Kotra_Son',
              fontSize: Sizes.size24,
              fontWeight: FontWeight.bold),
          bodyMedium:
              TextStyle(fontFamily: 'Kotra_Son', fontSize: Sizes.size18),
          bodyLarge: TextStyle(fontFamily: 'Kotra_Son', fontSize: Sizes.size24),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
