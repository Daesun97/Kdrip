import 'package:drip/constants/sizes.dart';
import 'package:drip/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true, toolbarHeight: Sizes.size24),
        textTheme: TextTheme(
          titleMedium:
              TextStyle(fontSize: Sizes.size28, fontWeight: FontWeight.bold),
          titleSmall:
              TextStyle(fontSize: Sizes.size24, fontWeight: FontWeight.bold),
          bodyMedium:
              TextStyle(fontFamily: 'Kotra_Son', fontSize: Sizes.size18),
          bodyLarge: TextStyle(fontFamily: 'Kotra_Son', fontSize: Sizes.size24),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'K - Drip'),
    );
  }
}
