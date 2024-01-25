import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: context.height / 200),
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.kScaffoldColor,
              ),
              title: Column(
                children: [
                  Container(
                    width: context.width / 2.8,
                    height: context.height / 40,
                    decoration: BoxDecoration(
                        color: AppColors.kScaffoldColor,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  SizedBox(height: context.height / 100),
                  Container(
                    width: context.width / 2.8,
                    height: context.height / 50,
                    decoration: BoxDecoration(
                        color: AppColors.kScaffoldColor,
                        borderRadius: BorderRadius.circular(3)),
                  )
                ],
              ),
              trailing: Container(
                width: context.width / 3,
                height: context.height / 30,
                decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.circular(50)),
              )),
        );
      },
    );
  }
}
