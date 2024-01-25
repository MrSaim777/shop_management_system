import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/utils/routes/cupertino_router.dart';
import 'package:shop_management/view/screens/home/detail_screen.dart';
import 'package:shop_management/view/screens/home/widgets/product_loading.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class InStockProductsList extends StatelessWidget {
  const InStockProductsList({super.key, required this.homeModelView});
  final HomeViewModel homeModelView;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: homeModelView.getProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: context.height / 2,
            child:
                const Center(child: Text(ConstantStrings.someThingWentWrong)),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingProducts();
        }

        final list = snapshot.data!;
        return list.isEmpty
            ? SizedBox(
                height: context.height / 2,
                child: const Center(child: Text(ConstantStrings.noProducts)),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => cupertinoRouter(
                        context, DetailScreen(product: list[index])),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: context.height / 200),
                      decoration: BoxDecoration(
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: AppColors.kPrimaryColor,
                              child: Text(
                                list[index].name[0].toUpperCase(),
                                style: appTextStyle(
                                    color: AppColors.kWhiteColor,
                                    fontWeight: FontWeight.bold),
                              )),
                          title: Text(
                            list[index].name,
                            style: appTextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.kBlackColor),
                          ),
                          subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                list[index].description.isEmpty
                                    ? const SizedBox.shrink()
                                    : Text(
                                        list[index].description,
                                        style: appTextStyle(),
                                      ),
                                Text(
                                  "${list[index].quantity} ${list[index].weightUnit}",
                                  style: appTextStyle(fontSize: 0.02),
                                )
                              ]),
                          trailing: Container(
                            width: context.width / 2.8,
                            height: context.height / 30,
                            decoration: BoxDecoration(
                                color: AppColors.kScaffoldColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => homeModelView
                                      .increaseSoldQuantity(list[index], 1),
                                  child: Container(
                                    width: context.width / 10,
                                    decoration: const BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50))),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.minus,
                                      size: context.width / 25,
                                      color: AppColors.kWhiteColor,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: context.height / 150),
                                  child:
                                      Text(list[index].soldQuantity.toString()),
                                ),
                                InkWell(
                                  onTap: () => homeModelView
                                      .decreaseSoldQuantity(list[index], 1),
                                  child: Container(
                                    width: context.width / 10,
                                    decoration: const BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50))),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: context.width / 25,
                                      color: AppColors.kWhiteColor,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              );
      },
    );
  }
}
