import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Kaavio extends StatelessWidget {
  Kaavio({super.key});

  List<FlSpot> chartData = [
    // use datetime values in double format as x values
    FlSpot(1, 1),
    FlSpot(2, 3),
    FlSpot(3, 5),
    FlSpot(4, 7),
    FlSpot(5, 4),
    FlSpot(6, 2),
    FlSpot(7, 5),
    FlSpot(8, 3),
    FlSpot(9, 2),
    FlSpot(10, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 49, 54, 56), // Set the background color here
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home_rounded, size: 35),
            color: Colors.white, 
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_reaction_rounded, size: 35),
            color: Colors.white, 
            onPressed: () {
              Navigator.pushNamed(context, '/arvio');
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded, size: 35),
            color: Colors.white, 
            onPressed: () {
            },
          ),
        ],
        ),
      ),
        appBar: AppBar(
          title: const Text('Kaavio 30 päivän keskiarvoista'),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 49, 54, 56),
          ),
          centerTitle: true,
        ),
        body: Container(
          
          color: const Color.fromARGB(255, 244, 246, 248),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 300,
        child: LineChart(
          LineChartData(borderData: FlBorderData(show: true), lineBarsData: [
            LineChartBarData(spots: chartData, isCurved: true, color: Colors.lightGreen, barWidth: 4), 
          ], backgroundColor: const Color.fromARGB(255, 49, 54, 56),
          ),
        ),
      ),
      ),
    );
  }
}