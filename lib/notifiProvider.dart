import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  final List<Map<String, String>> _notifications = [];

  List<Map<String, String>> get notifications => _notifications;

  void addNotification(String title, String message, {required String source}) {
    _notifications.add({'title': title, 'message': message, 'source': source});
    notifyListeners();
  }

  void removeNotification(int index) {
    _notifications.removeAt(index);
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}
