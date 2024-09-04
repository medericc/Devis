import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devis_electricien/main.dart';

void main() {
  testWidgets('App démarrage test', (WidgetTester tester) async {
    await tester.pumpWidget(DevisApp());

    expect(find.text('Créer un devis'), findsOneWidget);
  });
}
