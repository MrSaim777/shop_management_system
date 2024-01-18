import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_management/model/asset_model.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/flush_bar.dart';

class HomeViewModel extends ChangeNotifier {
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

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;

  final TextEditingController _quantityController = TextEditingController();
  TextEditingController get quantityController => _quantityController;

  final TextEditingController _expiryDateController = TextEditingController();
  TextEditingController get expiryDateController => _expiryDateController;

  DateTime _expiryDate = DateTime(0);
  DateTime get expirtDate => _expiryDate;

  List<Product> productsList = [];
  List<Asset> assetsList = [];
  String selectedType = "";
  String selectedWeight = "";
  List<String> weightUnits = [
    ConstantStrings.selectWeightUnit,
    ConstantStrings.kilograms,
    ConstantStrings.grams,
    ConstantStrings.liters,
    ConstantStrings.milliliters,
    ConstantStrings.pounds,
    ConstantStrings.ounces,
  ];

  addToList(BuildContext context) {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty &&
        _expiryDateController.text.isNotEmpty) {
      if (selectedWeight.isEmpty) {
        showFlushBar(
            context: context, message: ConstantStrings.selectWeightUnit);
      } else {
        if (selectedType == ConstantStrings.product) {
          log("${_priceController.text} ${_nameController.text} ${_quantityController.text} ${_expiryDateController.text}",
              name: "Values");
          Navigator.pop(context);
          productsList.add(Product(
              name: _nameController.text,
              desc: _descController.text,
              dateTime: DateTime.now(),
              price: int.parse(_priceController.text.trim()),
              quantity: double.parse(_quantityController.text.trim()),
              weightUnit: selectedWeight,
              expiryDate: _expiryDate));
          showFlushBar(
              context: context,
              message: ConstantStrings.productAdded,
              seconds: 2);
          clearValues();
          notifyListeners();
        } else if (selectedType == ConstantStrings.asset) {
          // Navigator.pop(context);
          // clearValues();
          // assetsList
          //     .add(Asset(name: _nameController.text, dateTime: DateTime.now()));
          // selectedType = "";
          // showFlushBar(
          //     context: context, message: ConstantStrings.assetAdded, seconds: 2);
          // notifyListeners();
        } else {
          showFlushBar(context: context, message: ConstantStrings.selectType);
        }
      }
    } else {
      // showFlushBar(context: context, message: ConstantStrings.writeName);
      showFlushBar(context: context, message: "All fields required");
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

  selectProductAssetIndex(String value) {
    if (value == ConstantStrings.products) {
      _productAssetsIndex = 0;
      notifyListeners();
    } else {
      _productAssetsIndex = 1;
      notifyListeners();
    }
  }

  // void updatePosition(double delta) {
  //   containerPosition += delta;
  //   containerPosition = containerPosition.clamp(minValue, maxValue);
  //   notifyListeners();
  // }

  clearValues() {
    selectedType = "";
    selectedWeight = "";
    _expiryDate = DateTime(0);
    _nameController.clear();
    _descController.clear();
    _quantityController.clear();
    _priceController.clear();
    _expiryDateController.clear();
  }
}
