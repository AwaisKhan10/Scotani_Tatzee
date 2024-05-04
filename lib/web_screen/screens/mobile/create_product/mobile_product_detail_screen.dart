// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';

class MobileProductDetailScreen extends StatefulWidget {
  const MobileProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<MobileProductDetailScreen> createState() =>
      _MobileProductDetailScreenState();
}

class _MobileProductDetailScreenState extends State<MobileProductDetailScreen>
    with TickerProviderStateMixin {
  GlobalKey<_MobileProductDetailScreenState> key =
      GlobalKey<_MobileProductDetailScreenState>();

  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  int selectedColorIndex = 0;

  List mycolors = <Color>[
    ///
    /// First row
    ///
    Colors.red,
    Color(0xffECE3D9),
    Colors.red,
    Color(0xffFF914D),

    ///
    /// 2nd row
    ///
    Colors.green,
    Color(0xffC1FF72),
    Color(0xff004AAD),
    Color(0xff63312F),

    ///
    /// 3rd row
    ///

    Colors.black,
    Color(0xff5CE1E6),
    Color(0xffECE3D9),
    Colors.black,

    ///
    /// 4th row
    ///

    Color(0xffD9D9D9),
    Color(0xffC1FF72),
    Color(0xffFF66C4),
    Color(0xffCB6CE6),

    ///
    /// 6th row
    ///

    Color(0xffFFBD59),
    Color(0xff000000),
    Color(0xff545454),
    Color(0xffC38E8C),

    ///
    /// 7th row
    ///

    Color(0xff63312F),
    Color(0xff0D6CFC),
    Color(0xff9747FF),
    Color(0xffFF0000),

    ///
    /// 8th row
    ///

    Color(0xff000000),
    Color(0xffC1FF72),
    Color(0xff63312F),
    Color(0xffC1FF72),

    ///
    /// 8th row
    ///

    Color(0xffC38E8C),
    Color(0xffFF0000),
    Color(0xffFF66C4),
    Color(0xff63312F),

    ///
    /// 9th row
    ///

    Color(0xffFFBD59),
    Color(0xffC1FF72),
    Color(0xffFF66C4),
    Color(0xff000000),

    ///
    /// 10th row
    ///

    Color(0xff63312F),
    Color(0xff000000),
    Color(0xffFF0000),
    Color(0xffC1FF72),

    ///
    /// 11th row
    ///

    Color(0xff0D6CFC),
    Color(0xffFF66C4),
    Color(0xffCB6CE6),
    Color(0xff5CE1E6),

    ///
    /// 12th row
    ///

    Color(0xffC38E8C),
    Color(0xff63312F),
    Color(0xff9747FF),
    Color(0xffECE3D9),
    // Colors.purple,
    // Colors.orange,
    // Colors.indigo,
    // Colors.black,

    // Colors.blue,
    // Colors.green,
    // Colors.purple,
    // Colors.orange,
    // Colors.indigo,
    // Colors.black
  ];

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  bool isSmall = true;
  bool isMedium = false;
  bool isLarge = false;
  bool isXLarge = false;

  onClickSmall() {
    isSmall = true;
    isMedium = false;
    isLarge = false;
    isXLarge = false;
  }

  onClickMedium() {
    isSmall = false;
    isMedium = true;
    isLarge = false;
    isXLarge = false;
  }

  onClickLarge() {
    isSmall = false;
    isMedium = false;
    isLarge = true;
    isXLarge = false;
  }

  onClickXtraLarge() {
    isSmall = false;
    isMedium = false;
    isLarge = false;
    isXLarge = true;
  }

  bool isCreateProduct = true;
  bool isCustomizedProduct = false;
  bool setting = false;

  onClickProduct() {
    isCreateProduct = true;
    isCustomizedProduct = false;
    setting = false;
  }

  onClickCustomized() {
    isCreateProduct = false;
    isCustomizedProduct = true;
    setting = false;
  }

  onClickSetting() {
    isCreateProduct = false;
    isCustomizedProduct = false;
    setting = true;
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///
                /// Header
                ///
                Container(
                  color: theme.blackColor,
                  child: header(
                      createProduct: isCreateProduct,
                      customizationProduct: isCustomizedProduct,
                      setting: setting,
                      createProductonTap: () {
                        setState(() {
                          onClickProduct();
                        });
                      },
                      customizationProductonTap: () {
                        setState(() {
                          onClickCustomized();
                          // Navigator.pushNamed(
                          //     context, route.MainScreenViewRoute);
                        });
                      },
                      settingonTap: () {
                        setState(() {
                          onClickSetting();
                        });
                      },
                      context: context,
                      searchController: _searchController,
                      key: key),
                ),

                ///
                /// deatial
                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  ///
                                  /// custom images
                                  ///
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          // height: 172,
                                          // width: 166,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Image.asset(
                                              "assets/Images/shirt.png"),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // height: 28.h,
                                                    // width: 16.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25,
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: theme.redColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8))),
                                                    child: Image.asset(
                                                      "assets/Icons/edit.png",
                                                      scale: 6.5,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // height: 28.h,
                                                    // width: 16.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25,
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: theme.blackColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8))),
                                                    child: Image.asset(
                                                      "assets/Icons/trash.png",
                                                      scale: 4,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 50),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/Icons/add.png",
                                        scale: 4,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, left: 10),
                                        child: Image.asset(
                                          "assets/Icons/add.png",
                                          scale: 4,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Whiskas® Dry Adult Dewasa 7+, Cat food Rasa Mackerel",
                              style: utils.smallLabelStyleB(theme.blackColor),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Description:",
                              style: utils.xSmallLabelStyleB(theme.blackColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildBulletPoint(
                                      'Makanan yang lengkap dan seimbang, dengan 41 nutrisi penting.'),
                                  buildBulletPoint(
                                      'Mengandung antioksidan (vitamin E dan selenium) untuk sistem kekebalan tubuh yang sehat.'),
                                  buildBulletPoint(
                                      'Mengandung serat untuk memperlancar pencernaan dan meningkatkan kesehatan usus.'),
                                ],
                              ),
                            ),

                            ////
                            /// Increment
                            ///
                            /// And
                            ///
                            ///  Decremnet
                            ///
                            ///
                            Row(
                              children: [
                                Text(
                                  "Qty:",
                                  style: utils
                                      .xlSmallLabelStyleB(theme.blackColor),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: _decrement,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: theme.redColor,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Icon(
                                      Icons.remove,
                                      size: 12,
                                      color: theme.whiteColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 38,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: theme.blackColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    '$_counter',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: _increment,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: theme.redColor),
                                    child: Icon(
                                      Icons.add,
                                      size: 12,
                                      color: theme.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///
                            ///
                            ///
                            /// Size of the shirt
                            ///
                            ///
                            ///
                            Text(
                              "Size:",
                              style: utils.xlSmallLabelStyleB(theme.blackColor),
                            ),
                            Row(
                              children: [
                                sizedShirts(
                                    height: 36,
                                    width: 28,
                                    themeColor: isSmall
                                        ? theme.redColor
                                        : theme.blackColor,
                                    onPressed: () {
                                      setState(() {
                                        onClickSmall();
                                      });
                                    },
                                    title: 'S'),
                                sizedShirts(
                                    height: 36,
                                    width: 31,
                                    themeColor: isMedium
                                        ? theme.redColor
                                        : theme.blackColor,
                                    onPressed: () {
                                      setState(() {
                                        onClickMedium();
                                      });
                                    },
                                    title: 'M'),
                                sizedShirts(
                                    height: 36,
                                    width: 27,
                                    themeColor: isLarge
                                        ? theme.redColor
                                        : theme.blackColor,
                                    onPressed: () {
                                      setState(() {
                                        onClickLarge();
                                      });
                                    },
                                    title: 'L'),
                                sizedShirts(
                                    height: 36,
                                    width: 35,
                                    themeColor: isXLarge
                                        ? theme.redColor
                                        : theme.blackColor,
                                    onPressed: () {
                                      setState(() {
                                        onClickXtraLarge();
                                      });
                                    },
                                    title: 'XL'),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            ///
                            /// Colors
                            ///
                            Text(
                              "Colors:",
                              style: utils.xlSmallLabelStyleB(theme.blackColor),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            ///
                            /// colors
                            ///

                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.symmetric(horizontal: 27),
                              itemCount: mycolors.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 12,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Icon(
                                      //   Icons.check,
                                      //   size: 16,
                                      //   color: selectedColorIndex == index
                                      //       ? Colors.grey
                                      //       : Colors.transparent,
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedColorIndex = index;
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: mycolors[index],
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 20.h),

                            ///
                            /// Specification
                            ///
                            Row(
                              children: [
                                Image.asset(
                                  "assets/Icons/specification.png",
                                  scale: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "Specification",
                                    style: utils
                                        .xSmallLabelStyleB(theme.blackColor),
                                  ),
                                ),
                                Image.asset(
                                  "assets/Icons/arrow.png",
                                  scale: 3,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),

                            ///
                            /// Button
                            ///
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: theme.blackColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Image.asset(
                                                "assets/Icons/cartFilled.png",
                                                scale: 3),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(10),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'finalBook',
                                                color: theme.whiteColor,
                                                fontSize: ScreenUtil().setSp(7),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: theme.redColor,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      "Add to Design",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'finalBook',
                                        color: theme.whiteColor,
                                        fontSize: ScreenUtil().setSp(7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 18,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

///
/// Header
///

Widget header({
  setting,
  settingonTap,
  createProduct,
  createProductonTap,
  customizationProduct,
  customizationProductonTap,
  context,
  TextEditingController? searchController,
  key,
}) {
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
                    onTap: createProductonTap,
                    child: Text(
                      "Create Product",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          color: createProduct ? Colors.red : Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: customizationProductonTap,
                    child: Text(
                      "Customize Product",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          color:
                              customizationProduct ? Colors.red : Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: settingonTap,
                      child: Text(
                        "Setting",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10.sp,
                            color: setting ? Colors.red : Colors.white),
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
                controller: searchController,
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
                      (key as GlobalKey<_MobileProductDetailScreenState>)
                          .currentState
                          ?.setState(() {
                        searchController!.clear();
                      });
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

// ///
// /// tab bar
// ///
// tabBar({tabController, AppUtils? utils}) {
//   return // Wrap TabBar with Container for left alignment
//       Container(
//     alignment: Alignment.topLeft,
//     child: TabBar(
//         isScrollable: true, // Set to true for left alignment
//         controller: tabController,
//         tabAlignment: TabAlignment.start,
//         tabs: [
//           Tab(
//             text: 'Men',
//           ),
//           Tab(text: 'Women'),
//           Tab(text: 'Kids'),
//         ],
//         labelColor: Colors.red, // Text color for active tab
//         unselectedLabelColor: Colors.white, // Text color for inactive tabs
//         // indicatorColor: Colors.transparent, // Color of the indicator
//         indicator: BoxDecoration(color: Colors.transparent),
//         // dividerHeight: null,
//         dividerColor: Colors.transparent,
//         labelStyle: utils!.smallLabelStyleB(Colors.transparent)),
//   );
// }

// ///
// /// tab view
// ///
// tabView({tabController}) {
//   return // Add a TabBarView
//       Expanded(
//     child: TabBarView(
//       controller: tabController,
//       children: [
//         MenMobileScreen(),
//         // Screen2(),
//         // Screen3(),
//       ],
//     ),
//   );
// }

///
/// Sized Shirts
///

sizedShirts({themeColor, title, onPressed, height, width}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: themeColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        '${title}',
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget buildBulletPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: Icon(
          Icons.brightness_1,
          size: 4.0,
        ),
      ),
      SizedBox(width: 8.0),
      Expanded(
        child: Text(
          text,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
        ),
      ),
    ],
  );
}
