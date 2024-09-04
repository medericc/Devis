import 'service.dart';

class Devis {
  final String clientName;
  final String clientAddress;
  final List<Service> services;

  Devis({
    required this.clientName,
    required this.clientAddress,
    required this.services,
  });

  double get total {
    return services.fold(0, (sum, item) => sum + item.totalCost);
  }
}
