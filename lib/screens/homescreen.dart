import 'package:drip/screens/FavoriteScreen.dart';
import 'package:drip/screens/dripper_screen.dart';
import 'package:drip/screens/logScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const DrippersCreen(),
    const Favoritescreen(),
    const Logscreen(),
  ];

  void _onBottomIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                color: _selectedIndex == 0 ? Colors.brown : Colors.black,
              ),
              label: 'Recipes'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.favorite, color: Colors.brown)
                  : const Icon(Icons.favorite_border_outlined,
                      color: Colors.black),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time,
                  color: _selectedIndex == 2 ? Colors.brown : Colors.black),
              label: 'Log'),
        ],
        onTap: _onBottomIconTap,
      ),
    );
  }
}
