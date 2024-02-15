import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'main.dart';
import 'kaavio.dart';

class Arvio extends StatelessWidget {
  const Arvio({super.key});

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
        child: Container(
          height: 400,
          child: const ListWheelScrollViewX(itemExtent: 50,
          scrollDirection: Axis.horizontal,
          children: [ // Tähän buttonit jotka lähettää moodin databaseen
            Text('1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('4', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('6', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('7', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),      
          ])
          ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 246, 248),
    );
  }
}