import 'package:flutter/material.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample user data
    final List<Map<String, String>> users = [
      {'name': 'John Doe', 'email': 'john.doe@example.com'},
      {'name': 'Jane Smith', 'email': 'jane.smith@example.com'},
      {'name': 'Alice Brown', 'email': 'alice.brown@example.com'},
      {'name': 'Bob Johnson', 'email': 'bob.johnson@example.com'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        backgroundColor: const Color.fromARGB(255, 195, 118, 2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 195, 118, 2),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  user['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 195, 118, 2),
                  ),
                ),
                subtitle: Text(
                  user['email']!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 195, 118, 2),
                  ),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'View') {
                      _viewUser(context, user['name']!, user['email']!);
                    } else if (value == 'Edit') {
                      _editUser(context, user['name']!);
                    } else if (value == 'Delete') {
                      _deleteUser(context, user['name']!);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'View',
                      child: Text('View',
                          style: TextStyle(
                              color: Color.fromARGB(255, 195, 118, 2))),
                    ),
                    const PopupMenuItem(
                      value: 'Edit',
                      child: Text('Edit',
                          style: TextStyle(
                              color: Color.fromARGB(255, 195, 118, 2))),
                    ),
                    const PopupMenuItem(
                      value: 'Delete',
                      child: Text('Delete',
                          style: TextStyle(
                              color: Color.fromARGB(255, 195, 118, 2))),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _viewUser(BuildContext context, String name, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('User Details',
            style: TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
        content: Text('Name: $name\nEmail: $email',
            style: const TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close',
                style: TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
          ),
        ],
      ),
    );
  }

  void _editUser(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit user: $name (Feature coming soon!)'),
        backgroundColor: const Color.fromARGB(255, 195, 118, 2),
      ),
    );
  }

  void _deleteUser(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User',
            style: TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
        content: Text('Are you sure you want to delete $name?',
            style: const TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: Color.fromARGB(255, 195, 118, 2))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('User $name has been deleted.'),
                  backgroundColor: const Color.fromARGB(255, 195, 118, 2),
                ),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
