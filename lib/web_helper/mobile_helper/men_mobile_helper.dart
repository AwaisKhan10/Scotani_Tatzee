import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/mobile_screen.dart';
import 'package:skincanvas/main.dart';

class MenMobileHelper {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  BuildContext context;
  MenMobileHelper(this.context);

  var mobileScreen =
      navigatorkey.currentContext!.watch<MobileScreenController>();

  ///
  /// Header
  ///

  Widget headerAppBar() {
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
                      "assets/Icons/scotani_logo.png",
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
                  Image.asset(
                    "assets/Icons/cartFilled.png",
                    scale: 2,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),

                  ///
                  /// profile
                  ///
                  CircleAvatar(radius: 20, child: Icon(Icons.person))
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
  }

  List<String> imgList = [
    'm1.png',
    'm2.png',
    'm3.png',
    'm4.png',
    'm5.png',
    'm6.png',
    'm7.png',
    'm8.png',
    'm9.png',
    'm10.png',
    'm11.png',
    'm12.png',
    'm13.png',
    'm14.png',
    'm15.png',
    'm16.png',
    'm17.png',
  ];

  listData() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 5),
      child: Container(
        height: 60,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                      image: AssetImage("assets/Images/${imgList[index]}"),
                      fit: BoxFit.cover)),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 5.w,
            );
          },
        ),
      ),
    );
  }

  List<String> images = [
    'p3',
    'p4',
    'p14',
    'p6',
    'p7',
    'p9',
    'p5',
    'p8',
    'p13',
    'p10',
    'p12',
    'p11',

    // 'p1',
    // 'p2',
  ];
  mansoryGridView() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Expanded(
        child: MasonryGridView.builder(
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(16.r),
                  //       image: DecorationImage(
                  //         image: AssetImage(
                  //             ),
                  //         fit: BoxFit.contain,
                  //       )),
                  // ),

                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset(
                        'assets/Images/${images[index]}.png',
                        fit: BoxFit.cover,
                      )),

                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ////
                        /// Product name
                        ///
                        Text('Striped ultra thin tracsuits',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: utils.textStyle6(
                                color: theme.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 7.sp)),
                        SizedBox(height: 3.h),
                        Text('MOQ : 40 Units',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: utils.textStyle6(
                                color: theme.whiteColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 5.sp)),
                        SizedBox(height: 3.h),

                        ///
                        /// Price
                        ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '140 USD',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 6.sp,
                                  color: theme.redColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'finalBold'),
                            ),

                            ///
                            /// Heart and Cart
                            ///
                            // Row(
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {},
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         padding: EdgeInsets.all(5.0),
                            //         decoration: BoxDecoration(
                            //             color: theme.blueColor,
                            //             borderRadius:
                            //                 BorderRadius.circular(8.0.r)),
                            //         child: Icon(
                            //           CupertinoIcons.heart_fill,
                            //           size: 5.sp,
                            //           color: theme.whiteColor,
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 2.w,
                            //     ),

                            //     ///
                            //     /// Cart
                            //     ///
                            //     GestureDetector(
                            //       onTap: () {},
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         padding: EdgeInsets.all(5.0),
                            //         decoration: BoxDecoration(
                            //             color: theme.redColor,
                            //             borderRadius:
                            //                 BorderRadius.circular(8.0.r)),
                            //         child: Icon(
                            //           Icons.shopping_cart,
                            //           size: 5.sp,
                            //           color: theme.whiteColor,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
