import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawerList(
              FaIcon(
                FontAwesomeIcons.house,
                size: context.width / 15,
              ),
              "Home",
              Colors.black,
              0),
          drawerList(
              FaIcon(
                FontAwesomeIcons.wallet,
                size: context.width / 15,
              ),
              "Expenses",
              Colors.black,
              1),
          drawerList(
              FaIcon(
                FontAwesomeIcons.fileInvoice,
                size: context.width / 15,
              ),
              "Account Management",
              Colors.black,
              2),
        ],
      ),
    );
  }

  Widget drawerList(FaIcon icon, String text, Color textColor, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: context.width / 20, bottom: context.height / 50),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: context.width / 50,
            ),
            Expanded(
              child: Text(
                text,
                style: appTextStyle(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
