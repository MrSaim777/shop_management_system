// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'dart:developer';

import 'package:shop_management/utils/flush_bar.dart';

class ProductRepo {
  CollectionReference productCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('Products');

  CollectionReference outOfStockProductsCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('OOS_Products');

  Future<void> addProduct(Product product) {
    return productCollection
        .doc(product.id.toString())
        .set({
          'id': product.id,
          'name': product.name,
          'description': product.description,
          'purchasePrice': product.purchasePrice,
          'salePrice': product.salePrice,
          'quantity': product.quantity,
          'soldQuantity': product.soldQuantity,
          'weightUnit': product.weightUnit,
          'addedAt': product.addedAt.millisecondsSinceEpoch,
          'expiryDate': product.expiryDate.millisecondsSinceEpoch,
        })
        .then((value) => showSuccessMessage(ConstantStrings.productAdded))
        .catchError((error) {
          showFailureMessage("Failed to add product: $error");
          log("Failed to add product: $error");
        });
  }

  Future<void> updateProduct(Product product) {
    return productCollection
        .doc(product.id.toString())
        .update({
          'id': product.id,
          'name': product.name,
          'description': product.description,
          'purchasePrice': product.purchasePrice,
          'salePrice': product.salePrice,
          'quantity': product.quantity,
          'soldQuantity': product.soldQuantity,
          'weightUnit': product.weightUnit,
          'addedAt': product.addedAt.millisecondsSinceEpoch,
          'expiryDate': product.expiryDate.millisecondsSinceEpoch,
        })
        .then((value) => showSuccessMessage(ConstantStrings.productAdded))
        .catchError((error) {
          showFailureMessage("Failed to add product: $error");
          log("Failed to add product: $error");
        });
  }

  Future<void> updateQuantity(
      Product product, double soldQuantity, double quantity) {
    return productCollection.doc(product.id.toString()).update({
      'id': product.id,
      'name': product.name,
      'description': product.description,
      'purchasePrice': product.purchasePrice,
      'salePrice': product.salePrice,
      'quantity': quantity,
      'soldQuantity': soldQuantity,
      'weightUnit': product.weightUnit,
      'addedAt': product.addedAt.millisecondsSinceEpoch,
      'expiryDate': product.expiryDate.millisecondsSinceEpoch,
    }).then(
        (value) => log("product updated: ${ConstantStrings.productUpdated}"));
  }

  // getProducts(){
  //    CollectionReference productCollection = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(firebaseAuth.currentUser!.email)
  //       .collection('products');
  //       productCollection.get()
  // }
}
