import 'package:baby_shop/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
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
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "person"),
          ]),
    );
  }
}
