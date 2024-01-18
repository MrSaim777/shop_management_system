import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.edgeInsets,
    required this.textEditingController,
    this.prefixWidget,
    this.suffixWidget,
    required this.hintText,
    this.validator,
    this.onChanged,
  });
  final EdgeInsets? edgeInsets;
  final TextEditingController textEditingController;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String hintText;
  final String Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          edgeInsets ?? EdgeInsets.symmetric(horizontal: context.width / 20),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          fillColor: AppColors.kWhiteColor,
          // filled: true,
          suffix: suffixWidget,
          prefix: prefixWidget,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPrimaryColor, // Border color
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kErrorColor, // Error border color
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPrimaryColor, // Focused border color
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kGreyColor, // Enabled border color
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.kGreyColor,
          ),
        ),
      ),
    );
  }
}
