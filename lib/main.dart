import 'package:flutter/material.dart';
import 'screens/home_screens.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(DevisApp());
}

class DevisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devis',
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
