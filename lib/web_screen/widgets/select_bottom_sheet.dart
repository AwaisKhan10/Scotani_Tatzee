// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Routes.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/Controllers/HomeProvider.dart';
// import 'package:skincanvas/main.dart';

// import '../../../AppConstant/Static.dart';
// import '../../../AppUtils/AppUtils.dart';

// Future<void> showChooseDialogue(
//   BuildContext context,
// ) {
//   var static = Statics();
//   var themeColor = ThemeColors();
//   var utils = AppUtils();
//   var route = Routes();
//   var theme = ThemeColors();

//   var homeRead = navigatorkey.currentContext!.read<HomeController>();
//   var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
//   return showDialog(
//       context: context,
//       barrierColor: Colors.black.withOpacity(0.80),
//       builder: (BuildContext context) {
//         return AlertDialog(
//             backgroundColor: Colors.black,
//             contentPadding: const EdgeInsets.all(18),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(
//                   30.0,
//                 ),
//               ),
//             ),
//             content: StatefulBuilder(
//               builder: (BuildContext context,
//                   void Function(void Function()) setState) {
//                 return SizedBox(
//                   width: MediaQuery.sizeOf(context).width / 3,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text('Please Choose',
//                           style: utils.generalHeadingBold(themeColor.blackColor,
//                               fontFamily: "finalBold",
//                               size: static.width > 550 ? 16.sp : 24.sp),
//                           textAlign: TextAlign.center),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Expanded(
//                           child: SingleChildScrollView(
//                               child: Column(children: [
//                         Row(
//                           children: [
//                             chooseFunction(context,
//                                 color: homeRead.isTattooSelect, onTap: () {
//                               // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProductScreen()));
//                               homeRead.categorySelectionToCreate(
//                                 product: false,
//                                 tattoo: true,
//                               );
//                             },
//                                 text: 'Create \n Product',
//                                 image: 'createProduct'),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             chooseFunction(context,
//                                 color: homeRead.isProductSelect, onTap: () {
//                               homeRead.categorySelectionToCreate(
//                                   product: true, tattoo: false);
//                             },
//                                 image: 'customizeProductQ',
//                                 text: 'Customize\n Product'),
//                             SizedBox(
//                               height: 15.h,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         homeRead.isProductSelect == false &&
//                                 homeRead.isTattooSelect == false
//                             ? SizedBox()
//                             : Container(
//                                 width: static.width,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 18.h,
//                                     horizontal:
//                                         static.width > 500 ? 15.w : 0.w),
//                                 child: utils.button(
//                                   textSize: static.width > 550 ? 10.sp : 20.sp,
//                                   text: "Next",
//                                   buttonColor: themeColor.orangeColor,
//                                   borderColor: themeColor.orangeColor,
//                                   fontFamily: 'finalBold',
//                                   ontap: () async {
//                                     if (homeRead.isTattooSelect) {
//                                       // homeRead
//                                       //     .designPromptController
//                                       //     .text = '';
//                                       // homeRead.desireTextController
//                                       //     .text = '';
//                                       // homeRead.desireColorController
//                                       //     .text = '';

//                                       // await homeRead
//                                       //     .createTattooBodySelectionInitialize();
//                                       // await homeRead
//                                       //     .createTattooDesignSelectionInitialize();
//                                       // await homeRead
//                                       //     .selectGraphicsStatusInitialize();

//                                       // await homeRead
//                                       //     .updateIsShowGraphicsContainer(
//                                       //         isBackButton: true);

//                                       Navigator.pop(context);
//                                       Navigator.pushNamed(context,
//                                           route.createProductScreenRoute);

//                                       homeRead.updateImageColorSliderPosition(
//                                           position: 0.0);

//                                       homeRead.updateImageShadeSliderPosition(
//                                           position: 0.0);

//                                       // homeRead
//                                       //     .updateImageCurrentColor(
//                                       //         color: themeColor
//                                       //             .whiteColor);

//                                       await homeRead.updateBaseColorIniatlize(
//                                           Color(0xffffffff));

//                                       homeRead.updateImageSize(size: 30.0);
//                                       homeRead.updateTextSize(size: 10.0);
//                                     } else if (homeRead.isProductSelect) {
//                                       // homeRead
//                                       //     .productDesirePromptController
//                                       //     .text = '';
//                                       // homeRead
//                                       //     .productDesireTextController
//                                       //     .text = '';

//                                       // await homeRead
//                                       //     .selectConfigurableCategoriesInitialize(
//                                       //         length: homeRead
//                                       //             .configureDataList
//                                       //             .length);

//                                       // await homeRead
//                                       //     .createTattooDesignSelectionInitialize();
//                                       // await homeRead
//                                       //     .selectGraphicsStatusInitialize();

//                                       // await homeRead
//                                       //     .updateIsShowGraphicsContainer(
//                                       //         isBackButton: true);

//                                       Navigator.pop(context);

//                                       Navigator.pushNamed(context,
//                                           route.selectCategoryScreenRoute);

//                                       homeRead.updateImageColorSliderPosition(
//                                           position: 0.0);

//                                       homeRead.updateImageShadeSliderPosition(
//                                           position: 0.0);

//                                       // homeRead
//                                       //     .updateImageCurrentColor(
//                                       //         color: themeColor
//                                       //             .whiteColor);
//                                       await homeRead.updateBaseColorIniatlize(
//                                           Color(0xffffffff));

//                                       homeRead.updateImageSize(size: 30.0);
//                                       homeRead.updateTextSize(size: 10.0);
//                                     }
//                                   },
//                                   textColor: themeColor.whiteColor,
//                                   width: static.width,
//                                 ),
//                               )
//                       ])))
//                     ],
//                   ),
//                 );
//               },
//             ));
//       });
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';

