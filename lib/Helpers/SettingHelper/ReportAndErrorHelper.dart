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

import '../../Controllers/WebScreenHomeProvider.dart';

class ReportAndErrorHelper {
  BuildContext context;

  ReportAndErrorHelper(this.context);

  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();
  var route = Routes();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  Widget reportAndErrorText() {
    return Container(
      width: static.width,
      child: Column(
        children: [
          utils.appBar(
            context,
            barText: 'Report an Error',
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
              width: static.width * .70,
              child: Text(
                'To report the error, kindly enter your information. Our team will get in touch shortly to address the issue.',
                style: utils.smallLabelStyle(
                  theme.midGreyColor,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  Widget reportAndErrorTextWeb() {
    return Container(
      width: 561,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            margin: EdgeInsets.only(bottom: 5),
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
                      generalWatch.faqController.clear();
                      webHomeRead.settingScreenIndexUpdate(index: -1);
                    },
                    tooltip: 'Back', // Optional tooltip text
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Report an Error',
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
            height: 15,
          ),
          Container(
            width: 300,
            child: Text(
              'To report the error, kindly enter your information. Our team will get in touch shortly to address the issue.',
              style: utils.labelStyle(
                theme.blackColor,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget fieldForFullName() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: utils.inputField(
        textColor: theme.blackColor,
        postfixIcon: null,
        postfixClick: () async {},
        postfixIconColor: null,
        isEnable: false,
        placeholderColor: theme.blackColor,
        placeholder: 'Full Name',
        isSecure: false,
        controller: generalWatch.reportNameController,
        maxLines: 1,
      ),
    );
  }

  Widget fieldForEmail() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: utils.inputField(
        textColor: theme.blackColor,
        postfixIcon: null,
        postfixClick: () async {},
        postfixIconColor: null,
        isEnable: false,
        placeholderColor: theme.blackColor,
        placeholder: 'Your Email',
        isSecure: false,
        controller: generalWatch.reportEmailController,
        maxLines: 1,
      ),
    );
  }

  Widget fieldForPhone() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: utils.inputField(
        textColor: theme.blackColor,
        postfixIcon: null,
        postfixClick: () async {},
        postfixIconColor: null,
        isEnable: false,
        placeholderColor: theme.blackColor,
        placeholder: 'Your Phone',
        isSecure: false,
        controller: generalWatch.reportPhoneController,
        maxLines: 1,
      ),
    );
  }

  Widget fieldForSubject() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: utils.inputField(
        textColor: theme.blackColor,
        postfixIcon: null,
        postfixClick: () async {},
        postfixIconColor: null,
        placeholderColor: theme.blackColor,
        placeholder: 'Subject',
        isSecure: false,
        controller: generalWatch.reportSubjectController,
        maxLines: 1,
      ),
    );
  }

  Widget fieldForMessage() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: utils.inputField(
        textColor: theme.blackColor,
        postfixIcon: null,
        postfixClick: () async {},
        postfixIconColor: null,
        placeholderColor: theme.blackColor,
        placeholder: 'Write a Message',
        isSecure: false,
        controller: generalWatch.reportMessageController,
        maxLines: 6,
      ),
    );
  }

  Widget sendButton() {
    return Container(
      width: static.width,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      margin: EdgeInsets.only(top: 15.h),
      alignment: Alignment.bottomCenter,
      child: utils.button(
        textSize: static.width > 550 ? 10.sp : 20.sp,
        text: 'Send',
        buttonColor: theme.orangeColor,
        borderColor: theme.orangeColor,
        fontFamily: 'finalBold',
        ontap: () {
          if (generalWatch.reportNameController.text.isEmpty) {
            utils.showToast(context, message: 'Enter your name');
          } else if (generalWatch.reportEmailController.text.isEmpty) {
            utils.showToast(context, message: 'Enter email address');
          } else if (!regexEmail
              .hasMatch(generalWatch.reportEmailController.text)) {
            utils.showToast(context, message: 'Enter valid email');
          } else if (generalWatch.reportPhoneController.text.isEmpty) {
            utils.showToast(context,
                message: 'Enter phone number with country code');
          } else if (generalWatch.reportSubjectController.text.isEmpty) {
            utils.showToast(context, message: 'Please enter subject');
          } else if (!regexReportAndError
              .hasMatch(generalWatch.reportSubjectController.text)) {
            utils.showToast(context, message: 'Please enter valid subject');
          } else if (generalWatch.reportMessageController.text.isEmpty) {
            utils.showToast(context, message: 'Please enter message');
          } else if (!regexReportAndError
              .hasMatch(generalWatch.reportMessageController.text)) {
            utils.showToast(context, message: 'Please enter some valid reason');
          } else {
            generalRead.reportAndErrorApi(context);
          }
        },
        textColor: theme.whiteColor,
        width: static.width,
      ),
    );
  }

  Widget sendButtonWeb() {
    return Container(
      width: static.width,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          if (generalWatch.reportNameController.text.isEmpty) {
            utils.showToast(context, message: 'Enter your name');
          } else if (generalWatch.reportEmailController.text.isEmpty) {
            utils.showToast(context, message: 'Enter email address');
          } else if (!regexEmail
              .hasMatch(generalWatch.reportEmailController.text)) {
            utils.showToast(context, message: 'Enter valid email');
          } else if (generalWatch.reportPhoneController.text.isEmpty) {
            utils.showToast(context,
                message: 'Enter phone number with country code');
          } else if (generalWatch.reportSubjectController.text.isEmpty) {
            utils.showToast(context, message: 'Please enter subject');
          } else if (!regexReportAndError
              .hasMatch(generalWatch.reportSubjectController.text)) {
            utils.showToast(context, message: 'Please enter valid subject');
          } else if (generalWatch.reportMessageController.text.isEmpty) {
            utils.showToast(context, message: 'Please enter message');
          } else if (!regexReportAndError
              .hasMatch(generalWatch.reportMessageController.text)) {
            utils.showToast(context, message: 'Please enter some valid reason');
          } else {
            generalRead.reportAndErrorApi(context);
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: theme.orangeColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: theme.orangeColor, width: .7),
          ),
          child: Text(
            'Send',
            style: TextStyle(
              fontWeight: static.bold,
              fontSize: 20,
              color: theme.whiteColor,
              decoration: TextDecoration.none,
              fontFamily: 'finalBook',
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
