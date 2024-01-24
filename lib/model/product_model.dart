// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'purchasePrice': purchasePrice,
      'salePrice': salePrice,
      'quantity': quantity,
      'soldQuantity': soldQuantity,
      'weightUnit': weightUnit,
      'addedAt': addedAt.millisecondsSinceEpoch,
      'expiryDate': expiryDate.millisecondsSinceEpoch,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      purchasePrice: map['purchasePrice'] as int,
      salePrice: map['salePrice'] as int,
      quantity: map['quantity'] as double,
      soldQuantity: map['soldQuantity'] as double,
      weightUnit: map['weightUnit'] as String,
      addedAt: DateTime.fromMillisecondsSinceEpoch(map['addedAt'] as int),
      expiryDate: DateTime.fromMillisecondsSinceEpoch(map['expiryDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
