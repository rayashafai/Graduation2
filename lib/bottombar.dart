import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Highlight the current tab
      onTap: onTap,
      backgroundColor: Colors.brown[400], // Set the background color
      selectedItemColor:
          Colors.white, // Change the selected item color to white
      unselectedItemColor: Colors.grey, // Set unselected item color to grey
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), // Changed to shopping cart icon
          label: 'Cart', // Correct label for cart
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Profile',
        ),
      ],
    );
  }
}
