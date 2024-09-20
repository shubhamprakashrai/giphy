import 'package:flutter/material.dart';
import 'package:giphyapp/app/modules/favoritepage/views/favoritepage_view.dart';
import 'package:giphyapp/app/modules/home/views/home_view.dart';

class TabBarNavigation extends StatefulWidget {
  const TabBarNavigation({super.key});

  @override
  State<TabBarNavigation> createState() => _TabBarNavigationState();
}

class _TabBarNavigationState extends State<TabBarNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
     FavoritepageView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gif),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
