import 'package:flutter/material.dart';

class ManageContentPage extends StatelessWidget {
  const ManageContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Content'),
        backgroundColor: const Color.fromARGB(255, 15, 103, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Content Management',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 15, 103, 94),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildContentItem(
                    title: 'Post 1',
                    description: 'Description for Post 1',
                    onEdit: () {
                      // Handle Edit Post 1
                    },
                    onDelete: () {
                      // Handle Delete Post 1
                    },
                  ),
                  _buildContentItem(
                    title: 'Post 2',
                    description: 'Description for Post 2',
                    onEdit: () {
                      // Handle Edit Post 2
                    },
                    onDelete: () {
                      // Handle Delete Post 2
                    },
                  ),
                  _buildContentItem(
                    title: 'Post 3',
                    description: 'Description for Post 3',
                    onEdit: () {
                      // Handle Edit Post 3
                    },
                    onDelete: () {
                      // Handle Delete Post 3
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Add New Content Page
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                'Add New Content',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 103, 94),
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build content items
  Widget _buildContentItem({
    required String title,
    required String description,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Color.fromARGB(255, 15, 103, 94)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 3, 196, 249)),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
