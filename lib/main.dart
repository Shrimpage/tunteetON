import 'dart:convert';
import 'kaavio.dart';
import 'arvio.dart';
import 'asetukset.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

Future<void> lahetaPisteetPalvelimelle(int pisteet) async {
  const String apiUrl = 'insertURL';

  final vastaus = await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode({'pisteet': pisteet}),
  );

  if (vastaus.statusCode == 200) {
    print("Pisteiden lähetys onnistui");
  }
}

Future<double> haeKeskiarvoPalvelimelta() async {
  const String apiUrl = 'insertURL';

  try {
    final vastaus = await http.get(Uri.parse(apiUrl));

    if (vastaus.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(vastaus.body);

      if (data.containsKey('keskiarvo')) {
        return double.tryParse(data['keskiarvo'].toString()) ?? 0.0;
      } else {
        print('Palvelimen vastaus ei sisältänyt tietoa: keskiarvo');
        return 0.0;
      }
    } else {
      print('Keskiarvon haku epäonnistui. Virhe: ${vastaus.reasonPhrase}');
      return 0.0;
    }
  }
  catch (e) {
    print('HTTP request epäonnistui: $e');
    return 0.0;
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

   @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hyvää päivää!', 
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Tänne databasesta ko. päivän mood valuet
                  Text('1', style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)), 
                  Text('2', style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                  Text('3', style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],     
      ),
    );
  }
}