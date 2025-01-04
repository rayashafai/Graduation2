import 'package:flutter/material.dart';
import 'cart.dart'; // Import the CartPage
import 'whitemirror.dart';
import 'windowsmirror.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _onNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/'); // Navigate to Home
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(), // Navigate to CartPage
          ),
        );
        break;
      case 2:
        Navigator.pushNamed(context, '/search'); // Navigate to Search
        break;
      case 3:
        Navigator.pushNamed(context, '/profile'); // Navigate to Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Full categories list
    final categories = [
      {
        'name': 'White Mirrors',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaY3K6djcWZAtgxKUlwmUKTPpLCU83jPgb1w&s'
      },
      {
        'name': 'Windows Mirrors',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN4_KkqhJ9_vBwlmrjgX7OTXun713--lBEng&s'
      },
      {
        'name': 'Illuminated Mirrors',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTULpZOkQUEdb8AafAUfp5OtALfwV7PshgVJg&s'
      },
      {
        'name': 'Handmade',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjq5dY4dhxB7NL0pE74OIjVmU9qpyQY-9qdg&s'
      },
      {
        'name': 'Vibrant Designs',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStt2OxQGPRMjvWlmfvFUfLaWdhFVK0J-ahBw&s'
      },
      {
        'name': 'Best Seller',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTokHuuv9z1--2oN4L8_3RtPuG3Xe6bznzXjw&s'
      },
      {
        'name': 'Table Lamp',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3gH08DjcJ5fVDh9y6z_8vV2nSEy0G9Rld0w&s'
      },
      {
        'name': 'Decor',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwpHthu_S4zlfG5a49oglfC_-6ryLiSghZiA&s'
      },
      {
        'name': 'Skmlat',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDvjFYr-T7Ec1PqTAuGWMSx5CEgBfkOninJQ&s'
      },
      {
        'name': 'Modern Mirrors',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY1S6C-2jj-qZU0a2_ARxqHewwfc5623k3zQ&s'
      },
      {
        'name': 'Natural Wood',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXWsD9UYCh04MN1lGhiwsCiJjavrUSF8VzYw&s'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.brown[400],
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown[400],
              ),
              accountName: const Text(
                'Customer Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: const Text('customer@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.brown),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title:
                  const Text('Profile', style: TextStyle(color: Colors.brown)),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.brown)),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title:
                  const Text('Log Out', style: TextStyle(color: Colors.brown)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  // Add search functionality here if needed
                },
              ),
            ),
            // Category List
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: Image.network(
                        categories[index]['image']!,
                        width: 100, // Width for the image
                        height: 100, // Height for the image
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        categories[index]['name']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          if (categories[index]['name'] == 'White Mirrors') {
                            // Navigate to ViewProductsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WhiteMirrorPage(),
                              ),
                            );
                          } else if (categories[index]['name'] ==
                              'Windows Mirrors') {
                            // Navigate to ViewProductsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WindowsMirrorPage(),
                              ),
                            );
                          } // Handle navigation based on category
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[400],
                        ),
                        child: const Text(
                          'View',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set active index to 1
        onTap: (index) => _onNavBarTap(context, index),
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Changed icon to Cart
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
