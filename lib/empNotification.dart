import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiProvider.dart';

class EmpNotificationPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter notification title',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Notification Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter notification message',
              ),
              maxLines: 4,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Get the title and message
                  final title = titleController.text.trim();
                  final message = messageController.text.trim();

                  if (title.isNotEmpty && message.isNotEmpty) {
                    // Add notification to the model
                    Provider.of<NotificationModel>(context, listen: false)
                        .addNotification(title, message);

                    // Clear the text fields
                    titleController.clear();
                    messageController.clear();

                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Notification added!')),
                    );
                  } else {
                    // Show an error if fields are empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please enter both title and message')),
                    );
                  }
                },
                child: const Text(
                  'Send Notification',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
