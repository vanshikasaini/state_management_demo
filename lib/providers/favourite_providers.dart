import 'package:flutter/material.dart';

class FavouritesProvider with ChangeNotifier{
  List<int> _selectedIcon= [];

  List<int> get selectedItem => _selectedIcon;

  void setSelectedItems(int value){
    _selectedIcon.add(value);
    notifyListeners();
  }
  void removeSelectedItems(int value){
    _selectedIcon.remove(value);
    notifyListeners();
  }
}