import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiProvider.dart'; // Import NotificationModel

class NotificationPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Notifications'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3iTmD864-TR6jycdEDgdVEBk_f4uyf-kDGg&s',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    // Add search functionality here if needed
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Notifications...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true, // Ensures readability over background
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              // Notifications List
              Expanded(
                child: Consumer<NotificationModel>(
                  builder: (context, model, child) {
                    final notifications = model.notifications
                        .where((notification) =>
                            notification['source'] == 'empNotification')
                        .toList();

                    if (notifications.isEmpty) {
                      return const Center(
                        child: Text(
                          'No notifications yet',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.notifications,
                              color: Colors.purple,
                            ),
                            title: Text(
                              notification['title'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(notification['message'] ?? ''),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Delete the notification
                                Provider.of<NotificationModel>(context,
                                        listen: false)
                                    .removeNotification(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Notification deleted')),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
