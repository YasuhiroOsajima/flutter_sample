import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import '../../states/description_area/chart.dart' as chart_data;
import '../../models/chart.dart' as chart;
import '../../mock.dart' as mockJson;

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _chartDataList =
    //     context.select((chart_data.ChaerDataList store) => store.chartDataList);

    //debugPrint(_chartDataList2.toString());

    Future<List<chart.Chart>> _loadMock() async {
      Map<String, dynamic> chartMap = await jsonDecode(mockJson.chart);

      List<chart.Chart> chartValueList = [];
      for (var cha in chartMap["chart"]) {
        chartValueList.add(chart.Chart(cha["name"], cha["value"]));
      }
      return chartValueList;
    }

    // void refresh() {
    //   _loadMock().then(
    //     (chartValueList) {
    //       this._chartDataList = chartValueList
    //           .map((chartValue) => chart_data.ChartData(
    //               chartValue.name, chartValue.value, Colors.blue))
    //           .toList();
    //     },
    //   );
    // }
    Future<List<chart_data.ChartData>> refresh() async {
      var chartValueList = await _loadMock();
      var chartDataList = chartValueList
          .map((chartValue) => chart_data.ChartData(
              chartValue.name, chartValue.value, Colors.blue))
          .toList();
      return chartDataList;
    }

    // final List<chart_data.ChartData> _chartDataList = [
    //   chart_data.ChartData('David', 25, Colors.blue),
    //   chart_data.ChartData('Steve', 38, Colors.blue),
    //   chart_data.ChartData('Jack', 34, Colors.blue),
    //   chart_data.ChartData('Others', 52, Colors.blue)
    // ];

    return FutureBuilder(
      future: refresh(),
      builder: (BuildContext context,
          AsyncSnapshot<List<chart_data.ChartData>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return new SfCircularChart(
            title: ChartTitle(text: 'Half yearly sales analysis'),
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<chart_data.ChartData, String>(
                dataSource: snapshot.data,
                xValueMapper: (chart_data.ChartData data, _) => data.x,
                yValueMapper: (chart_data.ChartData data, _) => data.y,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                // pointColorMapper: (chart_data.ChartData data, _) => data.color,
              )
            ],
          );
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
