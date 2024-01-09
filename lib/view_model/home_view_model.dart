import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isPressed = false;
  bool get isPressed => _isPressed;
  bool _isSaveBtn = false;
  bool get isSaveBtn => _isSaveBtn;

  final TextEditingController _productTextController = TextEditingController();
  TextEditingController get productTextController => _productTextController;

  final TextEditingController _assetTextController = TextEditingController();
  TextEditingController get assetTextController => _assetTextController;

  toggle() {
    _isPressed = !isPressed;
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
}
