import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/webScreensProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_screen/widgets/custom_add_shirt_images.dart';

class WebCreateProductDetailHelper {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  BuildContext context;
  bool isScrolling = false;
  final setState;
  WebCreateProductDetailHelper(this.context, this.setState);

  var webScreen = navigatorkey.currentContext!.watch<WebScreensController>();

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
  ];

  Widget headerAppBar() {
    return Consumer<GeneralController>(builder: (context, generalWatch, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: webScreen.searchController,
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
                          setState(() {
                            webScreen.searchController.clear();
                          });
                        },
                      ),
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
                  Image.asset(
                    "assets/Icons/cartFilled.png",
                    scale: 2,
                  ),
                  SizedBox(
                    width: 8,
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
      );
    });
  }

  addImages() {
    return Container(
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.16,
      decoration: BoxDecoration(
        color: theme.whiteColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),

              ///
              /// Text
              ///
              Text(
                "Add Additional Variations",
                style: utils.xSmallLabelStyleB(theme.blackColor),
              ),

              ///
              /// shirts
              ///
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ///
                    /// custom images
                    ///
                    return CustomAddShirtImages();
                  }),

              ///
              /// Add images button from gallery
              ///

              InkWell(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    height: 172,
                    width: 166,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
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
                          padding: const EdgeInsets.only(top: 25.0, left: 10),
                          child: Image.asset(
                            "assets/Icons/add.png",
                            scale: 4,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )),
              ),

              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  midImage() {
    Color filteredColor = isScrolling
        ? Colors.transparent
        : mycolors[webScreen.selectedColorIndex];
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        decoration: BoxDecoration(
          color: theme.blackColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 4.sp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Back to home",
                      style: utils.xlSmallLabelStyle(Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius:
              //           BorderRadius.circular(10)),
              //   child: ColorFiltered(
              //     colorFilter: ColorFilter.mode(
              //         filteredColor, BlendMode.hue),
              //     child: Image.asset(
              //       'assets/Images/shirt.png',
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(5),
                height: 491,
                width: 412,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: Image.asset(
                  'assets/Images/shirt.png',
                  color: filteredColor,
                  colorBlendMode: BlendMode.hue,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  containerDetail() {
    return Expanded(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            color: theme.whiteColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(28))),
        child: SingleChildScrollView(
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
                    style: utils.xlSmallLabelStyleB(theme.blackColor),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      webScreen.decrement();
                    },
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
                      '${webScreen.counter}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      webScreen.increment();
                    },
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
                      themeColor:
                          webScreen.isSmall ? theme.redColor : theme.blackColor,
                      onPressed: () {
                        webScreen.onClickSmall();
                      },
                      title: 'S'),
                  sizedShirts(
                      height: 36,
                      width: 31,
                      themeColor: webScreen.isMedium
                          ? theme.redColor
                          : theme.blackColor,
                      onPressed: () {
                        webScreen.onClickMedium();
                      },
                      title: 'M'),
                  sizedShirts(
                      height: 36,
                      width: 27,
                      themeColor:
                          webScreen.isLarge ? theme.redColor : theme.blackColor,
                      onPressed: () {
                        webScreen.onClickLarge();
                      },
                      title: 'L'),
                  sizedShirts(
                      height: 36,
                      width: 35,
                      themeColor: webScreen.isXLarge
                          ? theme.redColor
                          : theme.blackColor,
                      onPressed: () {
                        webScreen.onClickXtraLarge();
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 12,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          size: 16,
                          color: webScreen.selectedColorIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        InkWell(
                          onTap: () {
                            webScreen.selectedColorIndex = index;
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: mycolors[index],
                              borderRadius: BorderRadius.circular(6),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Specification",
                      style: utils.xSmallLabelStyleB(theme.blackColor),
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: theme.blackColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Icons/cartFilled.png",
                              scale: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Add to Cart",
                                textAlign: TextAlign.center,
                                style:
                                    utils.xSmallLabelStyleB(theme.whiteColor),
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: theme.redColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "Add to Design",
                        style: utils.xSmallLabelStyleB(theme.whiteColor),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

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

  ///
  /// Header
  ///

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
//   return ;
// }
// Function to create a bullet point with dot and text
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
}
