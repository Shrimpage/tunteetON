import 'package:flutter/material.dart';

class Asetukset extends StatelessWidget {
  const Asetukset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Asetukset'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                    'Asetukset tänne sit:',
                    style: const TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 89, 151, 82),
    );
  }
}