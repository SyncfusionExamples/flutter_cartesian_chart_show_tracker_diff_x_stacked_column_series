import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const _ShowTracker(),
    );
  }
}

class _ShowTracker extends StatefulWidget {
  const _ShowTracker({super.key});

  @override
  _ShowTrackerState createState() => _ShowTrackerState();
}

class _ShowTrackerState extends State<_ShowTracker> {
  List<ChartData> stackedColumnData1 = [
    ChartData(DateTime(2023, 02, 02, 05), 35),
    ChartData(DateTime(2023, 02, 02, 06), 28),
    ChartData(DateTime(2023, 02, 02, 08), 34),
  ];
  List<ChartData> stackedColumnData2 = [
    ChartData(DateTime(2023, 02, 02, 05), 35),
    ChartData(DateTime(2023, 02, 02, 06), 28),
    ChartData(DateTime(2023, 02, 02, 07), 34),
  ];
  List<ChartData> stackedColumnData3 = [
    ChartData(DateTime(2023, 02, 02, 06), 35),
    ChartData(DateTime(2023, 02, 02, 07), 28),
    ChartData(DateTime(2023, 02, 02, 09), 120),
  ];
  List<ChartData> columnData = [
    ChartData(DateTime(2023, 02, 02, 05), 0),
    ChartData(DateTime(2023, 02, 02, 06), 0),
    ChartData(DateTime(2023, 02, 02, 07), 0),
    ChartData(DateTime(2023, 02, 02, 08), 0),
    ChartData(DateTime(2023, 02, 02, 09), 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: const NumericAxis(),
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
        ),
        enableSideBySideSeriesPlacement: false,
        series: <CartesianSeries<ChartData, DateTime>>[
          ColumnSeries<ChartData, DateTime>(
            dataSource: columnData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            isVisibleInLegend: false,
            isTrackVisible: true,
          ),
          StackedColumnSeries<ChartData, DateTime>(
            dataSource: stackedColumnData1,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
          ),
          StackedColumnSeries<ChartData, DateTime>(
            dataSource: stackedColumnData2,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
          ),
          StackedColumnSeries<ChartData, DateTime>(
            dataSource: stackedColumnData3,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final DateTime x;
  final double y;
}
