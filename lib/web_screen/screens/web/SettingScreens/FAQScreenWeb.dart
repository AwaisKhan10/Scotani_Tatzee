// ignore_for_file: deprecated_member_use

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
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Helpers/SettingHelper/FAQHelper.dart';
import 'package:skincanvas/main.dart';

import '../../../../Controllers/WebScreenHomeProvider.dart';

class FAQScreenWeb extends StatelessWidget {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();
  @override
  Widget build(BuildContext context) {
    FAQHelper helper = FAQHelper(context);

    return WillPopScope(
      onWillPop: () async {
        generalWatch.faqController.clear();
        webHomeRead.settingScreenIndexUpdate(index: -1);
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: InternetConnectivityScreen(
          widget: Container(
              width: 561,
              color: themeColor.lightBlackColor,
              height: MediaQuery.of(context).size.height,
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
                              generalWatch.faqController.clear();
                              webHomeRead.settingScreenIndexUpdate(index: -1);
                            },
                            // Use provided onPress or default Navigator.pop
                            tooltip: 'Back', // Optional tooltip text
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'FAQs',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: themeColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  helper.fieldForSearchWeb(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            helper.faqStatementsWeb(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
