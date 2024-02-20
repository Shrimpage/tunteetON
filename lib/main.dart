import 'dart:convert';
import 'kaavio.dart';
import 'arvio.dart';
import 'asetukset.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

Future<List<double>> getMoods() async {
  const String apiUrl = 'https://flask-server-mu.vercel.app/get_moods';

  try {
    final vastaus = await http.get(Uri.parse(apiUrl));

    if (vastaus.statusCode == 200) {
      final Map<String, dynamic> response = jsonDecode(vastaus.body);
      final List<dynamic> data = response['data'];
      final List<double> moods = [];

      for (final mood in data) {
        if (mood.containsKey('value')) {
          moods.add(double.tryParse(mood['value'].toString()) ?? 0.0);
        }
        else {
          print('Palvelimen vastaus ei sisältänyt tietoa: value');
          return [];
        }
      }
      return moods;
    } else {
      print('moodien haku epäonnistui. Virhe: ${vastaus.reasonPhrase}');
      return [];
    }
  }
  catch (e) {
    print('HTTP request epäonnistui: $e');
    return [];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHome(),
        '/kaavio': (context) =>  Kaavio(),
        '/arvio': (context) => Arvio(),
        '/asetukset': (context) => const Asetukset(),
      },
    );
  }
}


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 244, 246, 248),
        child: ArviointiNakyma(),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 49, 54, 56),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/asetukset');
        },
        child: const Icon(Icons.settings_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 49, 54, 56), // Set the background color here
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home_rounded, size: 35),
            color: Colors.white, 
            onPressed: () {},
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
              Navigator.pushNamed(context, '/kaavio');
            },
          ),
        ],
        ),
      ),
    );
  }
}




class ArviointiNakyma extends StatefulWidget {
  @override
  _ArviointiNakymaTila createState() => _ArviointiNakymaTila();
}


class _ArviointiNakymaTila extends State<StatefulWidget> {
  List<double> moods = [];

  @override
    void initState() {
      super.initState();
      getMoods().then((value) {
        setState(() {
          moods = value;
        });
      });
    }
   @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hyvää päivää!', 
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 49, 54, 56),
            ),
          ),
          SizedBox(height: 100),
          const Text(
            'Tunnetilasi tänään:', 
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Arial',
              color: Color.fromARGB(255, 49, 54, 56),
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 300, 
              height: 120, 
              color: const Color.fromARGB(255, 209, 211, 213),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (moods.length >= 3)
                    for (var i = moods.length -3; i < moods.length; i++) 
                      Text(moods[i].toString(), style: const TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],     
      ),
    );
  }
}

