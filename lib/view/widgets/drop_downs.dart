import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

// simple drop down
// multiple selection drop down
// search drop down

class SimpleDropdown extends StatelessWidget {
  const SimpleDropdown({Key? key, required this.hintText, required this.list, required this.onChanged})
      : super(key: key);
  final String hintText;
  final List<String> list;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: hintText,
      items: list,
      initialItem: list[0],
      onChanged: onChanged,
    );
  }
}
