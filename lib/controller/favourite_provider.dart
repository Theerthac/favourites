import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;

  void addItems(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

   void removeItems(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
