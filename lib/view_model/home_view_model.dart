import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_management/model/product.dart';
import 'package:shop_management/model/profit.dart';
import 'package:shop_management/repository/product_repo.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/flush_bar.dart';

class HomeViewModel extends ChangeNotifier {
  ProductRepo productRepo = ProductRepo();
  final Stream<QuerySnapshot> productsStream = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('Products')
      .snapshots();

  bool _isFloatingBtnPressed = false;
  bool get isFloatingBtnPressed => _isFloatingBtnPressed;
  bool _isSaveBtn = false;
  bool get isSaveBtn => _isSaveBtn;
  int _productAssetsIndex = 0;
  int get productAssetsIndex => _productAssetsIndex;

  final TextEditingController _productTextController = TextEditingController();
  TextEditingController get productTextController => _productTextController;

  final TextEditingController _assetTextController = TextEditingController();
  TextEditingController get assetTextController => _assetTextController;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _descController = TextEditingController();
  TextEditingController get descController => _descController;

  final TextEditingController _purchasePriceController =
      TextEditingController();
  TextEditingController get purchasePriceController => _purchasePriceController;

  final TextEditingController _salePriceController = TextEditingController();
  TextEditingController get salePriceController => _salePriceController;

  final TextEditingController _quantityController = TextEditingController();
  TextEditingController get quantityController => _quantityController;

  final TextEditingController _expiryDateController = TextEditingController();
  TextEditingController get expiryDateController => _expiryDateController;

  DateTime _expiryDate = DateTime(0);
  DateTime get expirtDate => _expiryDate;

  final List<Product> _inStockProductsList = [];
  List<Product> get inStockProductsList => _inStockProductsList;

  final List<Product> _outOfStockProductsList = [];
  List<Product> get outOfStockProductsList => _outOfStockProductsList;

  String selectedType = "";
  String selectedWeightUnit = "";
  List<String> weightUnits = [
    ConstantStrings.selectWeightUnit,
    ConstantStrings.kilograms,
    ConstantStrings.grams,
    ConstantStrings.liters,
    ConstantStrings.milliliters,
    ConstantStrings.pounds,
    ConstantStrings.ounces,
  ];
  List<String> dropDownItems = [
    ConstantStrings.selectType,
    ConstantStrings.product,
    ConstantStrings.asset
  ];

  selectWeight(String value) {
    selectedWeightUnit = value;
  }

  selectType(String value) {
    selectedType = value;
  }

  void increaseSoldQuantity(Product product, double amount) {
    if (amount > 0 && product.soldQuantity > 0) {
      product.quantity += amount;
      product.soldQuantity -= amount;
      productRepo.updateQuantity(
          product, product.soldQuantity, product.quantity);
      // productRepo.addProfit(Profit(
      //     expenses: product.salePrice - product.purchasePrice,
      //     income: product.salePrice - product.purchasePrice,
      //     profit: product.salePrice - product.purchasePrice,
      //     netProfit: product.salePrice - product.purchasePrice,
      //     date: DateTi));
    } else {
      log("Invalid quantity increase");
    }
  }

  void decreaseSoldQuantity(Product product, double amount) {
    if (amount > 0 && amount <= product.quantity) {
      product.quantity -= amount;
      product.soldQuantity += amount;
      productRepo.updateQuantity(
          product, product.soldQuantity, product.quantity);
    } else {
      log("Invalid quantity decrease");
    }

    if (product.quantity == 0) {
      //remove prod from stock and add in out of stock
    }
  }

  addToList(BuildContext context) {
    if (_nameController.text.isNotEmpty &&
        _purchasePriceController.text.isNotEmpty &&
        _salePriceController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        _expiryDateController.text.isNotEmpty) {
      final id = DateTime.now().millisecondsSinceEpoch;
      if (selectedWeightUnit.isEmpty) {
        showFlushBar(
            context: context, message: ConstantStrings.selectWeightUnit);
      } else {
        Navigator.pop(context);
        productRepo.addProduct(Product(
            id: id,
            name: _nameController.text,
            description: _descController.text,
            purchasePrice: int.parse(_purchasePriceController.text),
            salePrice: int.parse(_salePriceController.text),
            quantity: double.parse(_quantityController.text),
            weightUnit: selectedWeightUnit,
            addedAt: DateTime.now(),
            expiryDate: _expiryDate));
        clearValues();
        // notifyListeners();
      }
    } else {
      showFlushBar(
          context: context, message: ConstantStrings.allFieldsRequired);
    }
  }

  Stream<List<Product>> getProducts() {
    return productsStream.map((QuerySnapshot event) {
      List<Product> productList = [];
      for (var document in event.docs) {
        var pr = Product.fromMap(document.data() as Map<String, dynamic>);
        productList.add(pr);
      }
      return productList;
    });
  }

  toggle() {
    _isFloatingBtnPressed = !isFloatingBtnPressed;
    notifyListeners();
  }

  enableSaveBtn(String value) {
    if (value.isEmpty) {
      _isSaveBtn = false;
      notifyListeners();
    } else {
      _isSaveBtn = true;
      notifyListeners();
    }
  }

  selectProductAssetIndex(int i) {
    if (i == 0) {
      _productAssetsIndex = 0;
      notifyListeners();
    } else {
      _productAssetsIndex = 1;
      notifyListeners();
    }
  }

  clearValues() {
    selectedType = "";
    selectedWeightUnit = "";
    _expiryDate = DateTime(0);
    _nameController.clear();
    _descController.clear();
    _quantityController.clear();
    _expiryDateController.clear();
    _purchasePriceController.clear();
    _salePriceController.clear();
  }
}
