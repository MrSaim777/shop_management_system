import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/widgets/app_btn.dart';
import 'package:shop_management/view/widgets/app_cupertino_textfield.dart';
import 'package:shop_management/view/widgets/back_btn.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: context.height / 50),
              AppCupertinoTextField(
                  textEditingController: TextEditingController(),
                  hintText: product.name),
              SizedBox(height: context.height / 50),
              AppCupertinoTextField(
                  textEditingController: TextEditingController(),
                  hintText: product.desc == null
                      ? ConstantStrings.descriptionOptional
                      : product.desc!),
              SizedBox(height: context.height / 50),
              AppCupertinoTextField(
                textEditingController: TextEditingController(),
                hintText: product.price.toString(),
                textInputType: TextInputType.number,
                prefixWidget: Padding(
                  padding: EdgeInsets.only(left: context.width / 20),
                  child: Text(
                    ConstantStrings.currency,
                    style: appTextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: context.height / 50),
              Row(
                children: [
                  Expanded(
                    child: AppCupertinoTextField(
                      textInputType: TextInputType.number,
                      textEditingController: TextEditingController(),
                      hintText: product.quantity.toString(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: deviceWidth / 30),
                      decoration: BoxDecoration(
                          color: AppColors.kWhiteColor,
                          // boxShadow: boxShadow,
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomDropdown<String>(
                        decoration: CustomDropdownDecoration(
                            expandedShadow: boxShadow,
                            closedFillColor: AppColors.kScaffoldColor),
                        hintText: product.weightUnit,
                        items: provider.weightUnits,
                        initialItem: provider.weightUnits[0],
                        onChanged: (value) {
                          provider.selectedWeight = value;
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: context.height / 50),
              AppCupertinoTextField(
                textEditingController: TextEditingController(),
                // onTap: () => appDatePicker(context),
                readOnly: true,
                hintText: DateFormat("dd/MM/yyyy").format(product.expiryDate),
                prefixWidget: Padding(
                  padding: EdgeInsets.only(left: context.width / 20),
                  child: Text(
                    ConstantStrings.expiryDate,
                    style: appTextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: deviceHeight / 50),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: deviceWidth / 20,
                ),
                decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    // boxShadow: boxShadow,
                    borderRadius: BorderRadius.circular(10)),
                child: CustomDropdown<String>(
                  decoration: CustomDropdownDecoration(
                      expandedShadow: boxShadow,
                      closedFillColor: AppColors.kScaffoldColor),
                  hintText: ConstantStrings.selectCategory,
                  items: provider.dropDownItems,
                  initialItem: provider.dropDownItems[0],
                  onChanged: (value) {
                    provider.selectedType = value;
                  },
                ),
              ),
              SizedBox(height: context.height / 50),
              AppButton(onTap: () {}, btnText: "Save")
            ],
          ),
          Positioned(
            bottom: context.height / 40,
            left: context.width / 20,
            child: const BackBtn(),
          ),
          Positioned(
            bottom: context.height / 40,
            right: context.width / 20,
            child: AppButton(
              onTap: () {},
              btnText: "Delete Item",
              elevation: 5,
              color: AppColors.kWhiteColor,
              textColor: AppColors.kExpensesColor,
            ),
          ),
        ],
      ),
    );
  }
}
