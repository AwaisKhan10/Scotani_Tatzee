import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/AuthenticationProvider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Views/Authentication/LoginAndSignupScreen.dart';
import 'package:skincanvas/main.dart';

class AboutUsHelper {
  BuildContext context;

  AboutUsHelper(this.context);

  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();
  var route = Routes();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();

  Widget aboutUsText() {
    return utils.appBar(
      context,
      barText: 'About Us',
    );
  }

  aboutUsDetail() {
    final plainText = utils.convertHtmlToPlainText(generalWatch.aboutUsData);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w) +
            EdgeInsets.only(bottom: 10.h, top: 10.h),
        child: Text(
          "$plainText",
          style: utils.labelStyle(
            theme.whiteColor.withOpacity(.7),
          ),
          textAlign: TextAlign.justify,
        ));
  }

  aboutUsDetailWeb() {
    final plainText = generalWatch.aboutUsData != null
        ? utils.convertHtmlToPlainText(generalWatch.aboutUsData)
        : 'null';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20) +
          EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        "$plainText",
        style: utils.labelStyle(theme.whiteColor.withOpacity(.7),
            fontSize: 15, fontFamily: 'Poppins'),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget contactUsLabel() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Contact Us",
            style: utils.xlHeadingStyle(theme.whiteColor,
                fontFamily: 'playDisplay'),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 1.5.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: theme.orangeColor,
              border: Border.all(color: theme.orangeColor, width: 2.2),
            ),
          )
        ],
      ),
    );
  }

  Widget contactUsLabelWeb() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Contact Us",
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: theme.whiteColor,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 1.5,
            width: 40,
            decoration: BoxDecoration(
              color: theme.orangeColor,
              border: Border.all(color: theme.orangeColor, width: 2.2),
            ),
          )
        ],
      ),
    );
  }

  Widget contactUsInfoWeb() {
    return Column(
      children: [
        generalWatch.mdSettingModal.data!.settings!.phone!.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  utils.openUrl(
                      generalWatch.mdSettingModal.data!.settings!.phone!);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: theme.whiteColor.withOpacity(.7),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${generalWatch.mdSettingModal.data!.settings!.phone}",
                      style: utils.labelStyle(
                        theme.whiteColor.withOpacity(.7),
                        fontFamily: 'finalBold',
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
        SizedBox(
          height: 8,
        ),
        generalWatch.mdSettingModal.data!.settings!.email!.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  utils.openUrl(
                      generalWatch.mdSettingModal.data!.settings!.email!);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: theme.whiteColor.withOpacity(.7),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${generalWatch.mdSettingModal.data!.settings!.email}",
                      style: utils.labelStyle(
                        theme.whiteColor.withOpacity(.7),
                        fontFamily: 'finalBold',
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
        SizedBox(
          height: 10,
        ),
        socialIconsWeb(),
      ],
    );
  }

  Widget contactUsInfo() {
    return Column(
      children: [
        generalWatch.mdSettingModal.data!.settings!.phone!.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  utils.openUrl(
                      generalWatch.mdSettingModal.data!.settings!.phone!);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: theme.whiteColor.withOpacity(.7),
                      size: static.width > 550 ? 14.sp : 18.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "${generalWatch.mdSettingModal.data!.settings!.phone}",
                      style: utils.labelStyle(theme.whiteColor.withOpacity(.7),
                          fontFamily: 'finalBold'),
                    )
                  ],
                ),
              ),
        SizedBox(
          height: 8,
        ),
        generalWatch.mdSettingModal.data!.settings!.email!.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  utils.openUrl(
                      generalWatch.mdSettingModal.data!.settings!.email!);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: theme.whiteColor.withOpacity(.7),
                      size: static.width > 550 ? 14.sp : 18.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "${generalWatch.mdSettingModal.data!.settings!.email}",
                      style: utils.labelStyle(theme.whiteColor.withOpacity(.7),
                          fontFamily: 'finalBold'),
                    )
                  ],
                ),
              ),
        SizedBox(
          height: 10.h,
        ),
        socialIcons(),
      ],
    );
  }

  socialIcons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
          ),
          generalWatch.mdSettingModal.data!.settings!.instagram!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.instagram == null
              ? SizedBox()
              : utils.aboutUsIconsInfo(
                  image: 'instagram',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.instagram
                        .toString());
                  }),
          SizedBox(
            width: 15.w,
          ),
          generalWatch.mdSettingModal.data!.settings!.facebook!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.facebook == null
              ? SizedBox()
              : utils.aboutUsIconsInfo(
                  image: 'facebook',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.facebook
                        .toString());
                  }),
          SizedBox(
            width: 15.w,
          ),
          generalWatch.mdSettingModal.data!.settings!.twitter!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.twitter == null
              ? SizedBox()
              : utils.aboutUsIconsInfo(
                  image: 'twitter',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.twitter
                        .toString());
                  }),
          SizedBox(
            width: 15.w,
          ),
          generalWatch.mdSettingModal.data!.settings!.linkedin!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.linkedin == null
              ? SizedBox()
              : utils.aboutUsIconsInfo(
                  image: 'linkedin',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.linkedin
                        .toString());
                  }),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }

  socialIconsWeb() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          generalWatch.mdSettingModal.data!.settings!.instagram!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.instagram == null
              ? SizedBox()
              : utils.aboutUsIconsInfoWeb(
                  image: 'instagram',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.instagram
                        .toString());
                  }),
          SizedBox(
            width: 15,
          ),
          generalWatch.mdSettingModal.data!.settings!.facebook!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.facebook == null
              ? SizedBox()
              : utils.aboutUsIconsInfoWeb(
                  image: 'facebook',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.facebook
                        .toString());
                  }),
          SizedBox(
            width: 15,
          ),
          generalWatch.mdSettingModal.data!.settings!.twitter!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.twitter == null
              ? SizedBox()
              : utils.aboutUsIconsInfoWeb(
                  image: 'twitter',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.twitter
                        .toString());
                  }),
          SizedBox(
            width: 15,
          ),
          generalWatch.mdSettingModal.data!.settings!.linkedin!.isEmpty ||
                  generalWatch.mdSettingModal.data!.settings!.linkedin == null
              ? SizedBox()
              : utils.aboutUsIconsInfoWeb(
                  image: 'linkedin',
                  onTap: () async {
                    await utils.openUrl(generalWatch
                        .mdSettingModal.data!.settings!.linkedin
                        .toString());
                  }),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
