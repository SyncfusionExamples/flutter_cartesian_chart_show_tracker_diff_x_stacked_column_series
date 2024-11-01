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
      home: _ShowTracker(),
    );
  }
}

class _ShowTracker extends StatefulWidget {
  _ShowTracker({super.key});

  @override
  _ShowTrackerState createState() => _ShowTrackerState();
}

class _ShowTrackerState extends State<_ShowTracker> {
  List<ChartSampleData> stackedColumnData1 = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 35),
    ChartSampleData(DateTime(2023, 02, 02, 06), 28),
    ChartSampleData(DateTime(2023, 02, 02, 08), 34),
  ];
  List<ChartSampleData> stackedColumnData2 = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 35),
    ChartSampleData(DateTime(2023, 02, 02, 06), 28),
    ChartSampleData(DateTime(2023, 02, 02, 07), 34),
  ];
  List<ChartSampleData> stackedColumnData3 = [
    ChartSampleData(DateTime(2023, 02, 02, 06), 35),
    ChartSampleData(DateTime(2023, 02, 02, 07), 28),
    ChartSampleData(DateTime(2023, 02, 02, 09), 120),
  ];
  List<ChartSampleData> columnData = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 0),
    ChartSampleData(DateTime(2023, 02, 02, 06), 0),
    ChartSampleData(DateTime(2023, 02, 02, 07), 0),
    ChartSampleData(DateTime(2023, 02, 02, 08), 0),
    ChartSampleData(DateTime(2023, 02, 02, 09), 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        enableSideBySideSeriesPlacement: false,
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: const NumericAxis(),
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
        ),
        series: <CartesianSeries<ChartSampleData, DateTime>>[
          ColumnSeries<ChartSampleData, DateTime>(
            dataSource: columnData,
            xValueMapper: (ChartSampleData data, int index) => data.x,
            yValueMapper: (ChartSampleData data, int index) => data.y,
            isVisibleInLegend: false,
            isTrackVisible: true,
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: stackedColumnData1,
            xValueMapper: (ChartSampleData data, int index) => data.x,
            yValueMapper: (ChartSampleData data, int index) => data.y,
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: stackedColumnData2,
            xValueMapper: (ChartSampleData data, int index) => data.x,
            yValueMapper: (ChartSampleData data, int index) => data.y,
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: stackedColumnData3,
            xValueMapper: (ChartSampleData data, int index) => data.x,
            yValueMapper: (ChartSampleData data, int index) => data.y,
          ),
        ],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.y);

  final DateTime x;
  final double y;
}
