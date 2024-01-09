import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text("Home Screen"),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       FadeInAnimation(
    //         delay: 2,
    //         child: AppCard(
    //           height: 225,
    //           child: Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Milk",
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   Spacer(),
    //                   // SizedBox(
    //                   //   height: 30,
    //                   //   width: 30,
    //                   //   child: Image.asset(
    //                   //     AppIcons.analytics,
    //                   //     color: AppColors.kPrimaryColor,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //               Expanded(
    //                 child: ProgressWithText(
    //                   indicatorValue: 7 / 20,
    //                   title: 'Litters',
    //                   value: 7,
    //                   totalValue: 20,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       FadeInAnimation(
    //         delay: 2,
    //         child: AppCard(
    //           height: 225,
    //           child: Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Milk",
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   Spacer(),
    //                   // SizedBox(
    //                   //   height: 30,
    //                   //   width: 30,
    //                   //   child: Image.asset(
    //                   //     AppIcons.analytics,
    //                   //     color: AppColors.kPrimaryColor,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //               Expanded(
    //                 child: ProgressWithText(
    //                   indicatorValue: 7 / 20,
    //                   title: 'Litters',
    //                   value: 7,
    //                   totalValue: 20,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
