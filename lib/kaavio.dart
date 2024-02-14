import 'package:flutter/material.dart';

class Kaavio extends StatelessWidget {
  const Kaavio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Kaavio'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                    'Keskiarvo:',
                    style: const TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
      
    );
  }
}