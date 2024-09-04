import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceList extends StatelessWidget {
  final List<Service> services;
  final Function(int) onDeleteService; // Ajoute cette ligne

  ServiceList({required this.services, required this.onDeleteService}); // Modifie le constructeur

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ListTile(
          title: Text(service.description),
          subtitle: Text('Quantité: ${service.quantity}, Prix unitaire: ${service.cost.toStringAsFixed(2)}€'),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDeleteService(index), // Appelle la fonction de suppression
          ),
        );
      },
    );
  }
}
