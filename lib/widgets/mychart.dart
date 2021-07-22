import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SearchSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Colors.blue),
      ChartData('Steve', 38, Colors.blue),
      ChartData('Jack', 34, Colors.blue),
      ChartData('Others', 52, Colors.blue)
    ];

    return SfCircularChart(
      title: ChartTitle(text: 'Half yearly sales analysis'),
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        // Render pie chart
        PieSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          //pointColorMapper: (ChartData data, _) => data.color,
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
