import 'package:flutter/material.dart';
import 'dart:typed_data'; // For handling image bytes

// Define a FeedbackEntry class for managing feedback details
class FeedbackEntry {
  final Uint8List? imageBytes; // Image bytes for Flutter Web
  final String? comment; // Comment text
  final DateTime timestamp; // Timestamp for the feedback entry

  FeedbackEntry({
    this.imageBytes,
    this.comment,
    required this.timestamp,
  });
}

class CartModel extends ChangeNotifier {
  // Cart items
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  // Add a product to the cart
  void addItem(Map<String, dynamic> product) {
    _items.add(product);
    notifyListeners();
  }

  // Update quantity of a product in the cart
  void updateQuantity(Map<String, dynamic> item, int delta) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index]['quantity'] += delta;
      if (_items[index]['quantity'] <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Remove a product from the cart
  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }

  // Feedback list management
  final List<FeedbackEntry> _feedbackList = [];

  List<FeedbackEntry> get feedbackList => _feedbackList;

  // Add a feedback entry
  void addFeedback(FeedbackEntry feedback) {
    _feedbackList.add(feedback);
    notifyListeners();
  }

  // Calculate total price of cart items
  double get total {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item['price'] * item['quantity'];
    }
    return totalPrice;
  }
}
