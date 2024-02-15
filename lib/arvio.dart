import 'package:flutter/material.dart';
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
      
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                    'Arvio tänne sit:',
                    style: const TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 244, 246, 248),
    );
  }
}