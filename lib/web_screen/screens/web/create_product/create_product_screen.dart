// ignore_for_file: unused_local_variable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_helper/web_helper/web_create_product_new_helper.dart';
import 'package:skincanvas/web_screen/widgets/app_bar/custom_app_bar.dart';

class WebCreateProductScreen extends StatefulWidget {
  @override
  State<WebCreateProductScreen> createState() => _WebCreateProductScreenState();
}

class _WebCreateProductScreenState extends State<WebCreateProductScreen>
    with TickerProviderStateMixin {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var route = Routes();

  // var generalWatch = Provider.of<GeneralController>(
  //     navigatorkey.currentContext!,
  //     listen: false);
  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
  }

  setStateFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WebCreateProductHelper helper =
        WebCreateProductHelper(context, setStateFunction);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xff8D9AF8),
        // backgroundColor: Colors.black,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: CustomWidgetAppBar()),

        body: Padding(
          padding:
              const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.black),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),

                            ///
                            /// App Bar
                            ///

                            ///
                            /// header
                            ///
                            // helper.rowContainer(),

                            helper.imageView(),
                            helper.textFields(),
                            helper.nextButton(),

                            ///
                            /// side bar Container
                            ///
                            ///
                            // Expanded(
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       ///
                            //       /// 1st Container
                            //       ///
                            //       helper.sideBarContainer(),

                            //       ///
                            //       /// mid container
                            //       ///
                            //       helper.midContainer(imgUrl: imgUrl),

                            //       ///
                            //       /// last deatail and color changes , design and add to cart process
                            //       ///
                            //       helper.rightContainer(),
                            //       // Padding(
                            //       //   padding:
                            //       //       const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 48),
                            //       //   child: Row(
                            //       //     mainAxisAlignment: MainAxisAlignment.center,
                            //       //     children: [
                            //       //       Container(
                            //       //         height: MediaQuery.sizeOf(context).height,
                            //       //         width: MediaQuery.sizeOf(context).width / 1.2,
                            //       //         decoration: BoxDecoration(
                            //       //             borderRadius: BorderRadius.circular(28), color: Colors.black),
                            //       //         child: Column(
                            //       //           crossAxisAlignment: CrossAxisAlignment.start,
                            //       //           children: [

                            //       //                 ],
                            //       //               ),
                            //       //             ),
                            //       //           ],
                            //       //         ),
                            //       //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        homeWatch.isCreatingGraphic
                            ? Container(
                                alignment: Alignment.center,
                                height: static.height,
                                width: static.width,
                                color: theme.blackColor.withOpacity(.4),
                              )
                            : SizedBox(),
                        homeWatch.isCreatingGraphic
                            ? Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      color: theme.whiteColor,
                                      shape: BoxShape.circle),
                                ),
                              )
                            : SizedBox(),
                        homeWatch.isCreatingGraphic
                            ? Positioned(
                                left: static.width > 500 ? 50.w : 60.w,
                                top: 120.h,
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/JSON/tattooAndProductLottie.json',
                                    height: 185.h,
                                    width: 185.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        homeWatch.isCreatingGraphic
                            ? Positioned(
                                left: static.width > 500 ? 110.w : 120.w,
                                bottom: static.width > 500 ? 300.h : 300.h,
                                child: Text(
                                  'Magic Happening...',
                                  style: utils.labelStyleB(theme.whiteColor),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
