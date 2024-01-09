// ignore_for_file: library_private_types_in_public_api

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view/widgets/app_textfield.dart';
import 'package:shop_management/view_model/home_view_model.dart';

import '../../utils/constants/global.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: "Product",
          iconColor: AppColors.kWhiteColor,
          bubbleColor: AppColors.kPrimaryColor,
          icon: FontAwesomeIcons.plus,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            provider.toggle();
            showModalBottomSheet(
              // clipBehavior: Clip.antiAliasWithSaveLayer,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              // backgroundColor: AppColors.kWhiteColor,
              barrierColor: AppColors.kTransparentColor,
              elevation: 5,
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: context.screenHeight / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: AppColors.kWhiteColor,
                                  foregroundColor: AppColors.kPrimaryColor),
                              // ignore: deprecated_member_use
                              child: const FaIcon(FontAwesomeIcons.close)),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight / 80,
                      ),
                      Consumer<HomeViewModel>(
                        builder: (_, v, child) => AppTextField(
                            textEditingController: v.productTextController,
                            onChanged: (value) => v.enableSaveBtn(value),
                            suffixWidget: InkWell(
                              onTap: () {},
                              child: Text(
                                "Save",
                                style: appTextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: v.isSaveBtn == true
                                        ? AppColors.kPrimaryColor
                                        : AppColors.kGreyColor),
                              ),
                            ),
                            hintText: 'Enter Product Name'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        Bubble(
          title: "Asset",
          iconColor: AppColors.kWhiteColor,
          bubbleColor: AppColors.kPrimaryColor,
          icon: FontAwesomeIcons.plus,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            provider.toggle();
            _animationController.reverse();
            showModalBottomSheet(
              // clipBehavior: Clip.antiAliasWithSaveLayer,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              // backgroundColor: AppColors.kWhiteColor,
              barrierColor: AppColors.kTransparentColor,
              elevation: 5,
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: context.screenHeight / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: AppColors.kWhiteColor,
                                  foregroundColor: AppColors.kPrimaryColor),
                              // ignore: deprecated_member_use
                              child: const FaIcon(FontAwesomeIcons.close)),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight / 80,
                      ),
                      Consumer<HomeViewModel>(
                        builder: (_, v, child) => AppTextField(
                            textEditingController: v.assetTextController,
                            onChanged: (value) => v.enableSaveBtn(value),
                            suffixWidget: InkWell(
                              onTap: () {},
                              child: Text(
                                "Save",
                                style: appTextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: v.isSaveBtn == true
                                        ? AppColors.kPrimaryColor
                                        : AppColors.kGreyColor),
                              ),
                            ),
                            hintText: 'Enter Asset Name'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () {
        _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward();
        provider.toggle();
      },

      // Floating Action button Icon color
      iconColor: AppColors.kPrimaryColor,

      // Flaoting Action button Icon
      iconData: provider.isPressed
          // ignore: deprecated_member_use
          ? FontAwesomeIcons.close
          : FontAwesomeIcons.plus,
      backGroundColor: AppColors.kWhiteColor,
    );
  }
}

