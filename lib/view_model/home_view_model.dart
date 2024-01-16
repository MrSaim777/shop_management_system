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
  TextEditingController get nameTextController => _nameController;

  List<Product> productsList = [];
  List<Asset> assetsList = [];
  String selectedType = "";

  addToList(BuildContext context, String name, String type) {
    if (name.isNotEmpty) {
      if (type == ConstantStrings.product) {
        Navigator.pop(context);
        productsList.add(Product(name: name, dateTime: DateTime.now()));
        selectedType = "";
        showFlushBar(context: context, message: ConstantStrings.productAdded);
        notifyListeners();
      } else if (type == ConstantStrings.asset) {
        Navigator.pop(context);
        assetsList.add(Asset(name: name, dateTime: DateTime.now()));
        selectedType = "";
        showFlushBar(context: context, message: ConstantStrings.assetAdded);
        notifyListeners();
      } else {
        showFlushBar(context: context, message: ConstantStrings.selectType);
      }
    } else {
      showFlushBar(context: context, message: ConstantStrings.writeName);
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
}
