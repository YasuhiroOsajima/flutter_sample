import 'package:flutter/material.dart';

class RowSelected with ChangeNotifier {
  final selectedIndex = <int>[];

  bool isSelected(int index) {
    return this.selectedIndex.contains(index);
  }

  void setSelectedIndex(int idx) {
    if (this.selectedIndex.contains(idx)) {
      this.selectedIndex.remove(idx);
    } else {
      this.selectedIndex.add(idx);
    }
    notifyListeners();
  }
}
