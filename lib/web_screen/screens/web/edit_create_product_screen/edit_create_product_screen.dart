// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Helpers/EditTattooAndProductHelper/EditTattooAndProductHelper.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_helper/web_helper/edit_create_product_helper.dart';
import 'package:skincanvas/web_screen/widgets/app_bar/custom_app_bar.dart';

class WebEditTattooAndProductScreen extends StatefulWidget {
  @override
  State<WebEditTattooAndProductScreen> createState() =>
      _WebEditTattooAndProductScreenState();
}

class _WebEditTattooAndProductScreenState
    extends State<WebEditTattooAndProductScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);
  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  @override
  Widget build(BuildContext context) {
    WebEditTattooAndProductHelper helper =
        WebEditTattooAndProductHelper(context, screenshotController);

    return WillPopScope(
      onWillPop: () async {
        if (generalWatch.restrictUserNavigation == false) {
          homeRead.updateIsIncreaseTextSize(value: false);
          if (homeWatch.imagePreview) {
            homeRead.updateImagePreview();
          }
          return homeWatch.imagePreview ? false : true;
        } else {
          return false;
        }
      },
      child: Scaffold(
        // backgroundColor: themeColor.backGroundColor,
        backgroundColor: Color(0xff8D9AF8),

        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: CustomWidgetAppBar()),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InternetConnectivityScreen(
                widget: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.black),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          helper.topBar(),
                          helper.rowContainer(),
                          helper.imageView(),
                          helper.setColorAndSize(),
                          helper.buttons(),
                          SizedBox(
                            height: 10.h,
                          ),
                          helper.animatedContainer(),
                        ],
                      ),
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
