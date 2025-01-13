import 'package:flutter/material.dart';
import 'package:graduation2/empNotification.dart';
import 'package:graduation2/salary.dart';
import 'package:graduation2/vacations.dart';
import 'home.dart';
import 'profile.dart';
import 'viewTeam.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees Dashboard'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome, Employee!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 100, 78, 70),
                  ),
                ),
                const SizedBox(height: 20),
                _buildEmployeeCard(
                  icon: Icons.home,
                  color: const Color.fromARGB(255, 243, 3, 175),
                  title: 'Home',
                  description: 'Go to the home page.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    ); // Navigate to Home
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.money,
                  color: Colors.green,
                  title: 'My Salary',
                  description: 'View your salary details.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalaryPage()),
                    ); // Navigate to Salary Page
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.person,
                  color: Colors.orange,
                  title: 'Profile',
                  description: 'Update and view your profile.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    ); // Navigate to Profile Page
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.notifications,
                  color: Colors.purple,
                  title: 'Notifications',
                  description: 'View your notifications.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmpNotificationPage(
                          onSendNotification: (String title, String message) {
                            // Handle the notification logic here
                            print(
                                'Notification Sent: Title: $title, Message: $message');
                          },
                        ),
                      ),
                    );
// Navigate to Notifications Page
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.beach_access,
                  color: Colors.blue,
                  title: 'Employee Vacations',
                  description: 'View and manage your vacation requests.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VacationPage()),
                    ); // Navigate to Vacations Page
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.group,
                  color: Colors.brown,
                  title: 'View Team',
                  description: 'Check your team members.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewTeamPage()),
                    ); // Navigate to Team Page
                  },
                ),
                _buildEmployeeCard(
                  icon: Icons.logout,
                  color: Colors.red,
                  title: 'Log Out',
                  description: 'Sign out of your account.',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/welcome', // Define a route to the welcome page
                      (route) => false,
                    ); // Handle Logout
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmployeeCard({
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
        margin: const EdgeInsets.symmetric(vertical: 8.0),
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
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white70),
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
}
