import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> appDatePicker(BuildContext context, DateTime selectedDate,
    TextEditingController controller, String dateFormat) async {
  final picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    controller.text = DateFormat(dateFormat).format(selectedDate);
  }
}
