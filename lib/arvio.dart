import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'main.dart';
import 'kaavio.dart';

int moodsSent = 0;

class Arvio extends StatelessWidget {
  Arvio({super.key});
  int mood = 0;
  int moodsPerDay = 3;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Arvioi tunnetilasi: ',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 49, 54, 56)),
              ),
          const SizedBox(height: 200),
          Container(
            height: 200,        
            child: ListWheelScrollViewX(
              itemExtent: 150,
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mood = 1;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('1', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 2;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('2', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 3;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: const Color.fromARGB(255, 144, 122, 96),
                  ),
                  child: const Text('3', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 4;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('4', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 5;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: const Color.fromARGB(255, 158, 205, 162), 
                  ),
                  child: const Text('5', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 6;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: Colors.lightGreen, 
                  ),
                  child: const Text('6', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed:() {
                    mood = 7;
                    _dialogBuilder(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150,150),
                    backgroundColor: Colors.green, 
                  ),
                  child: const Text('7', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                  ),
              ]),
            ),
          ],    
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 246, 248),
    );
  }
  Future<void> _dialogBuilder(BuildContext context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: const Text('Vahvista tunnetila'),
        content: Text('Vahvistetaanko tunnetila $mood?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Peruuta'),
          ),
          TextButton(
            onPressed: () {
              if (moodsSent < moodsPerDay) {
                sendMoods(mood);
                Navigator.of(context).pop();
                print('Moods per day: $moodsPerDay');
                moodsSent++;
                print('Moods sent: $moodsSent');
              }
              else {
                Navigator.of(context).pop();
                print("Ei lähetetty");
              }
            },
            child: const Text('Vahvista'),
          ),
        ]
      );
    });
  }
  Future<void> sendMoods(int mood) async {
  const String apiUrl = 'https://flask-server-mu.vercel.app/send_moods';

  final vastaus = await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode({'moods': mood}),
  );

  if (vastaus.statusCode == 200) {
    print("Pisteiden lähetys onnistui");
  }
}
}