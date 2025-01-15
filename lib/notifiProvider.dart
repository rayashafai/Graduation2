import 'package:flutter/material.dart';

class NotificationModel extends ChangeNotifier {
  final List<Map<String, String>> _notifications = [];

  List<Map<String, String>> get notifications => _notifications;

  void addNotification(String title, String message) {
    _notifications.add({'title': title, 'message': message});
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}