class WebSelectTattooAndProductBottomSheet {
  var static = Statics();
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var route = Routes();
  var theme = ThemeColors();
  WebSelectTattooAndProductBottomSheet();

  sheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: themeColor.transparentColor,
      isScrollControlled: true,
      builder: (builder) {
        return StatefulBuilder(
          builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Consumer<HomeController>(
              builder: (context, homeRead, _) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.0.r),
                            topLeft: Radius.circular(16.0.r)),
                        color: themeColor.blackColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0.h) +
                            EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('Please Choose',
                                style: utils.generalHeadingBold(
                                    themeColor.blackColor,
                                    fontFamily: "finalBold",
                                    size: static.width > 550 ? 16.sp : 24.sp),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        chooseFunction(context,
                                            color: homeRead.isTattooSelect,
                                            onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProductScreen()));
                                          homeRead.categorySelectionToCreate(
                                            product: false,
                                            tattoo: true,
                                          );
                                        },
                                            text: 'Create \n Product',
                                            image: 'createProduct'),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        chooseFunction(context,
                                            color: homeRead.isProductSelect,
                                            onTap: () {
                                          homeRead.categorySelectionToCreate(
                                              product: true, tattoo: false);
                                        },
                                            image: 'customizeProductQ',
                                            text: 'Customize\n Product'),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    homeRead.isProductSelect == false &&
                                            homeRead.isTattooSelect == false
                                        ? SizedBox()
                                        : Container(
                                            width: static.width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 18.h,
                                                horizontal: static.width > 500
                                                    ? 15.w
                                                    : 0.w),
                                            child: utils.button(
                                              textSize: static.width > 550
                                                  ? 10.sp
                                                  : 20.sp,
                                              text: "Next",
                                              buttonColor:
                                                  themeColor.orangeColor,
                                              borderColor:
                                                  themeColor.orangeColor,
                                              fontFamily: 'finalBold',
                                              ontap: () async {
                                                if (homeRead.isTattooSelect) {
                                                  // homeRead
                                                  //     .designPromptController
                                                  //     .text = '';
                                                  // homeRead.desireTextController
                                                  //     .text = '';
                                                  // homeRead.desireColorController
                                                  //     .text = '';

                                                  // await homeRead
                                                  //     .createTattooBodySelectionInitialize();
                                                  // await homeRead
                                                  //     .createTattooDesignSelectionInitialize();
                                                  // await homeRead
                                                  //     .selectGraphicsStatusInitialize();

                                                  // await homeRead
                                                  //     .updateIsShowGraphicsContainer(
                                                  //         isBackButton: true);

                                                  Navigator.pop(context);
                                                  Navigator.pushNamed(
                                                      context,
                                                      route
                                                          .createProductScreenRoute);

                                                  homeRead
                                                      .updateImageColorSliderPosition(
                                                          position: 0.0);

                                                  homeRead
                                                      .updateImageShadeSliderPosition(
                                                          position: 0.0);

                                                  // homeRead
                                                  //     .updateImageCurrentColor(
                                                  //         color: themeColor
                                                  //             .whiteColor);

                                                  await homeRead
                                                      .updateBaseColorIniatlize(
                                                          Color(0xffffffff));

                                                  homeRead.updateImageSize(
                                                      size: 30.0);
                                                  homeRead.updateTextSize(
                                                      size: 10.0);
                                                } else if (homeRead
                                                    .isProductSelect) {
                                                  // homeRead
                                                  //     .productDesirePromptController
                                                  //     .text = '';
                                                  // homeRead
                                                  //     .productDesireTextController
                                                  //     .text = '';

                                                  // await homeRead
                                                  //     .selectConfigurableCategoriesInitialize(
                                                  //         length: homeRead
                                                  //             .configureDataList
                                                  //             .length);

                                                  // await homeRead
                                                  //     .createTattooDesignSelectionInitialize();
                                                  // await homeRead
                                                  //     .selectGraphicsStatusInitialize();

                                                  // await homeRead
                                                  //     .updateIsShowGraphicsContainer(
                                                  //         isBackButton: true);

                                                  Navigator.pop(context);

                                                  Navigator.pushNamed(
                                                      context,
                                                      route
                                                          .selectCategoryScreenRoute);

                                                  homeRead
                                                      .updateImageColorSliderPosition(
                                                          position: 0.0);

                                                  homeRead
                                                      .updateImageShadeSliderPosition(
                                                          position: 0.0);

                                                  // homeRead
                                                  //     .updateImageCurrentColor(
                                                  //         color: themeColor
                                                  //             .whiteColor);
                                                  await homeRead
                                                      .updateBaseColorIniatlize(
                                                          Color(0xffffffff));

                                                  homeRead.updateImageSize(
                                                      size: 30.0);
                                                  homeRead.updateTextSize(
                                                      size: 10.0);
                                                }
                                              },
                                              textColor: themeColor.whiteColor,
                                              width: static.width,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

chooseFunction(BuildContext context, {color, onTap, image, text}) {
  return Expanded(
    child: Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 10.h),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                // color: color ? themeColor.orangeColor : themeColor.blackColor,
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage('assets/Images/$image.png'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(12.0.r)),
            child: Container(
              // / padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* Expanded(
                      child: Image.asset(
                        ,
                        width: 125,
                        fit: BoxFit.cover,
                      ),
                    ),*/
                  // Lottie.asset(
                  //   'assets/JSON/$image.json',
                  //   width: static.width > 550
                  //       ? static.width * .32
                  //       : static.width * .40,
                  //   height: static.width > 550
                  //       ? static.width * .28
                  //       : static.width * .35,
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              // height: 50,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0.r)),
              // color: themeColor.redColor,
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Text('$text',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
