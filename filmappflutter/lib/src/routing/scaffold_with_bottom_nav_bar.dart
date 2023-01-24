import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movie_app_riverpod/src/localization/string_hardcoded.dart';
import 'package:tmdb_movie_app_riverpod/src/routing/app_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  // used for the currentIndex argument of BottomNavigationBar
  int _selectedIndex = 0;

  void _tap(BuildContext context, int index) {
    if (index == _selectedIndex) {
      // If the tab hasn't changed, do nothing
      return;
    }
    setState(() => _selectedIndex = index);
    if (index == 0) {
      context.goNamed(AppRoute.movies.name);
    } else if (index == 1) {
      context.goNamed(AppRoute.favorites.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: [
          // products
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search'.hardcoded,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Favorites'.hardcoded,
          ),
        ],
        onTap: (index) => _tap(context, index),
      ),
    );
  }
}
