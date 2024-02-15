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
                onPressed:() {}, // Tänne moodin lisääminen tietokantaan
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: Colors.red,
                ),
                child: const Text('1', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 49, 54, 56)))
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: Colors.orange,
                ),
                child: const Text('2', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: const Color.fromARGB(255, 144, 122, 96),
                ),
                child: const Text('3', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: Colors.grey,
                ),
                child: const Text('4', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: const Color.fromARGB(255, 158, 205, 162), 
                ),
                child: const Text('5', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150,150),
                  backgroundColor: Colors.lightGreen, 
                ),
                child: const Text('6', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 49, 54, 56)))
                ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed:() {},
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
}