import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Helpers/SettingHelper/AboutUsHelper.dart';
import 'package:skincanvas/main.dart';

import '../../../../Controllers/GeneralProvider.dart';
import '../../../../Controllers/WebScreenHomeProvider.dart';

class AboutUsScreenWeb extends StatelessWidget {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  @override
  Widget build(BuildContext context) {
    AboutUsHelper helper = AboutUsHelper(context);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          backgroundColor: themeColor.backGroundColor,
          body: SafeArea(
            child: InternetConnectivityScreen(
              widget: Container(
                  width: 561,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        margin: EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        height: 69,
                        color: themeColor.redColor,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(
                                  CupertinoIcons.back,
                                  color: themeColor.whiteColor,
                                ),
                                onPressed: () {
                                  webHomeRead.settingScreenIndexUpdate(
                                      index: -1);
                                },
                                // Use provided onPress or default Navigator.pop
                                tooltip: 'Back', // Optional tooltip text
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'About Us',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: themeColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              helper.aboutUsDetailWeb(),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      helper.contactUsLabelWeb(),
                      helper.contactUsInfoWeb(),
                      SizedBox(
                        height: 15,
                      ),
                      utils.bottomBar(context,
                          color: themeColor.backGroundColor),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
