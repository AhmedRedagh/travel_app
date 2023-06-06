import 'package:flutter/material.dart';

import 'package:travel_app/Pages/navpages/bar_item_page.dart';
import 'package:travel_app/Pages/navpages/home_page.dart';
import 'package:travel_app/Pages/navpages/my_page.dart';
import 'package:travel_app/Pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navIndex = 0;

  final List navBarScreens = const [
    HomeScreen(),
    BarItemScreen(),
    SearchScreen(),
    MyPageScreen(),
  ];

  void onTap(int index, context) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarScreens[navIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: navIndex,
        onTap: (value) => onTap(value, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
      ),
    );
  }
}
