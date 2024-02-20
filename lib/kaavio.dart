import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<FlSpot>> getMoods() async {
  const String apiUrl = 'https://flask-server-mu.vercel.app/get_moods';

  try {
    final vastaus = await http.get(Uri.parse(apiUrl));

    if (vastaus.statusCode == 200) {
      final Map<String, dynamic> response = jsonDecode(vastaus.body);
      final List<dynamic> data = response['data'];
      final List<FlSpot> moods = [];

      int index = 0;
      for (final mood in data) {
        if (mood.containsKey('value')) {
          moods.add(FlSpot(index.toDouble(), double.tryParse(mood['value'].toString()) ?? 0.0));
          index++;
        } else {
          print('Palvelimen vastaus ei sisältänyt tietoa: mood');
          return [];
        }
      }
      return moods;
    } else {
      print('Keskiarvon haku epäonnistui. Virhe: ${vastaus.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('HTTP request epäonnistui: $e');
    return [];
  }
}

class Kaavio extends StatefulWidget {
  Kaavio({Key? key}) : super(key: key);

  @override
  _KaavioState createState() => _KaavioState();
}

class _KaavioState extends State<Kaavio> {
  List<FlSpot> chartData = [];

  @override
  void initState() {
    super.initState();
    populateChartData();
  }

  void populateChartData() async {
    List<FlSpot> data = await getMoods();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 49, 54, 56),
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
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Palvelimelta haetut tunnearvot'),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 49, 54, 56),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Color.fromARGB(255, 126, 124, 124),
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
