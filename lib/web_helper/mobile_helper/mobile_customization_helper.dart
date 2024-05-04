// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Controllers/mobile_screen.dart';
// import 'package:skincanvas/Views/create_product_color/create_product_color.dart';
// import 'package:skincanvas/main.dart';

// class MobileCustomizationHelper {
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();
//   final setState;
//   BuildContext context;
//   MobileCustomizationHelper(this.context, this.setState);

//   var mobileScreen =
//       navigatorkey.currentContext!.watch<MobileScreenController>();

//   ///
//   /// Header
//   ///

//   Widget headerAppBar() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 20.0, left: 20),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       "assets/Icons/logo_home.png",
//                       scale: 10 / ScreenUtil().scaleWidth,
//                     ),
//                     SizedBox(
//                       width: 5.w,
//                     ),
//                     Image.asset(
//                       "assets/Icons/scotani_logo.png",
//                       scale: 10 / ScreenUtil().scaleWidth,
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         mobileScreen.onClickProduct();
//                       },
//                       child: Text(
//                         "Create Product",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 10.sp,
//                             color: mobileScreen.isCreateProduct
//                                 ? Colors.red
//                                 : Colors.white),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 18,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         mobileScreen.onClickCustomized();

//                         ///
//                         /// Screen
//                         ///
//                         Navigator.pushNamed(context, route.MainScreenViewRoute);
//                       },
//                       child: Text(
//                         "Customize Product",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 10.sp,
//                             color: mobileScreen.isCustomizedProduct
//                                 ? Colors.red
//                                 : Colors.white),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 18,
//                     ),
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           mobileScreen.onClickSetting();
//                         },
//                         child: Text(
//                           "Setting",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 10.sp,
//                               color: mobileScreen.setting
//                                   ? Colors.red
//                                   : Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 18,
//         ),
//         FittedBox(
//           child: Row(
//             children: [
//               SizedBox(
//                 height: 45,
//                 width: MediaQuery.sizeOf(context).width / 1.4,
//                 child: TextFormField(
//                   controller: mobileScreen.searchController,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Colors.black),
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         color: Colors.black),
//                     hintText: "Browse our wide range of apparel",
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.white,
//                     filled: true,
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none),
//                     prefixIcon: IconButton(
//                       icon: SvgPicture.asset("assets/icons/search.svg"),
//                       onPressed: () {},
//                     ),
//                     suffixIcon: IconButton(
//                       icon: SvgPicture.asset("assets/icons/close.svg"),
//                       onPressed: () {
//                         mobileScreen.searchController!.clear();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 8.w,
//               ),
//               Row(
//                 children: [
//                   ///
//                   /// image
//                   ///
//                   Image.asset(
//                     "assets/Icons/cartFilled.png",
//                     scale: 2,
//                   ),
//                   SizedBox(
//                     width: 8.w,
//                   ),

//                   ///
//                   /// profile
//                   ///
//                   CircleAvatar(radius: 20, child: Icon(Icons.person))
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         )
//       ],
//     );
//   }
// }
