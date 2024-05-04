// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';

// class WebScreenHelper {
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();
//   BuildContext context;
//   final setState;
//   WebScreenHelper(this.context, this.setState);

//   // appBar() {
//   //   // return Consumer<GeneralController>(builder: (context, generalWatch, _) {
//   //   return AppBar(
//   //     backgroundColor: theme.blackColor,
//   //     elevation: 0.0,
//   //     centerTitle: false,
//   //     automaticallyImplyLeading: false,
//   //     title: Row(
//   //         crossAxisAlignment: CrossAxisAlignment.center,
//   //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //         children: [
//   //           Row(
//   //             children: [
//   //               Image.asset(
//   //                 "assets/Icons/logo_home.png",
//   //                 scale: 12.9 /
//   //                     ScreenUtil()
//   //                         .scaleWidth, // Adjust the scaling based on screen width
//   //               ),
//   //               SizedBox(
//   //                 width: 5.w,
//   //               ),
//   //               Image.asset(
//   //                 "assets/Icons/scotani_name.png",
//   //                 scale: 20.0 /
//   //                     ScreenUtil()
//   //                         .scaleWidth, // Adjust the scaling based on screen width
//   //               ),
//   //               SizedBox(
//   //                 width: 15.w,
//   //               ),

//   //               ///
//   //               ///
//   //               ///  Create Product
//   //               ///

//   //               InkWell(
//   //                 onTap: () {},
//   //                 child: Text(
//   //                   "Create Product",
//   //                   style: utils.xSmallLabelStyleB(theme.whiteColor),
//   //                 ),
//   //               ),
//   //               SizedBox(
//   //                 width: 5.w,
//   //               ),

//   //               ///
//   //               /// Customization Product
//   //               ///

//   //               InkWell(
//   //                 onTap: () {},
//   //                 child: Text(
//   //                   "Customize Product",
//   //                   style: utils.xSmallLabelStyleB(theme.whiteColor),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),

//   //           //                /
//   //           //             / Serach bar
//   //           //             /
//   //           //             Expanded(
//   //           //   flex: 1, // You can adjust this value to change the height
//   //           //   child: utils.inputField(
//   //           //     textColor: theme.blackColor,
//   //           //     placeholderColor: theme.blackColor,
//   //           //     placeholder: "Browse our wide range of apparel",
//   //           //     isSecure: false,
//   //           //     maxLines: 1,
//   //           //     prefixIcon: 'search',
//   //           //     postfixIcon: 'remove',
//   //           //     prefixIconColor: theme.blackColor,
//   //           //     postfixIconColor: theme.blackColor,
//   //           //     preFixIconSize: static.width > 550 ? 10.w : 14.w,
//   //           //     postFixIconSize: static.width > 550 ? 8.w : 10.w,
//   //           //   ),
//   //           // )

//   //           SizedBox(
//   //             width: 15.w,
//   //           ),
//   //           Expanded(
//   //             child: Padding(
//   //               padding: const EdgeInsets.only(left: 8.0, right: 20),
//   //               child: TextFormField(
//   //                 cursorColor: theme.redColor,

//   //                 // style: utils
//   //                 //     .xxlSmallLabelStyle(theme.blackColor)
//   //                 //     .copyWith(fontSize: 14 / ScreenUtil().scaleWidth),
//   //                 decoration: InputDecoration(
//   //                     filled: true,
//   //                     fillColor: theme.whiteColor,
//   //                     hintText: 'Browse our wide range of apparel',
//   //                     hintStyle: utils.xlSmallLabelStyle(theme.blackColor),
//   //                     prefixIcon: Image.asset(
//   //                       'assets/Icons/search.png',
//   //                       color: theme.blackColor,
//   //                       scale: 15 / ScreenUtil().scaleWidth,
//   //                     ),
//   //                     suffixIcon: Image.asset(
//   //                       'assets/Icons/remove.png',
//   //                       color: theme.blackColor,
//   //                       scale: 18 / ScreenUtil().scaleWidth,
//   //                     ),
//   //                     contentPadding: EdgeInsets.symmetric(
//   //                         vertical: 8.0), // Adjust vertical padding
//   //                     border: UnderlineInputBorder(
//   //                         borderRadius: BorderRadius.circular(12.r))),
//   //               ),
//   //             ),
//   //           ),
//   //         ]),

//   //     ///
//   //     /// Action
//   //     ///

//   //     actions: [
//   //       Padding(
//   //         padding: const EdgeInsets.only(right: 20.0),
//   //         child: Image.asset(
//   //           "assets/Icons/cartFilled.png",
//   //           scale: 6 / ScreenUtil().scaleWidth,
//   //         ),
//   //       ),
//   //       Container(
//   //         height: 40.h,
//   //         width: 15.w,
//   //         // margin: EdgeInsets.only(left: 15),
//   //         decoration: BoxDecoration(
//   //             shape: BoxShape.circle,
//   //             image: DecorationImage(
//   //                 image: AssetImage("assets/Images/profile.png"),
//   //                 fit: BoxFit.cover)),
//   //       ),
//   //     ],
//   //   );
//   // }

//   // ///
//   // /// tab bar
//   // ///
//   // tabBar({tabController}) {
//   //   return // Wrap TabBar with Container for left alignment
//   //       Container(
//   //     alignment: Alignment.centerLeft,
//   //     child: TabBar(
//   //         isScrollable: true, // Set to true for left alignment
//   //         controller: tabController,
//   //         tabAlignment: TabAlignment.start,
//   //         tabs: [
//   //           Tab(
//   //             text: 'Men',
//   //           ),
//   //           Tab(text: 'Women'),
//   //           Tab(text: 'Kids'),
//   //         ],
//   //         labelColor: Colors.red, // Text color for active tab
//   //         unselectedLabelColor: Colors.white, // Text color for inactive tabs
//   //         // indicatorColor: Colors.transparent, // Color of the indicator
//   //         indicator: BoxDecoration(color: Colors.transparent),
//   //         // dividerHeight: null,
//   //         dividerColor: Colors.transparent,
//   //         labelStyle: utils.xSmallLabelStyleB(Colors.transparent)),
//   //   );
//   // }

//   // ///
//   // /// tab view
//   // ///
//   // tabView({tabController}) {
//   //   return // Add a TabBarView
//   //       Expanded(
//   //     child: TabBarView(
//   //       controller: tabController,
//   //       children: [
//   //         MenWebScreen(),
//   //         Screen2(),
//   //         Screen3(),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
