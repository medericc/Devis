import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceForm extends StatefulWidget {
  final Function(Service) onAddService;

  ServiceForm({required this.onAddService});

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitService() {
    final service = Service(
      description: _descriptionController.text,
      cost: double.parse(_costController.text),
      quantity: int.parse(_quantityController.text),
    );
    widget.onAddService(service);
    _descriptionController.clear();
    _costController.clear();
    _quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(labelText: 'Description du service'),
        ),
        TextField(
          controller: _costController,
          decoration: InputDecoration(labelText: 'Prix unitaire'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _quantityController,
          decoration: InputDecoration(labelText: 'Quantité'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: _submitService,
          child: Text('Ajouter le service'),
        ),
      ],
    );
  }
}
