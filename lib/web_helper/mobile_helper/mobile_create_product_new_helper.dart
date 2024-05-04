// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Controllers/WebScreenHomeProvider.dart';
import 'package:skincanvas/Controllers/mobile_screen.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_screen/screens/web/home_screen/web_home_screen.dart';

class MobileCreateProductNewHelper {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  final setState;
  BuildContext context;
  MobileCreateProductNewHelper(this.context, this.setState);

  var mobileScreen =
      navigatorkey.currentContext!.watch<MobileScreenController>();

  var mobileViewHomeWatch =
      navigatorkey.currentContext!.watch<HomeController>();
  var mobileViewHomeRead = navigatorkey.currentContext!.read<HomeController>();

  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();
  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();

  var orderRead = Provider.of<OrderCheckOutWishlistController>(
      navigatorkey.currentContext!,
      listen: false);

  ///
  /// Header
  ///

  Widget headerAppBar() {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/Icons/logo_home.png",
                        scale: 10 / ScreenUtil().scaleWidth,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(
                        "assets/Icons/scotani_name.png",
                        scale: 10 / ScreenUtil().scaleWidth,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {
                          mobileScreen.onClickProduct();
                        },
                        child: Text(
                          "Create Product",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: mobileScreen.isCreateProduct
                                  ? Colors.red
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {
                          mobileScreen.onClickCustomized();

                          ///
                          /// Screen
                          ///
                          // Navigator.pushNamed(context, route.MainScreenViewRoute);
                        },
                        child: Text(
                          "Customize Product",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: mobileScreen.isCustomizedProduct
                                  ? Colors.red
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            mobileScreen.onClickSetting();
                          },
                          child: Text(
                            "Setting",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 10.sp,
                                color: mobileScreen.setting
                                    ? Colors.red
                                    : Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          FittedBox(
            child: Row(
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width / 1.4,
                  child: TextFormField(
                    controller: mobileScreen.searchController,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                      hintText: "Browse our wide range of apparel",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      prefixIcon: IconButton(
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset("assets/icons/close.svg"),
                        onPressed: () {
                          mobileScreen.searchController!.clear();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Row(
                  children: [
                    ///
                    /// image
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
                                  color: theme.whiteColor,
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/Icons/cart1.png",
                                scale: 3.5,
                              ),
                            ),
                            if (orderAndWishListWatch.quantityOfCartProduct !=
                                0)
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
                                      style: utils.xxlSmallLabelStyleB(
                                          theme.whiteColor),
                                    ),
                                  ),
                                  height: 20,
                                  width: 20,
                                ),
                              )
                          ]);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),

                    ///
                    /// profile
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
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.lightGreyColor,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: generalWatch.profilePhotoValue ?? '',
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
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    });
  }

  Widget rowContainer() {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///
          /// Change Product
          ///
          boxContainer(
              onPressed: () {
                mobileScreen.handleContainerClick(0);

                navigatorkey.currentContext!
                    .read<WebScreenHomeController>()
                    .updateScreenIndex(1);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebScreenHome(),
                  ),
                );
              },
              icon: 'repeat',
              text: 'Change Product',
              // scale: 5,
              boxColor: mobileScreen.firstContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Market Place
          ///
          boxContainer(
              onPressed: () {
                mobileScreen.handleContainerClick(1);
                navigatorkey.currentContext!
                    .read<WebScreenHomeController>()
                    .updateScreenIndex(0);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebScreenHome(),
                  ),
                );
              },
              icon: 'market_place',
              text: 'Market Place',
              // scale: 9,
              boxColor: mobileScreen.secondContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Preview
          ///
          boxContainer(
              onPressed: () {
                mobileScreen.handleContainerClick(2);
              },
              icon: 'preview',
              text: 'Preview',
              // scale: 9,
              boxColor: mobileScreen.thirdContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Create Product
          ///
          boxContainer(
              onPressed: () {
                mobileScreen.handleContainerClick(3);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CreateProductScreen()));
              },
              icon: 'create_product',
              text: 'Create Product',
              // scale: 9,
              boxColor: mobileScreen.forthContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Switch Sides
          ///
          boxContainer(
              onPressed: () {
                mobileScreen.handleContainerClick(4);
              },
              icon: 'switchSides',
              text: 'Switch Sides',
              // scale: 9,
              boxColor: mobileScreen.fifthContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),
        ],
      );
    });
  }

  Widget boxContainer({onPressed, icon, text, boxColor}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Expanded(
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: EdgeInsets.all(5),
            // width: 167,
            // height: 75,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: boxColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Images/$icon.png",
                  width: screenWidth * 0.05, // Adjust the factor as needed
                  height: screenWidth * 0.05, // Adjust the factor as needed
                  // scale: screenWidth * 0.02,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(6),
                      color: theme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'finalBook'),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget sideBarContainer() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      AppUtils.selectedImage,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 120,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: theme.whiteColor, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    "Select\nImprint\nStyle",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(6),
                        color: theme.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'finalBook'),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  sideContainer(onPressed: () {}, text: 'Direct to flim'),
                  sideContainer(onPressed: () {}, text: 'Emrideory'),
                  sideContainer(onPressed: () {}, text: 'Direct to Garment'),
                  sideContainer(onPressed: () {}, text: 'Patch'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  sideContainer({text, onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: 124,
        // height: 50,
        margin: EdgeInsets.all(5),
        // width: 167,
        // height: 75,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.redColor,
        ),
        child: Text(
          "$text",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(6),
              color: theme.whiteColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'finalBook'),
        ),
      ),
    );
  }

  Widget midContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: theme.whiteColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              toolsContainer(
                  onPressed: () {
                    mobileScreen.handleContainerTools(0);
                  },
                  icon: 'remove_background',
                  text: 'Remove Background',
                  // scale: 3.5,
                  boxColor: mobileScreen.isBackground
                      ? theme.redColor
                      : Colors.transparent),
              toolsContainer(
                  onPressed: () {
                    mobileScreen.handleContainerTools(1);
                  },
                  // scale: 5,
                  icon: 'change_color',
                  text: 'Change Design Color',
                  boxColor: mobileScreen.isDesignChnage
                      ? theme.redColor
                      : Colors.transparent),
              toolsContainer(
                  onPressed: () {
                    mobileScreen.handleContainerTools(2);
                  },
                  // scale: 5,
                  icon: 'trash1',
                  text: 'Delete Design',
                  boxColor: mobileScreen.isDelete
                      ? theme.redColor
                      : Colors.transparent),
              toolsContainer(
                  onPressed: () {
                    mobileScreen.handleContainerTools(3);
                  },
                  // scale: 5.5,
                  text: 'Change Product Color',
                  icon: 'change_product_color',
                  boxColor: mobileScreen.isChangeProduct
                      ? theme.redColor
                      : Colors.transparent),
            ],
          ),
        ],
      ),
    );
  }

  toolsContainer({
    // scale,
    onPressed,
    text,
    icon,
    boxColor,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Container(
                  // width: 124,

                  margin: EdgeInsets.all(10),
                  // width: 167,
                  // height: 75,

                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.whiteColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: boxColor,
                  ),
                  child: Image.asset(
                    "assets/Images/$icon.png",
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    // scale: scale,
                  )),
              Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(6),
                    color: theme.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'finalBook'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dragonContainer() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: theme.whiteColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: utils.inputField(
            textColor: theme.lightGreyColor,
            placeholderColor: theme.whiteColor,
            placeholder: 'Dragon anime art Cool\nDesign',
            isSecure: false,
            controller: generalWatch.designController,
            maxLines: 3,
            textfieldColor: theme.blackColor,
            borderColor: theme.whiteColor,
          ),
        ));
  }

  ///
  /// Dragon Images
  ///

  Widget dragonImages() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              "assets/Images/dragon1.png",
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Image.asset(
              "assets/Images/dragon2.png",
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Image.asset(
              "assets/Images/dragon3.png",
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget containerButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // button(
          //   onPressed: () {},
          //   text: 'Generator',
          //   image: 'generator',
          //   imageColor: theme.blackColor,
          //   textColor: theme.whiteColor,
          //   boxColor: theme.redColor,
          //   imageBoxColor: theme.whiteColor,
          // ),
          button(
            onPressed: () {
              mobileScreen.onClick();

              final designPrompt = generalWatch.designController.text.trim();
              final colorPrompt = generalWatch.colorsController.text.trim();
              final patternPrompt = generalWatch.patternController.text.trim();
              final promptLength = designPrompt.length +
                  colorPrompt.length +
                  patternPrompt.length;
              if (designPrompt.isNotEmpty && promptLength <= 900) {
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CreatedProductScreen(
                //             designPropt: designPrompt,
                //             colorPrompt: colorPrompt,
                //             patternPrompt: patternPrompt)),
                //     (route) => false);
                generalWatch.designController.clear();
                generalWatch.colorsController.clear();
                generalWatch.patternController.clear();
              } else if (promptLength > 900) {
                utils.showToast(context,
                    message:
                        'Design Prompt should be less then 900 charecters');
              } else {
                utils.showToast(context, message: 'Please enter your design');
              }
            },
            text: 'Generator',
            image: Icon(
              Icons.flip_camera_android,
              color:
                  mobileScreen.isSelect ? theme.blackColor : theme.whiteColor,
              size: 14.sp,
            ),
            // scale: 3.5,
            textColor:
                mobileScreen.isSelect ? theme.blackColor : theme.whiteColor,
            boxColor: mobileScreen.isSelect ? theme.whiteColor : theme.redColor,
            imageBoxColor:
                mobileScreen.isSelect ? theme.whiteColor : theme.redColor,
          ),

          SizedBox(
            width: 25.w,
          ),
          button(
            onPressed: () {
              mobileScreen.onClick();
            },
            text: 'Add to clothing',
            image: Icon(
              Icons.add,
              size: 14.sp,
              color:
                  mobileScreen.isSelect ? theme.whiteColor : theme.blackColor,
            ),
            // scale: 3.5,
            textColor:
                mobileScreen.isSelect ? theme.whiteColor : theme.blackColor,
            boxColor: mobileScreen.isSelect ? theme.redColor : theme.whiteColor,
            imageBoxColor:
                mobileScreen.isSelect ? theme.redColor : theme.whiteColor,
          ),
        ],
      ),
    );
  }

  // Widget rightContainer() {
  //   return Expanded(
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(right: 80.0),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //             decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               border: Border.all(color: theme.whiteColor, width: 1),
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //             child: Container(
  //               width: double.infinity,
  //               padding:
  //                   EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
  //               decoration: BoxDecoration(
  //                 color: Colors.transparent,
  //                 border: Border.all(color: theme.whiteColor, width: 1),
  //                 borderRadius: BorderRadius.circular(16),
  //               ),
  //               child: Expanded(
  //                 child: Text(
  //                   "Dragon anime art cool\n design",
  //                   textAlign: TextAlign.start,
  //                   style: utils.xlSmallLabelStyleB(theme.whiteColor),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20.h,
  //         ),

  //         ///
  //         /// Buttons
  //         ///

  //       ],
  //     ),
  //   );
  // }

  button(
      {onPressed,
      Widget? image,
      text,
      textColor,
      boxColor,
      // scale,
      imageBoxColor}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Expanded(
            child: Container(
              // height: 40,
              // alignment: Alignment.rz,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  '$text',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(10),
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'finalBook'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: imageBoxColor),
              child: image,

              //  Image.asset(
              //   "assets/Icons/$image.png",
              //   scale: scale,
              //   color: imageColor,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
