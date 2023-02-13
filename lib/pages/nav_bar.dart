import 'package:flutter/material.dart';
import 'package:project_3/pages/Offers_page.dart';
import 'package:project_3/pages/food_page.dart';
import 'package:project_3/pages/profile_page.dart';
import 'package:project_3/pages/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final pages = [const FoodPage(), const SearchPage(), const OffersPage(), const ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant, color: Colors.grey), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.grey), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.percent, color: Colors.grey), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.grey), label: 'Profile'),
        ],
        onTap: (newIndex) {
          currentIndex = newIndex;
          setState(() {});
        },
        currentIndex: currentIndex,
        fixedColor: Colors.grey,
      ),
    );
  }
}
