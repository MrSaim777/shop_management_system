class Product {
  final String name;
  final String? desc;
  final int price;
  final double quantity;
  final String weightUnit;
  final DateTime dateTime;
  final DateTime expiryDate;
  Product({
    required this.name,
    this.desc,
    required this.price,
    required this.quantity,
    required this.weightUnit,
    required this.dateTime,
    required this.expiryDate,
  });
}
