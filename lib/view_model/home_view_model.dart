import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_management/model/asset_model.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/repository/product_repo.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/flush_bar.dart';

class HomeViewModel extends ChangeNotifier {
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ProductRepo productRepo = ProductRepo(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance);

  final Stream<QuerySnapshot> productssStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('products')
      .snapshots();

  bool _isFloatingBtnPressed = false;
  bool get isFloatingBtnPressed => _isFloatingBtnPressed;
  bool _isSaveBtn = false;
  bool get isSaveBtn => _isSaveBtn;
  int _productAssetsIndex = 0;
  int get productAssetsIndex => _productAssetsIndex;

  // double containerPosition = 0.0;
  // double minValue = 0.0;
  // double maxValue = 100.0;

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

  List<Product> inStockProductsList = [];
  List<Product> outOfStockProductsList = [];
  List<Asset> assetsList = [];
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
    product.increaseSoldQuantity(amount);
    notifyListeners();
  }

  void decreaseSoldQuantity(Product product, double amount) {
    product.decreaseSoldQuantity(amount);
    if (product.quantity == 0) {
      final p = Product(
          id: product.id,
          name: product.name,
          description: product.description,
          purchasePrice: product.purchasePrice,
          salePrice: product.salePrice,
          quantity: product.quantity,
          weightUnit: product.weightUnit,
          addedAt: product.addedAt,
          expiryDate: product.expiryDate);
      outOfStockProductsList.add(p);
      inStockProductsList.removeWhere((e) => e.id == product.id);
    }
    notifyListeners();
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
