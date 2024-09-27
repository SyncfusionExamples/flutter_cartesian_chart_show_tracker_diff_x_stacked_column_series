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
  List<ChartSampleData> chartData1 = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 35),
    ChartSampleData(DateTime(2023, 02, 02, 06), 28),
    ChartSampleData(DateTime(2023, 02, 02, 08), 34),
  ];
  List<ChartSampleData> chartData2 = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 35),
    ChartSampleData(DateTime(2023, 02, 02, 06), 28),
    ChartSampleData(DateTime(2023, 02, 02, 07), 34),
  ];
  List<ChartSampleData> chartData3 = [
    ChartSampleData(DateTime(2023, 02, 02, 06), 35),
    ChartSampleData(DateTime(2023, 02, 02, 07), 28),
    ChartSampleData(DateTime(2023, 02, 02, 09), 120),
  ];
  List<ChartSampleData> chartData4 = [
    ChartSampleData(DateTime(2023, 02, 02, 05), 0),
    ChartSampleData(DateTime(2023, 02, 02, 06), 0),
    ChartSampleData(DateTime(2023, 02, 02, 07), 0),
    ChartSampleData(DateTime(2023, 02, 02, 08), 0),
    ChartSampleData(DateTime(2023, 02, 02, 09), 0),
  ];

  final List<Color> _paletteColors = [
    const Color.fromRGBO(6, 174, 224, 1),
    const Color.fromRGBO(99, 85, 199, 1),
    const Color.fromRGBO(49, 90, 116, 1),
    const Color.fromRGBO(255, 180, 0, 1),
    const Color.fromRGBO(150, 60, 112, 1),
    const Color.fromRGBO(33, 150, 245, 1),
    const Color.fromRGBO(71, 59, 137, 1),
    const Color.fromRGBO(236, 92, 123, 1),
    const Color.fromRGBO(59, 163, 26, 1),
    const Color.fromRGBO(236, 131, 23, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Syncfusion Flutter Chart',
        ),
      ),
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
            dataSource: chartData4,
            xValueMapper: (ChartSampleData sales, _) => sales.year,
            yValueMapper: (ChartSampleData sales, _) => sales.sales,
            isVisibleInLegend: false,
            isTrackVisible: true,
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: chartData1,
            xValueMapper: (ChartSampleData sales, _) => sales.year,
            yValueMapper: (ChartSampleData sales, int index) => sales.sales,
            name: 'Chart 1',
            color: _paletteColors[0],
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: chartData2,
            xValueMapper: (ChartSampleData sales, _) => sales.year,
            yValueMapper: (ChartSampleData sales, _) => sales.sales,
            name: 'Chart 2',
            color: _paletteColors[1],
          ),
          StackedColumnSeries<ChartSampleData, DateTime>(
            dataSource: chartData3,
            xValueMapper: (ChartSampleData sales, _) => sales.year,
            yValueMapper: (ChartSampleData sales, _) => sales.sales,
            name: 'Chart 3',
            color: _paletteColors[2],
          ),
        ],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.year, this.sales);

  final DateTime? year;
  final double? sales;
}
