// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Helpers/FragmentHelpers/HomeFragmentHelper.dart';
import 'package:skincanvas/Helpers/ProductRelatedHelper/SelectCategoryProductHelper.dart';
import 'package:skincanvas/main.dart';

class WebCustomoizationScreen extends StatefulWidget {
  @override
  State<WebCustomoizationScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<WebCustomoizationScreen>
    with TickerProviderStateMixin {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  late TabController _tabController;
  var homeRead = navigatorkey.currentContext!.read<HomeController>();
  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var orderRead =
      navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();
  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

  ScrollController scrollController = ScrollController();

  testingFunc() async {
    await Future.delayed(Duration.zero, () {
      homeRead.selectConfigurableCategoriesInitialize(
          length: homeRead.configureDataList.length);
    });
    await apis();
  }

  @override
  void initState() {
    super.initState();
    testingFunc();
    _tabController = TabController(length: 4, vsync: this);
  }

  int selected = 0;
  var homeWatch1 = navigatorkey.currentContext!.watch<HomeController>();
  var homeRead1 = navigatorkey.currentContext!.read<HomeController>();
  @override
  Widget build(BuildContext context) {
    SelectCategoryHelper helper =
        SelectCategoryHelper(context, scrollController, _tabController);
    HomeFragmentHelper helper1 =
        HomeFragmentHelper(context, _tabController, scrollController);

    return
        // RefreshIndicator(
        // backgroundColor: themeColor.orangeColor,
        // color: themeColor.blackColor,
        // onRefresh: () async {
        //   await apis();
        // },
        // child:
        Scaffold(
      backgroundColor: themeColor.backGroundColor,
      bottomNavigationBar:
          Container(height: 100, child: helper.createProductButton()),
      // appBar: AppBar(
      //   toolbarHeight: 55.h,
      //   backgroundColor: themeColor.backGroundColor,
      //   elevation: 0.0,
      //   centerTitle: false,
      //   automaticallyImplyLeading: false,
      //   title: Align(
      //     alignment: Alignment.topLeft,
      //     child: Row(children: [
      //       Image.asset(
      //         "assets/Icons/logo_home.png",
      //         scale: 3,
      //       ),
      //       SizedBox(
      //         width: 15,
      //       ),
      //       Image.asset(
      //         "assets/Icons/scotani_name.png",
      //         scale: 4.5,
      //       ),
      //     ]),
      //   ),

      //   ///
      //   /// Action
      //   ///

      //   actions: [
      //     InkWell(onTap: () async {
      //       if (homeWatch.loadingApi == false) {
      //         await orderRead.cartListingApi(context,
      //             isLoading: true, isRoute: true);
      //         orderRead.onCartFromHomeUpdate(value: true);
      //       }
      //     }, child: Consumer<OrderCheckOutWishlistController>(
      //         builder: (context, orderAndWishListWatch, _) {
      //       return Stack(children: [
      //         Container(
      //           padding: EdgeInsets.all(10),
      //           decoration: BoxDecoration(
      //               color: themeColor.whiteColor, shape: BoxShape.circle),
      //           child: Image.asset(
      //             "assets/Icons/cart1.png",
      //             scale: 3.5,
      //           ),
      //         ),
      //         if (orderAndWishListWatch.quantityOfCartProduct != 0)
      //           Positioned(
      //             right: 0.w,
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   shape: BoxShape.circle, color: themeColor.orangeColor),
      //               child: Center(
      //                 child: Text(
      //                   "${orderAndWishListWatch.quantityOfCartProduct == 100 ? '99+' : orderAndWishListWatch.quantityOfCartProduct}",
      //                   style: utils.smallLabelStyleB(themeColor.whiteColor),
      //                 ),
      //               ),
      //               height:
      //                   MediaQuery.of(navigatorkey.currentContext!).size.width >
      //                           550
      //                       ? 13.w
      //                       : 23.w,
      //               width:
      //                   MediaQuery.of(navigatorkey.currentContext!).size.width >
      //                           550
      //                       ? 13.w
      //                       : 23.w,
      //             ),
      //           ),
      //       ]);
      //     })),
      //     SizedBox(
      //       width: 8.w,
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         FocusScope.of(context).unfocus();

      //         utils.flipCard(context);
      //       },
      //       child: Container(
      //         padding: EdgeInsets.symmetric(horizontal: 4.w),
      //         decoration: BoxDecoration(
      //             color: themeColor.lightBlackColor,
      //             shape: BoxShape.circle,
      //             border:
      //                 Border.all(color: themeColor.greyColor.withOpacity(.8))),
      //         child: Container(
      //           width: static.width > 500 ? 40.w : 45.w,
      //           height: static.width > 500 ? 40.h : 45.h,
      //           margin: static.width > 500
      //               ? EdgeInsets.all(2.w)
      //               : EdgeInsets.all(0),
      //           clipBehavior: Clip.antiAliasWithSaveLayer,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: themeColor.lightGreyColor,
      //           ),
      //           child: CachedNetworkImage(
      //             imageUrl: generalWatch.profilePhotoValue!,
      //             // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //             //     utils.loadingShimmer(
      //             //   width: 30.w,
      //             //   height: 30.h,
      //             // ),
      //             // errorWidget: (context, url, error) => utils.loadingShimmer(
      //             //   width: 30.w,
      //             //   height: 30.h,
      //             // ),
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: InternetConnectivityScreen(
        widget: Container(
          width: static.width,
          height: static.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    // helper1.appBar(),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    helper1.fieldForSearch(),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeWatch1.configureDataList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InkWell(
                                onTap: () async {
                                  setState(() {});
                                  selected = index;
                                  homeRead1
                                      .selectConfigurableCategoriesStatusUpdate(
                                          index: index);
                                  homeRead1.productListingApi(context,
                                      categoryID: homeWatch1
                                          .configureDataList[index]
                                          .subCategories![0]
                                          .sId,
                                      title: '',
                                      type: "3",
                                      isLoading: false,
                                      isLoadingFromConfigurable: true);
                                  await homeRead1
                                      .selectedCategoryForConfigurableUpdator(
                                          ID: homeWatch1
                                              .configureDataList[index]
                                              .subCategories![0]
                                              .sId,
                                          type: '3');
                                },
                                child: Text(
                                  '${homeWatch.configureDataList[index].name}',
                                  style: TextStyle(
                                      color: selected == index
                                          ? Colors.red
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        },
                      ),
                    ),
                    // InkWell(onTap: (){
                    //   setState(() {
                    //
                    //   });
                    // },
                    //     child:helper.tabs())
                    // ,
                    // helper.SelectionCategoryWidget(),
                    helper.subCategoriesAndProducts(),

                    // Expanded(child: helper.subCategoriesAndProducts()),

                    // SizedBox(
                    //   height: 10.h,
                    // ),

                    // utils.bottomBar(context, color: themeColor.backGroundColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }

  apis() {
    print("Calling categoryListingApi");

    try {
      homeRead.categoryListingApi(
        context,
        type: '3',
        title: '',
        isLoading: false,
      );
    } catch (e) {
      print("categoryListingApi==> $e");
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Routes.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Controllers/HomeProvider.dart';
// import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
// import 'package:skincanvas/main.dart';
// import 'package:skincanvas/web_helper/web_helper/customization_product.dart';

// class WebCustomoizationScreen extends StatefulWidget {
//   @override
//   State<WebCustomoizationScreen> createState() =>
//       _WebCustomoizationScreenState();
// }

// class _WebCustomoizationScreenState extends State<WebCustomoizationScreen>
//     with TickerProviderStateMixin {
//   GlobalKey<_WebCustomoizationScreenState> key =
//       GlobalKey<_WebCustomoizationScreenState>();
//   late TabController _tabController;
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();
//   var route = Routes();
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _tabController = TabController(length: 3, vsync: this);
//   // }

//   var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
//   var homeRead = navigatorkey.currentContext!.read<HomeController>();

//   var generalWatch1 = navigatorkey.currentContext!.read<GeneralController>();

//   var orderRead =
//       navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();

//   var generalWatch = Provider.of<GeneralController>(
//       navigatorkey.currentContext!,
//       listen: false);

//   setStateFunction() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       apis(isRefresh: false);
//       // homeRead.categoryStatusInitialize();
//     });
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // WebScreenHelper helper = WebScreenHelper(context, setStateFunction);
//     MenWebScreenHelper helper = MenWebScreenHelper(context);

//     return Scaffold(
//       // appBar: helper.appBar(),
//       backgroundColor: Color(0xff8D9AF8),
//       body: Padding(
//         padding:
//             const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 48),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: MediaQuery.sizeOf(context).height,
//               width: MediaQuery.sizeOf(context).width / 1.2,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28), color: Colors.black),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 18.0, vertical: 18.0),

//                 ///
//                 /// lIST OF iMAGES
//                 ///
//                 child: helper.mansoryGridView(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   apis({isRefresh = false}) async {
//     if (isRefresh == false) {
//       setState(() {
//         _tabController.index = 0;
//       });
//       getCMSData();
//     } else {
//       setState(() {
//         _tabController.index = _tabController.index;
//       });
//     }

//     await orderRead.cartListingApi(context, isLoading: false, isRoute: false);

//     await homeRead.categoryListingApi(context,
//         type: '0', title: '', isLoading: !isRefresh);

//     await homeRead.selectedCategoryUpdator(
//         index: 0, ID: homeWatch.categoryList[0].sId.toString(), type: '0');

//     // SharedPreferences myPrefs = await SharedPreferences.getInstance();

//     // notificationStatus = myPrefs.getBool('notificationStatus') ?? true;

//     // await navigatorkey.currentContext!.read<HomeController>().categoryListingApi(context, type: '1', title: '', isLoading: !isRefresh);
//     // await navigatorkey.currentContext!.read<HomeController>().categoryListingApi(context, type: '2', title: '', isLoading: !isRefresh);

//     // await navigatorkey.currentContext!.read<HomeController>().categoryListingApi(context, type: '4', title: '', isLoading: !isRefresh);

//     // await navigatorkey.currentContext!.read<HomeController>().categoryListingApi(context, type: '3', title: '', isLoading: false);
//   }

//   getCMSData() async {
//     generalWatch.getCMSApi(context, type: 'privacy-policy');
//     generalWatch.getCMSApi(context, type: 'about-us');
//     generalWatch.getFaqApi(context);
//   }
// }

// ///
// /// Header
// ///

// // Widget header({
// //   setting,
// //   settingonTap,
// //   createProduct,
// //   createProductonTap,
// //   customizationProduct,
// //   customizationProductonTap,
// //   context,
// //   TextEditingController? searchController,
// //   key,
// // }) {
// //   return ;
// // }
