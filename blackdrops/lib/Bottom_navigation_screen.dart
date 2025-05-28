import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';
import 'Favourites_screen.dart';
import 'appbar_screen.dart';
import 'community_screen.dart';
import 'package:untitled/home_page.dart';

import 'explore_page.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    CommunityScreen(),
    FavouritesScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProfile(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.black.withOpacity(0.6),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, color: Colors.white,),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public, color: Colors.white,),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: Colors.white,),
              label: 'Favorites',
            ),

          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          // Color for selected item
          unselectedItemColor: Colors.grey.shade600,
          // Color for unselected item
          onTap: _onItemTapped,
          selectedIconTheme: IconThemeData(
            size: 32.0, // Increase size of selected icon
          ),
          unselectedIconTheme: IconThemeData(
            size: 24.0,
            color: Colors.grey.shade600, // Color of unselected icon
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}