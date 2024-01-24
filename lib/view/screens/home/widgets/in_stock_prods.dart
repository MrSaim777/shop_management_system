import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/model/product_model.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/utils/routes/cupertino_router.dart';
import 'package:shop_management/view/screens/home/detail_screen.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class InStockProductsList extends StatelessWidget {
  const InStockProductsList({super.key, required this.homeModelView});
  final HomeViewModel homeModelView;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: homeModelView.productssStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        // final list = snapshot.data!.docs.map((e) {
        //   final data = e.data() as Map<String, dynamic>;
        //   Product.fromMap(data);
        // }) as Product;
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return GestureDetector(
              // onTap: () => cupertinoRouter(context, DetailScreen(product: list)),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: context.height / 200),
                decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: AppColors.kPrimaryColor,
                        child: Text(
                          data['name'][0].toUpperCase(),
                          style: appTextStyle(
                              color: AppColors.kWhiteColor,
                              fontWeight: FontWeight.bold),
                        )),
                    title: Text(
                      data['name'],
                      style: appTextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBlackColor),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data['description'].isEmpty
                              ? const SizedBox.shrink()
                              : Text(
                                  data['description'],
                                  style: appTextStyle(),
                                ),
                          Text(
                            "${data['quantity']} ${data['quantity']}",
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
                            // onTap: () =>
                            //     homeModelView.increaseSoldQuantity(list, 1),
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
                            child: Text(data['soldQuantity'].toString()),
                          ),
                          InkWell(
                            // onTap: () =>
                            //     homeModelView.decreaseSoldQuantity(list, 1),
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
          }).toList(),
        );
      },
    );
  }
}

// return ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () =>
//                   cupertinoRouter(context, DetailScreen(product: list)),
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: context.height / 200),
//                 decoration: BoxDecoration(
//                     color: AppColors.kWhiteColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: ListTile(
//                     leading: CircleAvatar(
//                         backgroundColor: AppColors.kPrimaryColor,
//                         child: Text(
//                           list.name[0].toUpperCase(),
//                           style: appTextStyle(
//                               color: AppColors.kWhiteColor,
//                               fontWeight: FontWeight.bold),
//                         )),
//                     title: Text(
//                       list.name,
//                       style: appTextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.kBlackColor),
//                     ),
//                     subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           list.description.isEmpty
//                               ? const SizedBox.shrink()
//                               : Text(
//                                   list.description,
//                                   style: appTextStyle(),
//                                 ),
//                           Text(
//                             "${list.quantity} ${list.weightUnit}",
//                             style: appTextStyle(fontSize: 0.02),
//                           )
//                         ]),
//                     trailing: Container(
//                       width: context.width / 2.8,
//                       height: context.height / 30,
//                       decoration: BoxDecoration(
//                           color: AppColors.kScaffoldColor,
//                           borderRadius: BorderRadius.circular(50)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () =>
//                                 homeModelView.increaseSoldQuantity(list, 1),
//                             child: Container(
//                               width: context.width / 10,
//                               decoration: const BoxDecoration(
//                                   color: AppColors.kPrimaryColor,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(50),
//                                       bottomLeft: Radius.circular(50))),
//                               child: Center(
//                                   child: FaIcon(
//                                 FontAwesomeIcons.minus,
//                                 size: context.width / 25,
//                                 color: AppColors.kWhiteColor,
//                               )),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: context.height / 150),
//                             child: Text(list.soldQuantity.toString()),
//                           ),
//                           InkWell(
//                             onTap: () =>
//                                 homeModelView.decreaseSoldQuantity(list, 1),
//                             child: Container(
//                               width: context.width / 10,
//                               decoration: const BoxDecoration(
//                                   color: AppColors.kPrimaryColor,
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(50),
//                                       bottomRight: Radius.circular(50))),
//                               child: Center(
//                                   child: FaIcon(
//                                 FontAwesomeIcons.plus,
//                                 size: context.width / 25,
//                                 color: AppColors.kWhiteColor,
//                               )),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//               ),
//             );
//           },
//         );

