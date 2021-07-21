import 'package:flutter/material.dart';

const FilterType = <String>['Name', 'Age', 'Role'];

class TableSearch with ChangeNotifier {
  String selectedKey = FilterType[0];

  void setSelectedKey(String key) {
    selectedKey = key;
    notifyListeners();
  }
}
