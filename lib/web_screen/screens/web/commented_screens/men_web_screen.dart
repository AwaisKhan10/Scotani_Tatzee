// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Controllers/HomeProvider.dart';
// import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
// import 'package:skincanvas/main.dart';
// import 'package:skincanvas/web_helper/screens/web_helper/men_web_helper.dart';

// class MenWebScreen extends StatefulWidget {
//   @override
//   State<MenWebScreen> createState() => _MenWebScreenState();
// }

// class _MenWebScreenState extends State<MenWebScreen>
//     with TickerProviderStateMixin {
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();

//   var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
//   var homeRead = navigatorkey.currentContext!.read<HomeController>();

//   var generalWatch = navigatorkey.currentContext!.read<GeneralController>();

//   var orderRead =
//       navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();

//   late TabController _tabController;
//   ScrollController scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       apis(isRefresh: false);
//       // homeRead.categoryStatusInitialize();
//     });
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     MenWebScreenHelper helper =
//         MenWebScreenHelper(context, _tabController, scrollController);
//     return Scaffold(
//       backgroundColor: theme.blackColor,
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(children: [
//             // helper.SelectionCategoryWidget(),
//             // /
//             // / top list
//             // /

//             // helper.SelectionCategoryWidget(),
//             helper.listData(),

//             ///
//             /// details data
//             ///
//             helper.mansoryGridView(),
//             // helper.subCategoriesAndProducts(),

//             // SizedBox(
//             //   height: 15.h,
//             // ),
//             // helper.appBar(),
//             // SizedBox(
//             //   height: 10.h,
//             // ),
//             // helper.fieldForSearch(),
//             // helper.tabs(),
//             // Expanded(
//             //   child: helper.tabView(),
//             // ),
//           ]),
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
