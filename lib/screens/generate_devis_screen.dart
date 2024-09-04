import 'package:flutter/material.dart';
import '../models/devis.dart';
import '../models/service.dart';
import '../utils/pdf_generator.dart';
import '../widgets/service_form.dart';
import '../widgets/service_list.dart';

class GenerateDevisScreen extends StatefulWidget {
  @override
  _GenerateDevisScreenState createState() => _GenerateDevisScreenState();
}

class _GenerateDevisScreenState extends State<GenerateDevisScreen> {
  final _formKey = GlobalKey<FormState>();
  final _services = <Service>[];

  final _clientNameController = TextEditingController();
  final _clientAddressController = TextEditingController();

  void _addService(Service service) {
    setState(() {
      _services.add(service);
    });
  }

  void _deleteService(int index) {
    setState(() {
      _services.removeAt(index);
    });
  }

  void _resetForm() {
    setState(() {
      _clientNameController.clear();
      _clientAddressController.clear();
      _services.clear();
    });
  }

  void _generatePDF() async {
    if (_formKey.currentState!.validate()) {
      final devis = Devis(
        clientName: _clientNameController.text,
        clientAddress: _clientAddressController.text,
        services: _services,
      );
      await generateDevisPDF(devis);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Générer un devis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _clientNameController,
                decoration: InputDecoration(labelText: 'Nom du client'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
              ),
              TextFormField(
                controller: _clientAddressController,
                decoration: InputDecoration(labelText: 'Adresse du client'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer une adresse' : null,
              ),
              ServiceForm(onAddService: _addService),
              Expanded(child: ServiceList(services: _services, onDeleteService: _deleteService)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: Text('Réinitialiser'),
                  ),
                  ElevatedButton(
                    onPressed: _generatePDF,
                    child: Text('Générer le PDF'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
