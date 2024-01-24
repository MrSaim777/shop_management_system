// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'dart:developer';

import 'package:shop_management/utils/flush_bar.dart';

class ProductRepo {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;
  ProductRepo({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  Future<void> addProduct(Product product) {
    CollectionReference productCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser!.email)
        .collection('products');

    return productCollection
        .add({
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

  // getProducts(){
  //    CollectionReference productCollection = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(firebaseAuth.currentUser!.email)
  //       .collection('products');
  //       productCollection.get()
  // }
}
