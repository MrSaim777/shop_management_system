import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isFloatingBtnPressed = false;
  bool get isFloatingBtnPressed => _isFloatingBtnPressed;
  bool _isSaveBtn = false;
  bool get isSaveBtn => _isSaveBtn;
  int _productAssetsIndex = 0;
  int get productAssetsIndex => _productAssetsIndex;
  double containerPosition = 0.0;
  double minValue = 0.0;
  double maxValue = 100.0;

  final TextEditingController _productTextController = TextEditingController();
  TextEditingController get productTextController => _productTextController;

  final TextEditingController _assetTextController = TextEditingController();
  TextEditingController get assetTextController => _assetTextController;

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

  void updatePosition(double delta) {
    containerPosition += delta;

    containerPosition = containerPosition.clamp(minValue, maxValue);
    print(minValue);
    print(maxValue);

    notifyListeners();
  }
}
