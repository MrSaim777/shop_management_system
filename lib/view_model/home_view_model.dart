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

  void increaseQuantity(Product product, double amount) {
    product.increaseQuantity(amount);
    notifyListeners();
  }

  void decreaseQuantity(Product product, double amount) {
    product.decreaseQuantity(amount);
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
        // if (selectedType == ConstantStrings.product) {
        // log("${_priceController.text} ${_nameController.text} ${_quantityController.text} ${_expiryDateController.text}",
        //     name: "Values");
        Navigator.pop(context);
        inStockProductsList.add(Product(
            id: id,
            name: _nameController.text,
            description: _descController.text,
            purchasePrice: int.parse(_purchasePriceController.text),
            salePrice: int.parse(_salePriceController.text),
            quantity: double.parse(_quantityController.text),
            weightUnit: selectedWeightUnit,
            addedAt: DateTime.now(),
            expiryDate: _expiryDate));
        showFlushBar(
            context: context,
            message: ConstantStrings.productAdded,
            seconds: 2);
        clearValues();
        notifyListeners();
        // } else if (selectedType == ConstantStrings.asset) {
        //   // Navigator.pop(context);
        //   // clearValues();
        //   // assetsList
        //   //     .add(Asset(name: _nameController.text, dateTime: DateTime.now()));
        //   // selectedType = "";
        //   // showFlushBar(
        //   //     context: context, message: ConstantStrings.assetAdded, seconds: 2);
        //   // notifyListeners();
        // } else {
        //   showFlushBar(context: context, message: ConstantStrings.selectType);
        // }
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
