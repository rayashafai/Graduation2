import 'package:flutter/material.dart';
import 'manageusers.dart';
import 'managecontent.dart';
import 'notification.dart';
import 'setting.dart';
import 'package:provider/provider.dart'; // Provider for state management
import 'notifiProvider.dart'; // Import NotificationProvider

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.brown[400],
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome, Admin!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 100, 78, 70),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    // Manage Users Card
                    _buildAdminCard(
                      icon: Icons.people,
                      color: const Color.fromARGB(255, 195, 118, 2),
                      title: 'Manage Users',
                      description: 'View and manage user accounts.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ManageUsersPage(),
                          ),
                        );
                      },
                    ),
                    // Manage Content Card
                    _buildAdminCard(
                      icon: Icons.content_copy,
                      color: const Color.fromARGB(255, 13, 103, 94),
                      title: 'Manage Content',
                      description: 'Review and update app content.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ManageContentPage(),
                          ),
                        );
                      },
                    ),
                    // Settings Card
                    _buildAdminCard(
                      icon: Icons.settings,
                      color: Colors.blue,
                      title: 'Settings',
                      description: 'Change app settings and configurations.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                    ),
                    // Notifications Card
                    _buildAdminCard(
                      icon: Icons.notifications,
                      color: Colors.purple,
                      title: 'Notifications',
                      description: 'Send and view notifications.',
                      onTap: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                    ),
                    // Reports Card
                    _buildAdminCard(
                      icon: Icons.bar_chart,
                      color: const Color.fromARGB(255, 254, 31, 150),
                      title: 'View Reports',
                      description: 'Analyze app reports and statistics.',
                      onTap: () {
                        // Navigate to Reports Page
                      },
                    ),
                    // Logout Card
                    _buildAdminCard(
                      icon: Icons.logout,
                      color: Colors.red,
                      title: 'Logout',
                      description: 'Log out of the admin dashboard.',
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/welcome',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build reusable Admin Cards
  Widget _buildAdminCard({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
