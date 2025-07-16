import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  List<Map<String, dynamic>> get items => _items;

  void add(Map<String, dynamic> product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get total =>
      _items.fold(0, (sum, item) => sum + (item['price'] as double));
}

final cart = CartModel();
