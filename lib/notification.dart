import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Notifications'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Notifications...',
                prefixIcon: Icon(Icons.search, color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                // Handle search
              },
            ),
            const SizedBox(height: 20),
            // Notifications List
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example data count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.purple,
                        size: 30,
                      ),
                      title: Text(
                        'Notification Title $index',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'This is a brief description of the notification content.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red[400]),
                        onPressed: () {
                          // Handle delete notification
                        },
                      ),
                      onTap: () {
                        // View notification details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button to Send New Notification
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to Send Notification Page
          showDialog(
            context: context,
            builder: (context) => _buildNewNotificationDialog(context),
          );
        },
        backgroundColor: Colors.purple,
        icon: const Icon(Icons.add),
        label: const Text('Send Notification'),
      ),
    );
  }

  // Dialog for Creating a New Notification
  Widget _buildNewNotificationDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return AlertDialog(
      title: const Text('New Notification'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter notification title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Message'),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter notification message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle sending notification
            final title = titleController.text;
            final message = messageController.text;
            if (title.isNotEmpty && message.isNotEmpty) {
              // Send notification logic
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notification Sent: $title')),
              );
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All fields are required')),
              );
            }
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}
