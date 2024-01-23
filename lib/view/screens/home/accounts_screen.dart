// import 'package:flutter/material.dart';

// import 'package:shop_management/utils/constants/colors_const.dart';
// import 'package:shop_management/utils/constants/constant_strings.dart';
// import 'package:shop_management/utils/constants/global.dart';
// import 'package:shop_management/view/widgets/drawer_btn.dart';

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({super.key, required this.zoomDrawerController});
//   final ZoomDrawerController zoomDrawerController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: deviceWidth / 30),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 ConstantStrings.greetings,
//                 style: appTextStyle(
//                     color: AppColors.kTextColor,
//                     fontWeight: FontWeight.w900,
//                     fontSize: 0.04),
//               ),
//               AppDrawerButton(zoomDrawerController: zoomDrawerController)
//             ],
//           ),
//           SizedBox(height: deviceHeight / 50),
//         ],
//       ),
//     );
//   }
// }
