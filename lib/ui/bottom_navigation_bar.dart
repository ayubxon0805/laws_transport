import 'package:flutter/material.dart';
import 'package:laws_transport/ui/pages/home_screen.dart';
import 'package:laws_transport/ui/pages/profile_page.dart';
import 'package:laws_transport/ui/pages/search_screen.dart';
import 'package:laws_transport/ui/pages/settinges_page.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _currentIndex = 0;
  List<Widget> body = [
    const HomeScreen(),
    const SearchScreen(),
    const SettingesPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: Colors.purple,
          selectedLabelStyle: TextStyle(
            color: Colors.purple,
          ),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  Icons.search,
                )),
            BottomNavigationBarItem(
                label: 'Settinges',
                icon: Icon(
                  Icons.settings,
                )),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person,
                )),
          ]),
    );
  }
}
