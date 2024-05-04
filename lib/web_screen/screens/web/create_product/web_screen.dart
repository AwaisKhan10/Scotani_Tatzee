import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Helpers/FragmentHelpers/HomeFragmentHelper.dart';
import 'package:skincanvas/main.dart';

class WebScreen extends StatefulWidget {
  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> with TickerProviderStateMixin {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  late TabController _tabController;
  ScrollController scrollController = ScrollController();

  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  var generalWatch = navigatorkey.currentContext!.read<GeneralController>();

  var orderRead =
      navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      apis(isRefresh: false);
      // homeRead.categoryStatusInitialize();
    });
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeFragmentHelper helper =
        HomeFragmentHelper(context, _tabController, scrollController);
    //WebScreenHelper webHelper = WebScreenHelper(context,_tabController,scrollController);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          helper.tabBarWeb(
            tabController: _tabController,
          ),
          helper.tabViewWeb(
            tabController: _tabController,
          ),
        ],
      ),
    );
  }

  apis({isRefresh = false}) async {
    if (isRefresh == false) {
      setState(() {
        _tabController.index = 0;
      });
      getCMSData();
    } else {
      setState(() {
        _tabController.index = _tabController.index;
      });
    }

    await orderRead.cartListingApi(context, isLoading: false, isRoute: false);

    await homeRead.categoryListingApi(context,
        type: '0', title: '', isLoading: !isRefresh);

    // await homeRead.productListingApi(context,
    //     type: '0',
    //     title: '',
    //     categoryID:'650db9de85ec407c946dd023',
    //     isLoading: false);

    await homeRead.selectedCategoryUpdator(
        index: 0, ID: homeWatch.categoryList[0].sId.toString(), type: '0');
  }

  getCMSData() async {
    generalWatch.getFaqApi(context);
  }
}





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Controllers/HomeProvider.dart';
// import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
// import 'package:skincanvas/main.dart';
// import 'package:skincanvas/web_helper/web_helper.dart';
//
// import '../Helpers/FragmentHelpers/HomeFragmentHelper.dart';
//
// class WebScreen extends StatefulWidget {
//   @override
//   State<WebScreen> createState() => _WebScreenState();
// }
//
// class _WebScreenState extends State<WebScreen> with TickerProviderStateMixin {
//   late TabController _tabController;
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();
//   ScrollController scrollController = ScrollController();
//
//   var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
//   var homeRead = navigatorkey.currentContext!.read<HomeController>();
//
//   var generalWatch = navigatorkey.currentContext!.read<GeneralController>();
//
//   var orderRead =
//       navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       apis(isRefresh: false);
//       //homeRead.categoryStatusInitialize();
//     });
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
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
//
//     await orderRead.cartListingApi(context, isLoading: false, isRoute: false);
//
//     await homeRead.categoryListingApi(context,
//         type: '0', title: '', isLoading: !isRefresh);
//
//     await homeRead.selectedCategoryUpdator(
//         index: 0, ID: homeWatch.categoryList[0].sId.toString(), type: '0');
//   }
//
//   getCMSData() async {
//     generalWatch.getFaqApi(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     HomeFragmentHelper helper =
//         HomeFragmentHelper(context, _tabController, scrollController);
//
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             helper.tabBarWeb(
//               tabController: _tabController,
//             ),
//             helper.tabViewWeb(
//               tabController: _tabController,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use