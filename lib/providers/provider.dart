import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  int _selectedValue = 0;
  int get selectedValue => _selectedValue;

  void getNext() {
    current = WordPair.random();
    notifyListeners();
    /* 
     👆 this makes sure that anything that's watching
      my app state is notified of the changes made
    */
  }

  List favourite = <WordPair>[];

  void toggleFavourite() {
    favourite.contains(current)
        ? favourite.remove(current)
        : favourite.add(current);
    notifyListeners();
  }

  void removeItem(dynamic toBeRemoved) {
    favourite.remove(toBeRemoved);
    notifyListeners();
  }

  void setTabValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }
}
