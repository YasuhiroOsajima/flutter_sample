import 'dart:convert';
import 'package:flutter/material.dart';

import '../../models/chart.dart' as chart;
import '../../mock.dart' as mockJson;

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChaerDataList with ChangeNotifier {
  List<ChartData> chartDataList = [];

  ChaerDataList() {
    this.refresh();
  }

  Future<List<chart.Chart>> _loadMock() async {
    Map<String, dynamic> chartMap = await jsonDecode(mockJson.chart);

    List<chart.Chart> chartValueList = [];
    for (var cha in chartMap["chart"]) {
      chartValueList.add(chart.Chart(cha["name"], cha["value"]));
    }
    return chartValueList;
  }

  void refresh() {
    _loadMock().then(
      (chartValueList) {
        this.chartDataList = chartValueList
            .map((chartValue) =>
                ChartData(chartValue.name, chartValue.value, Colors.blue))
            .toList();
        notifyListeners();
      },
    );
  }
}
