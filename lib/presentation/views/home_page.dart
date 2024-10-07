import 'package:flutter/material.dart';
import 'package:newsd/core/colors.dart';
import 'package:newsd/l10n/l10n.dart';
import 'package:newsd/presentation/views/favorites_page.dart';
import 'package:newsd/presentation/views/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    FavoritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.appName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.blue,
          backgroundColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
