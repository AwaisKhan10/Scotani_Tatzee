import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/Widgets/WidgetUpAnimation.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Controllers/WebScreenHomeProvider.dart';
import 'package:skincanvas/Controllers/webScreensProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_screen/screens/web/home_screen/web_home_screen.dart';

class WebCreateProductHelper {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var route = Routes();
  BuildContext context;
  bool isScrolling = false;
  final setState;

  List<String> dragonimges = [
    'dragon1',
    'dragon2',
    'dragon3',
  ];

  WebCreateProductHelper(this.context, this.setState);

  var mobileViewHomeWatch =
      navigatorkey.currentContext!.watch<HomeController>();
  var mobileViewHomeRead = navigatorkey.currentContext!.read<HomeController>();

  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();
  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();

  var orderRead = Provider.of<OrderCheckOutWishlistController>(
      navigatorkey.currentContext!,
      listen: false);

  var webScreen = navigatorkey.currentContext!.watch<WebScreensController>();

  Widget headerAppBar() {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 35,
                    width: 24,
                  ),
                  Image.asset(
                    "assets/images/App_Name.png",
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {
                  webScreen.onClickProduct();

                  // webHomeRead.screenIndexUpdate(index: 0);

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WebScreen()));

                  ///
                  /// Screen
                  ///
                },
                child: Text(
                  "Create Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: webScreen.isCreateProduct
                          ? Colors.red
                          : Colors.white),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {
                  webScreen.onClickCustomized();

                  ///
                  /// Screen
                  ///
                  // Navigator.pushNamed(context, route.MainScreenViewRoute);
                },
                child: Text(
                  "Customize Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: webScreen.isCustomizedProduct
                          ? Colors.red
                          : Colors.white),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {
                  webScreen.onClickSetting();

                  // Navigator.pushNamed(
                  //   context, route.settingView);

                  ///
                  /// Screen
                  ///
                },
                child: Text(
                  "Setting",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: webScreen.setting ? Colors.red : Colors.white),
                ),
              ),
              SizedBox(
                width: 28,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.sizeOf(context).width / 2.5,
                child: TextFormField(
                  controller: webScreen.searchController1,
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
                        // Clear the text in SearchController1

                        webScreen.searchController1.clear();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 18,
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
                                    style: utils
                                        .xxlSmallLabelStyleB(theme.whiteColor),
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
      );
    });
  }

  Widget rowContainer() {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///
          /// Change Product
          ///
          boxContainer(
              onPressed: () {
                webScreen.handleContainerClick(0);
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
              scale: 5.5,
              boxColor: webScreen.firstContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Market Place
          ///
          boxContainer(
              onPressed: () {
                webScreen.handleContainerClick(1);
                // Navigator.push(context, route.cre)
                // Navigate to WebScreenHome and set the initial screen index to 1
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
              scale: 5,
              boxColor: webScreen.secondContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Preview
          ///
          boxContainer(
              onPressed: () {
                webScreen.handleContainerClick(2);
              },
              icon: 'preview',
              text: 'Preview',
              scale: 5,
              boxColor: webScreen.thirdContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Create Product
          ///
          boxContainer(
              onPressed: () {
                webScreen.handleContainerClick(3);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CreateProductScreen()));
              },
              icon: 'create_product',
              text: 'Create Product',
              scale: 5.5,
              boxColor: webScreen.forthContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),

          ///
          /// Switch Sides
          ///
          boxContainer(
              onPressed: () {
                webScreen.handleContainerClick(4);
              },
              icon: 'switchSides',
              text: 'Switch Sides',
              scale: 5,
              boxColor: webScreen.fifthContainerClicked
                  ? theme.redColor
                  : theme.transparentColor),
        ],
      );
    });
  }

  Widget boxContainer({onPressed, icon, scale, text, boxColor}) {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return GestureDetector(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Images/$icon.png",
                scale: scale,
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$text",
                style: utils.xxlSmallLabelStyleB(theme.whiteColor),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget sideBarContainer() {
    return Container(
      width: 162,
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
            style: utils.xlSmallLabelStyleB(theme.whiteColor),
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
    );
  }

  sideContainer({text, onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: 124,
        height: 76,
        margin: EdgeInsets.all(5),
        // width: 167,
        // height: 75,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.redColor,
        ),
        child: Text(
          "$text",
          textAlign: TextAlign.center,
          style: utils.xlSmallLabelStyleB(theme.whiteColor),
        ),
      ),
    );
  }

  imageView() {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: theme.blackColor),
        child: CachedNetworkImage(
          imageUrl: AppUtils.selectedImage,
          fit: BoxFit.cover,
        )

        //  Image.network(
        //   AppUtils.selectedImage,
        //   fit: BoxFit.cover,
        // ),
        );
  }

  // Widget midContainer() {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       color: Colors.transparent,
  //       // border: Border.all(color: theme.whiteColor, width: 1),
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             Image.network(
  //               AppUtils.selectedImage,
  //               height: 420,
  //               width: 430,
  //             ),
  //             Container(
  //               height: 70,
  //               width: 70,
  //               decoration: BoxDecoration(
  //                   color: Colors.transparent,
  //                   borderRadius: BorderRadius.circular(50),
  //                   border: Border.all(color: Colors.white)),
  //             )
  //           ],
  //         ),
  //         // ClipRRect(
  //         //   borderRadius: BorderRadius.circular(16.r),
  //         //   child: CachedNetworkImage(
  //         //     imageUrl: AppUtils.selectedImage,
  //         //     height: 420,
  //         //     width: 430,
  //         //     fit: BoxFit.cover,
  //         //   ),
  //         // ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             toolsContainer(
  //                 onPressed: () {
  //                   webScreen.handleContainerTools(0);
  //                 },
  //                 icon: 'remove_background',
  //                 text: 'Remove Background',
  //                 scale: 3.5,
  //                 boxColor: webScreen.isBackground
  //                     ? theme.redColor
  //                     : Colors.transparent),
  //             toolsContainer(
  //                 onPressed: () {
  //                   webScreen.handleContainerTools(1);
  //                 },
  //                 scale: 5,
  //                 icon: 'change_color',
  //                 text: 'Change Design Color',
  //                 boxColor: webScreen.isDesignChnage
  //                     ? theme.redColor
  //                     : Colors.transparent),
  //             toolsContainer(
  //                 onPressed: () {
  //                   webScreen.handleContainerTools(2);
  //                 },
  //                 scale: 5,
  //                 icon: 'trash1',
  //                 text: 'Delete Design',
  //                 boxColor:
  //                     webScreen.isDelete ? theme.redColor : Colors.transparent),
  //             toolsContainer(
  //                 onPressed: () {
  //                   webScreen.handleContainerTools(3);
  //                 },
  //                 scale: 5.5,
  //                 text: 'Change Product Color',
  //                 icon: 'change_product_color',
  //                 boxColor: webScreen.isChangeProduct
  //                     ? theme.redColor
  //                     : Colors.transparent),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  toolsContainer({
    scale,
    onPressed,
    text,
    icon,
    boxColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 90,
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
                  scale: scale,
                )),
            Text(
              "$text",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: theme.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'finalBook'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget textField() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       homeWatch.isShowGraphicsContainer
  //           ? selectGraphic()
  //           : Container(
  //               width: 600,
  //               child: utils.inputField(
  //                 textColor: theme.lightGreyColor,
  //                 placeholderColor: theme.whiteColor,
  //                 placeholder: 'Dragon anime art Cool\nDesign',
  //                 isSecure: false,
  //                 controller: homeWatch.productDesirePromptController,
  //                 maxLines: 2,
  //                 textfieldColor: theme.blackColor,
  //                 borderColor: theme.whiteColor,
  //               ),
  //             ),

  //     ],
  //   );
  // }

  Widget textFields() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Align(
        alignment: Alignment.center,
        child: homeWatch.isShowGraphicsContainer
            ? selectGraphic()
            : Container(
                padding: EdgeInsets.only(left: 22.w, right: 25.w),
                child: utils.inputField(
                  textColor: theme.whiteColor,
                  placeholderColor: theme.whiteColor,
                  placeholder: 'Dragon anime art\ncool design',
                  isSecure: false,
                  controller: homeWatch.productDesirePromptController,
                  maxLines: 3,
                  textfieldColor: theme.blackColor,
                  borderColor: theme.whiteColor,
                ),
              ),
      ),
    );
  }

  Widget nextButton() {
    return Container(
      width: static.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: utils.button(
        textSize: static.width > 550 ? 10.sp : 20.sp,
        text: homeWatch.isShowGraphicsContainer
            ? homeWatch.selectGraphics.contains(true)
                ? 'Awesome! Check Results'
                : 'Regenerate'
            : 'Next',
        buttonColor: theme.orangeColor,
        borderColor: theme.orangeColor,
        fontFamily: 'finalBold',
        ontap: () async {
          if (homeWatch.productDesirePromptController.text.isEmpty) {
            utils.showToast(context,
                message: 'Please add your graphic prompt field');
          } else {
            if (homeRead.selectGraphics.contains(true)) {
              await homeRead.sizeGroupAPi(context,
                  isLoading: true, isFromProduct: true);
              if (homeWatch.productDesireTextController.text.isNotEmpty)
                await homeRead.sizeGroupAPi(context,
                    isLoading: true, isDesireText: true);

              await homeRead.selectableTattoosAndGraphicListUpdate();

              homeRead.updateImageCurrentColor(color: Colors.transparent);
              homeRead.updateColor(Colors.transparent);
              homeRead.updateSelectedFontFamilyIndex(index: 0);
              await homeRead.isImageOrTextUpdation(value: true);
              homeRead.routingForEditScreenFromTattoo(value: false);
              homeRead.updateIsFromTattoo(value: false);
              await homeRead.updateBaseColorIniatlize(Color(0xffffffff));
              Navigator.pushNamed(
                  context, route.WebEditCreateAndProductWebScreenRoute);

              // Navigator.pushNamed(
              //     context, route.WebEditCreateAndProductWebScreenRoute);
            } else {
              homeRead.tattooAndGraphicGenerationAPi(context,
                  color: "Mixed Colors", isFromProduct: true);
            }

            // homeRead.selectGraphicsStatusInitialize(imagesLength: 3);
          }
        },
        textColor: theme.whiteColor,
        width: static.width,
      ),
    );
  }

  Widget selectGraphic() {
    return WidgetUpAnimation(
      top_to_bottom: false,
      height: 100.0,
      // The distance the widget will move during animation
      duration: Duration(milliseconds: 700),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Your Graphic',
                      style: utils.xlSmallLabelStyleB(theme.whiteColor,
                          fontFamily: 'finalBold'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeRead.updateIsShowGraphicsContainer(
                          isBackButton: true);
                      homeWatch.productDesirePromptController.clear();
                      homeWatch.productDesireTextController.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      color: theme.whiteColor,
                      size: 20.w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0;
                      i <
                          homeWatch.mdTattooAndGraphicsGenerationModal
                              .imagesList!.length;
                      i++)
                    Expanded(
                      child: graphicContainer(
                        image:
                            '${homeWatch.mdTattooAndGraphicsGenerationModal.imagesList![i].url}',
                        isSelect: homeWatch.selectGraphics[i],
                        onTap: () {
                          homeRead.selectGraphicsStatusUpdate(index: i);
                        },
                      ),
                    ),
                  // graphicContainer(
                  //   image: 'assets/Images/demoGraphics1.png',
                  //   isSelect: orderWatch.selectGraphics[0],
                  //   onTap: () {
                  //     orderRead.selectGraphicsStatusUpdate(index: 0);
                  //   },
                  // ),
                  // graphicContainer(
                  //   image: 'assets/Images/demoGraphics.png',
                  //   isSelect: orderWatch.selectGraphics[1],
                  //   onTap: () {
                  //     orderRead.selectGraphicsStatusUpdate(index: 1);
                  //   },
                  // ),
                  // graphicContainer(
                  //   image: 'assets/Images/demoGraphics2.png',
                  //   isSelect: orderWatch.selectGraphics[2],
                  //   onTap: () {
                  //     orderRead.selectGraphicsStatusUpdate(index: 2);
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget graphicContainer({image, onTap, isSelect}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
        width: static.width > 550 ? static.width * .22 : static.width * .26,
        height: static.width > 550 ? static.width * .22 : static.width * .26,
        decoration: BoxDecoration(
          color: theme.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: CachedNetworkImage(
            width: isSelect
                ? static.width > 500
                    ? static.width * .20
                    : static.width * .24
                : static.width > 500
                    ? static.width * .18
                    : static.width * .22,
            imageUrl: '$image',
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //     utils.loadingShimmer(
            //   height:
            //       static.width > 550 ? static.width * .15 : static.width * .2.w,
            //   width:
            //       static.width > 550 ? static.width * .15 : static.width * .2.w,
            // ),
            // errorWidget: (context, url, error) => utils.loadingShimmer(
            //   height: static.width > 550
            //       ? static.width * .15
            //       : static.width * .18.w,
            //   width: static.width > 550
            //       ? static.width * .15
            //       : static.width * .18.w,
            // ),
            fit: BoxFit.contain,
          ),

          // Image.asset(
          //   '$image',
          //   width: isSelect ? static.width * .22 : static.width * .19,
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }

  // button(
  //     {onPressed,
  //     Widget? image,
  //     text,
  //     textColor,
  //     boxColor,
  //     scale,
  //     imageBoxColor}) {
  //   return GestureDetector(
  //     onTap: onPressed,
  //     child: Stack(
  //       alignment: Alignment.centerLeft,
  //       children: [
  //         Container(
  //           // height: 70,
  //           alignment: Alignment.center,
  //           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
  //           decoration: BoxDecoration(
  //               color: boxColor, borderRadius: BorderRadius.circular(40)),
  //           child: Text(
  //             '$text',
  //             style: utils.xlSmallLabelStyleB(textColor),
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.all(3),
  //           decoration:
  //               BoxDecoration(shape: BoxShape.circle, color: Colors.black),
  //           child: Container(
  //             padding: EdgeInsets.all(10),
  //             decoration:
  //                 BoxDecoration(shape: BoxShape.circle, color: imageBoxColor),
  //             child: image,

  //             //  Image.asset(
  //             //   "assets/Icons/$image.png",
  //             //   scale: scale,
  //             //   color: imageColor,
  //             // ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
