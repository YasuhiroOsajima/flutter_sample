import 'package:flutter/material.dart';

class TableSort with ChangeNotifier {
  int currentSortColumn = 0;
  bool isAscending = true;

  void setSortColumn(int col) {
    currentSortColumn = col;
    notifyListeners();
  }

  void setAscending(bool asc) {
    isAscending = asc;
    notifyListeners();
  }
}
