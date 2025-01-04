import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Column(
            children: [
              // Header section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.8),
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://example.com/your-profile-image-url.jpg',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sabrina Aryan',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'SabrinaAry208@gmail.com',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/editProfile');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 90, 63, 53),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Options section
              Expanded(
                child: ListTileTheme(
                  horizontalTitleGap: 80.0,
                  child: ListView(
                    children: [
                      _buildListTile(Icons.favorite, "Favourites", context),
                      _buildListTile(Icons.download, "Downloads", context),
                      const Divider(color: Colors.brown),
                      _buildListTile(Icons.language, "Languages", context),
                      _buildListTile(Icons.location_on, "Location", context),
                      _buildListTile(
                          Icons.subscriptions, "Subscription", context),
                      _buildListTile(
                          Icons.display_settings, "Display", context),
                      const Divider(color: Colors.brown),
                      _buildListTile(Icons.delete, "Clear Cache", context,
                          iconColor: Colors.red),
                      _buildListTile(Icons.history, "Clear History", context,
                          iconColor: Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart'); // Navigate to cart
              break;
            case 2:
              Navigator.pushNamed(context, '/search');
              break;
            case 3:
              // Stay on the current page
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Changed to shopping cart
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

  Widget _buildListTile(IconData icon, String title, BuildContext context,
      {Color iconColor = const Color.fromARGB(255, 90, 63, 53)}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 145, 102, 87),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Colors.brown),
      onTap: () {
        _navigateToPage(context, title);
      },
    );
  }

  void _navigateToPage(BuildContext context, String title) {
    switch (title) {
      case "Favourites":
        Navigator.pushNamed(context, '/favourites');
        break;
      case "Downloads":
        Navigator.pushNamed(context, '/downloads');
        break;
      case "Languages":
        Navigator.pushNamed(context, '/languages');
        break;
      case "Location":
        Navigator.pushNamed(context, '/location');
        break;
      case "Subscription":
        Navigator.pushNamed(context, '/subscription');
        break;
      case "Display":
        Navigator.pushNamed(context, '/display');
        break;
      case "Clear Cache":
        Navigator.pushNamed(context, '/clearCache');
        break;
      case "Clear History":
        Navigator.pushNamed(context, '/clearHistory');
        break;
      default:
        break;
    }
  }
}
