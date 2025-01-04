import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

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
}
