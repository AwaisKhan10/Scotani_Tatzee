// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/AuthenticationProvider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Controllers/WebScreenHomeProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_screen/widgets/select_bottom_sheet.dart';

class CustomWidgetAppBar extends StatelessWidget {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var homeWatch = navigatorkey.currentContext!.watch<WebScreenHomeController>();
  var authWatch =
      navigatorkey.currentContext!.watch<AuthenticationController>();
  var authRead = navigatorkey.currentContext!.read<AuthenticationController>();

  var mobileViewHomeWatch =
      navigatorkey.currentContext!.watch<HomeController>();
  var mobileViewHomeRead = navigatorkey.currentContext!.read<HomeController>();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();

  var webHomeWatch =
      navigatorkey.currentContext!.watch<WebScreenHomeController>();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  var orderRead = Provider.of<OrderCheckOutWishlistController>(
      navigatorkey.currentContext!,
      listen: false);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
      backgroundColor: theme.blackColor,
      elevation: 0.0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Image.asset(
                      "assets/Icons/logo_web.png",
                      scale: 30.9 /
                          ScreenUtil()
                              .scaleWidth, // Adjust the scaling based on screen width
                    ),
                  ),
                  // SizedBox(
                  //   width: 5.w,
                  // ),
                  // Image.asset(
                  //   "assets/Icons/scotani_name.png",
                  //   scale: 20.0 /
                  //       ScreenUtil()
                  //           .scaleWidth, // Adjust the scaling based on screen width
                  // ),
                  SizedBox(
                    width: 15.w,
                  ),

                  ///
                  ///
                  ///  Create Product
                  ///

                  InkWell(
                    onTap: () {
                      webHomeRead.updateScreenIndex(0);
                    },
                    child: Text(
                      "Create Tattoos",
                      style: utils.xSmallLabelStyleB(
                          homeWatch.screenIndex == 0
                              ? theme.redColor
                              : theme.whiteColor,
                          fontSize: 9.sp,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),

                  ///
                  /// Customization Product
                  ///

                  // InkWell(
                  //   onTap: () {
                  //     webHomeRead.updateScreenIndex(1);
                  //   },
                  //   child: Text(
                  //     "Customize Product",
                  //     style: utils.xSmallLabelStyleB(
                  //         homeWatch.screenIndex == 1
                  //             ? theme.redColor
                  //             : theme.whiteColor,
                  //         fontSize: 20,
                  //         fontFamily: 'Poppins'),
                  //   ),
                  // ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      webHomeRead.updateScreenIndex(2);
                    },
                    child: Text(
                      "Settings",
                      style: utils.xSmallLabelStyleB(
                          webHomeWatch.screenIndex == 2
                              ? theme.redColor
                              : theme.whiteColor,
                          fontSize: 9.sp,
                          fontFamily: 'Poppins'),
                    ),
                  ),

                  ///
                  /// button
                  ///
                  // Container(
                  //   padding: EdgeInsets.all(4),
                  //   child: InkWell(
                  //     onTap: () async {
                  //       homeRead.categorySelectionToCreate(
                  //           product: false, tattoo: false);

                  //       homeRead.designPromptController.text = '';
                  //       homeRead.desireTextController.text = '';
                  //       homeRead.desireColorController.text = '';

                  //       await homeRead.createTattooBodySelectionInitialize();
                  //       await homeRead.createTattooDesignSelectionInitialize();
                  //       await homeRead.selectGraphicsStatusInitialize();

                  //       await homeRead.updateIsShowGraphicsContainer(
                  //           isBackButton: true);

                  //       // Navigator.pop(context);

                  //       // Navigator.pushNamed(context, route.createTattooScreenRoute);
                  //       WebSelectTattooAndProductBottomSheet().sheet(context);

                  //       // await showChooseDialogue(context);

                  //       homeRead.updateImageColorSliderPosition(position: 0.0);
                  //       homeRead.updateImageShadeSliderPosition(position: 0.0);

                  //       // homeRead
                  //       //     .updateImageCurrentColor(
                  //       //         color: themeColor
                  //       //             .whiteColor);

                  //       await homeRead
                  //           .updateBaseColorIniatlize(Color(0xffffffff));

                  //       homeRead.updateImageSize(size: 30.0);
                  //       homeRead.updateTextSize(size: 10.0);
                  //     },
                  //     child: Image.asset('assets/Images/centerLogo1.png',
                  //         width: static.width > 550 ? 24.w : 34.w,
                  //         height: static.width > 550 ? 24.h : 34.h),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),

              ///
              /// Search field
              ///
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 20),
                  child: TextFormField(
                    cursorColor: theme.redColor,
                    // style: utils
                    //     .xxlSmallLabelStyle(theme.blackColor)
                    //     .copyWith(fontSize: 14 / ScreenUtil().scaleWidth),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: theme.whiteColor,
                      hintText: 'Browse our wide range of apparel',
                      hintStyle: utils.xlSmallLabelStyle(theme.blackColor),
                      prefixIcon: Image.asset(
                        'assets/Icons/search.png',
                        color: theme.blackColor,
                        scale: 15 / ScreenUtil().scaleWidth,
                      ),
                      suffixIcon: Image.asset(
                        'assets/Icons/remove.png',
                        color: theme.blackColor,
                        scale: 15 / ScreenUtil().scaleWidth,
                      ),
                      // Adjust vertical padding
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),

              ///
              /// Cart
              ///
              InkWell(
                onTap: () async {
                  if (mobileViewHomeWatch.loadingApi == false) {
                    await orderRead.cartListingApi(context,
                        isLoading: true, isRoute: true);
                    orderRead.onCartFromHomeUpdate(value: true);
                  }
                },
                child: Consumer<OrderCheckOutWishlistController>(
                  builder: (context, orderAndWishListWatch, _) {
                    return Stack(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: theme.whiteColor, shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/Icons/cart1.png",
                          scale: 3,
                        ),
                      ),
                      if (orderAndWishListWatch.quantityOfCartProduct != 0)
                        Positioned(
                          right: 0.0,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.orangeColor),
                            child: Center(
                              child: Text(
                                "${orderAndWishListWatch.quantityOfCartProduct == 100 ? '99+' : orderAndWishListWatch.quantityOfCartProduct}",
                                style:
                                    utils.xxlSmallLabelStyleB(theme.whiteColor),
                              ),
                            ),
                            height: 20,
                            width: 20,
                          ),
                        ),
                    ]);
                  },
                ),
              ),

              ///
              /// Profile
              ///
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  utils.flipCard(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: theme.lightBlackColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.greyColor.withOpacity(.8),
                    ),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.lightGreyColor,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: generalWatch.profilePhotoValue ?? '',
                      placeholder: (context, url) => Icon(Icons.person,
                          size: 30, color: Colors.grey), // Placeholder icon
                      // progressIndicatorBuilder: (context, url, downloadProgress) =>
                      //     utils.loadingShimmer(
                      //   width: 30.w,
                      //   height: 30.h,
                      // ),
                      // errorWidget: (context, url, error) => utils.loadingShimmer(
                      //   width: 30.w,
                      //   height: 30.h,
                      // ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
