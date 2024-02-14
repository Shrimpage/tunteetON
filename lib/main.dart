import 'dart:convert';
import 'kaavio.dart';
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
        '/kaavio': (context) => const Kaavio(),
      },
    );
  }
}
 
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Arvioi palvelu")),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < -200) {
            Navigator.pushNamed(context, '/kaavio');
          }
        },
        child: Container(
          color: Colors.blueGrey,
          child: ArviointiNakyma(),
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
  int pisteetYhteensa = 0;
  int pisteitaAnnettu = 0;
  double keskiarvo = 0;

  var url = Uri.https('example.com', 'whatsit/create');

  void laskePisteet(int pisteet) {
    setState(() {
      pisteetYhteensa += pisteet;
      pisteitaAnnettu += 1;
      keskiarvo = pisteetYhteensa/pisteitaAnnettu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<double>(
              future: haeKeskiarvoPalvelimelta(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(
                    'Keskiarvo: ${snapshot.data?.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24),
                  );
                }
              },
            ),
            const SizedBox(height:20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildArviointiButton(1, Colors.red),
                buildArviointiButton(2, Colors.orange),
                buildArviointiButton(3, Color.fromARGB(255, 255, 191, 0)),
                buildArviointiButton(4, Colors.yellow),
                buildArviointiButton(5, const Color.fromARGB(255, 134, 255, 59)),
                buildArviointiButton(6, Color.fromARGB(255, 121, 255, 59)),
                buildArviointiButton(7, Colors.green)
              ],
            )
          ],
        ),
      );   
  }
  Widget buildArviointiButton(int pisteet, Color vari) {
    return ElevatedButton(
      onPressed:() {
        laskePisteet(pisteet);
        lahetaPisteetPalvelimelle(pisteet);
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: vari
      ),
      child:Text('$pisteet pistettä'),
    );
  }
}