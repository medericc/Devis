import 'package:flutter/material.dart';
import 'generate_devis_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Devis Électricien')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenerateDevisScreen()),
            );
          },
          child: Text('Créer un devis'),
        ),
      ),
    );
  }
}
