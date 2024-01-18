import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class AppCupertinoTextField extends StatelessWidget {
  const AppCupertinoTextField(
      {super.key,
      this.edgeInsets,
      required this.textEditingController,
      this.prefixWidget,
      this.suffixWidget,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.onTap,
      this.textInputType,
      this.listTextInputFormatters,
      this.readOnly});
  final EdgeInsets? edgeInsets;
  final TextEditingController textEditingController;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String hintText;
  final String Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? listTextInputFormatters;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          edgeInsets ?? EdgeInsets.symmetric(horizontal: context.width / 20),
      child: CupertinoTextField(
        readOnly: readOnly ?? false,
        padding: EdgeInsets.symmetric(
            vertical: context.height / 50, horizontal: context.width / 20),
        controller: textEditingController,
        inputFormatters: listTextInputFormatters ?? [],
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: textInputType ?? TextInputType.text,
        suffix: suffixWidget,
        prefix: prefixWidget,
        placeholder: hintText,
        placeholderStyle: appTextStyle(),
        style: appTextStyle(),
      ),
    );
  }
}
