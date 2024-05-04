// // ignore_for_file: invalid_use_of_protected_member

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';

// class MobileCustomoizationScreen extends StatefulWidget {
//   const MobileCustomoizationScreen({Key? key}) : super(key: key);

//   @override
//   State<MobileCustomoizationScreen> createState() =>
//       _MobileCustomoizationScreenState();
// }

// class _MobileCustomoizationScreenState extends State<MobileCustomoizationScreen>
//     with TickerProviderStateMixin {
//   GlobalKey<_MobileCustomoizationScreenState> key =
//       GlobalKey<_MobileCustomoizationScreenState>();
//   late TabController _tabController;
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   bool isCreateProduct = false;
//   bool isCustomizedProduct = true;
//   bool setting = false;

//   onClickProduct() {
//     isCreateProduct = true;
//     isCustomizedProduct = false;
//     setting = false;
//   }

//   onClickCustomized() {
//     isCreateProduct = false;
//     isCustomizedProduct = true;
//     setting = false;
//   }

//   onClickSetting() {
//     isCreateProduct = false;
//     isCustomizedProduct = false;
//     setting = true;
//   }

//   TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: MediaQuery.sizeOf(context).height,
//           width: MediaQuery.sizeOf(context).width,
//           decoration: BoxDecoration(color: Colors.black),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 12,
//                 ),

//                 // ///
//                 // /// Header
//                 // ///
//                 // ///
//                 // header(
//                 //     createProduct: isCreateProduct,
//                 //     customizationProduct: isCustomizedProduct,
//                 //     setting: setting,
//                 //     createProductonTap: () {
//                 //       setState(() {
//                 //         onClickProduct();
//                 //       });

//                 //       // Navigator.pushNamed(
//                 //       //     context, route.CreateProductScreenViewRoute);
//                 //     },
//                 //     customizationProductonTap: () {
//                 //       setState(() {
//                 //         onClickCustomized();
//                 //       });
//                 //     },
//                 //     settingonTap: () {
//                 //       setState(() {
//                 //         onClickSetting();
//                 //       });
//                 //     },
//                 //     context: context,
//                 //     searchController: _searchController,
//                 //     key: key),

//                 // ///
//                 // /// Tab Bar
//                 // ///

//                 // tabBar(tabController: _tabController, utils: utils),

//                 // ///
//                 // /// Tab bar view
//                 // ///
//                 // tabView(tabController: _tabController),

//                 ///
//                 ///
//                 ///
//                 SizedBox(
//                   height: 18,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// ///
// /// Header
// ///

// Widget header({
//   setting,
//   settingonTap,
//   createProduct,
//   createProductonTap,
//   customizationProduct,
//   customizationProductonTap,
//   context,
//   TextEditingController? searchController,
//   key,
// }) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Image.asset(
//                   "assets/Icons/logo_home.png",
//                   scale: 10 / ScreenUtil().scaleWidth,
//                 ),
//                 SizedBox(
//                   width: 5.w,
//                 ),
//                 Image.asset(
//                   "assets/Icons/scotani_logo.png",
//                   scale: 10 / ScreenUtil().scaleWidth,
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 InkWell(
//                   onTap: createProductonTap,
//                   child: Text(
//                     "Create Product",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 10.sp,
//                         color: createProduct ? Colors.red : Colors.white),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 18,
//                 ),
//                 InkWell(
//                   onTap: customizationProductonTap,
//                   child: Text(
//                     "Customize Product",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 10.sp,
//                         color:
//                             customizationProduct ? Colors.red : Colors.white),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 18,
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: settingonTap,
//                     child: Text(
//                       "Setting",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 10.sp,
//                           color: setting ? Colors.red : Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       SizedBox(
//         height: 18,
//       ),
//       FittedBox(
//         child: Row(
//           children: [
//             SizedBox(
//               height: 45,
//               width: MediaQuery.sizeOf(context).width / 1.4,
//               child: TextFormField(
//                 controller: searchController,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: Colors.black),
//                 decoration: InputDecoration(
//                   hintStyle: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Colors.black),
//                   hintText: "Browse our wide range of apparel",
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none),
//                   fillColor: Colors.white,
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none),
//                   prefixIcon: IconButton(
//                     icon: SvgPicture.asset("assets/icons/search.svg"),
//                     onPressed: () {},
//                   ),
//                   suffixIcon: IconButton(
//                     icon: SvgPicture.asset("assets/icons/close.svg"),
//                     onPressed: () {
//                       (key as GlobalKey<_MobileCustomoizationScreenState>)
//                           .currentState
//                           ?.setState(() {
//                         searchController!.clear();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 8.w,
//             ),
//             Row(
//               children: [
//                 ///
//                 /// image
//                 ///
//                 Image.asset(
//                   "assets/Icons/cartFilled.png",
//                   scale: 2,
//                 ),
//                 SizedBox(
//                   width: 8.w,
//                 ),

//                 ///
//                 /// profile
//                 ///
//                 CircleAvatar(radius: 20, child: Icon(Icons.person))
//               ],
//             )
//           ],
//         ),
//       ),
//     ],
//   );
// }

// // ///
// // /// tab bar
// // ///
// // tabBar({tabController, AppUtils? utils}) {
// //   return // Wrap TabBar with Container for left alignment
// //       Container(
// //     alignment: Alignment.topLeft,
// //     child: TabBar(
// //         isScrollable: true, // Set to true for left alignment
// //         controller: tabController,
// //         tabAlignment: TabAlignment.start,
// //         tabs: [
// //           Tab(
// //             text: 'Men',
// //           ),
// //           Tab(text: 'Women'),
// //           Tab(text: 'Kids'),
// //         ],
// //         labelColor: Colors.red, // Text color for active tab
// //         unselectedLabelColor: Colors.white, // Text color for inactive tabs
// //         // indicatorColor: Colors.transparent, // Color of the indicator
// //         indicator: BoxDecoration(color: Colors.transparent),
// //         // dividerHeight: null,
// //         dividerColor: Colors.transparent,
// //         labelStyle: utils!.smallLabelStyleB(Colors.transparent)),
// //   );
// // }

// // ///
// // /// tab view
// // ///
// // tabView({tabController}) {
// //   return // Add a TabBarView
// //       Expanded(
// //     child: TabBarView(
// //       controller: tabController,
// //       children: [
// //         MenMobileScreen(),
// //         // Screen2(),
// //         // Screen3(),
// //       ],
// //     ),
// //   );
// // }
