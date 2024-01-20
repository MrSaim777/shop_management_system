import 'dart:developer';

class Product {
  final int id;
  final String name;
  final String description;
  final int purchasePrice;
  final int salePrice;
  double quantity;
  double soldQuantity;
  final String weightUnit;
  final DateTime addedAt;
  final DateTime expiryDate;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.purchasePrice,
    required this.salePrice,
    required this.quantity,
    this.soldQuantity = 0.0,
    required this.weightUnit,
    required this.addedAt,
    required this.expiryDate,
  });

  // Method to increase the quantity
  void increaseSoldQuantity(double amount) {
    if (amount > 0 && soldQuantity > 0) {
      quantity += amount;
      soldQuantity -= amount;
    } else {
      log("Invalid quantity increase");
    }
  }

  // Method to decrease the quantity and increase sold quantity
  void decreaseSoldQuantity(double amount) {
    if (amount > 0 && amount <= quantity) {
      quantity -= amount;
      soldQuantity += amount; // Increase sold quantity
    } else {
      log("Invalid quantity decrease");
    }
  }
}
