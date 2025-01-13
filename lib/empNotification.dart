import 'package:flutter/material.dart';

class EmpNotificationPage extends StatefulWidget {
  final void Function(String title, String message) onSendNotification;

  const EmpNotificationPage({Key? key, required this.onSendNotification})
      : super(key: key);

  @override
  _EmpNotificationPageState createState() => _EmpNotificationPageState();
}

class _EmpNotificationPageState extends State<EmpNotificationPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _sendNotification() {
    final title = titleController.text.trim();
    final message = messageController.text.trim();

    if (title.isNotEmpty && message.isNotEmpty) {
      widget.onSendNotification(title, message);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification sent to admin!')),
      );
      titleController.clear();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Notifications'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Send Notification to Admin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Notification Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Notification Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendNotification,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
