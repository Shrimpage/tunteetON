import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Kaavio extends StatelessWidget {
  Kaavio({super.key});
  List<FlSpot> chartData = [
  FlSpot(0, 1),
  FlSpot(1, 3),
  FlSpot(2, 10),
  FlSpot(3, 7),
  FlSpot(4, 12),
  FlSpot(5, 13),
  FlSpot(6, 17),
  FlSpot(7, 15),
  FlSpot(8, 20),
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Educative Line Chart Answer'),
        ),
        body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 300,
        child: LineChart(
          LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
            LineChartBarData(spots: chartData, isCurved: true, color: Colors.amber),
          ]),
        ),
),
      ),
    );
  }
}
