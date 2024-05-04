import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';

class PrivacyAndPolicyHelper {
  BuildContext context;

  PrivacyAndPolicyHelper(this.context);

  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();
  var route = Routes();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();

  Widget privacyAndPolicyText() {
    final plainText =
        utils.convertHtmlToPlainText(generalWatch.privacyAndPolicyData);

    return Container(
      width: static.width,
      child: Column(
        children: [
          utils.appBar(
            context,
            barText: 'Privacy Policy',
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w) +
                      EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "$plainText",
                    style: utils.labelStyle(
                      theme.whiteColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.justify,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget privacyAndPolicyTextWeb(Function onPressed) {
    final plainText =
        utils.convertHtmlToPlainText(generalWatch.privacyAndPolicyData);

    return Container(
      width: static.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            margin: EdgeInsets.only(
              bottom: 5,
            ),
            width: double.infinity,
            height: 69,
            color: theme.redColor,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      CupertinoIcons.back,
                      color: theme.whiteColor,
                    ),
                    onPressed: () {
                      onPressed();
                    },
                    // Use provided onPress or default Navigator.pop
                    tooltip: 'Back', // Optional tooltip text
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Privacy Policy',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: theme.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20) +
                    EdgeInsets.only(bottom: 10),
                child: Text(
                  "$plainText",
                  style: utils.labelStyle(
                    theme.whiteColor.withOpacity(.7),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
