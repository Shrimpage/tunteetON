import 'package:flutter/material.dart';

class Arvio extends StatelessWidget {
  const Arvio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Arvio'),
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
      backgroundColor: Color.fromARGB(255, 202, 175, 65),
    );
  }
}