import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import '../../models/chart.dart' as chart;
import '../../mock.dart' as mockJson;

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<chart.Chart>> _loadMock() async {
      Map<String, dynamic> chartMap = await jsonDecode(mockJson.chart);

      List<chart.Chart> chartValueList = [];
      for (var cha in chartMap["chart"]) {
        chartValueList.add(chart.Chart(cha["name"], cha["value"]));
      }
      return chartValueList;
    }

    Future<List<ChartData>> refresh() async {
      var chartValueList = await _loadMock();
      var chartDataList = chartValueList
          .map((chartValue) =>
              ChartData(chartValue.name, chartValue.value, Colors.blue))
          .toList();
      return chartDataList;
    }

    TooltipBehavior tooltip = TooltipBehavior(
        enable: true,
        shouldAlwaysShow: true,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Text("€ ${data.y}", style: TextStyle(fontSize: 18)));
        });

    return FutureBuilder(
      future: refresh(),
      builder: (BuildContext context, AsyncSnapshot<List<ChartData>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return new SfCircularChart(
            title: ChartTitle(text: 'Half yearly sales analysis'),
            legend: Legend(isVisible: true),
            tooltipBehavior: tooltip,
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataSource: snapshot.data,
                enableTooltip: true,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                //dataLabelMapper: (ChartData data, _) => data.x,
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
