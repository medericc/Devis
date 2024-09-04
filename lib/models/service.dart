class Service {
  final String description;
  final double cost;
  final int quantity;

  Service({
    required this.description,
    required this.cost,
    required this.quantity,
  });

  double get totalCost => cost * quantity;
}
