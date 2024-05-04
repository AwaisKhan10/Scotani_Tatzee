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
import 'package:skincanvas/Controllers/WebScreenHomeProvider.dart';
import 'package:skincanvas/Helpers/SettingHelper/ChangePasswordHelper.dart';
import 'package:skincanvas/main.dart';

import '../../../../Controllers/AuthenticationProvider.dart';

class ChangePasswordScreenWeb extends StatelessWidget {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  var authRead = navigatorkey.currentContext!.read<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    ChangePasswordHelper helper = ChangePasswordHelper(context);

    return WillPopScope(
      onWillPop: () async {
        if (generalWatch.restrictUserNavigation == false) {
          generalWatch.changeOldController.clear();
          generalWatch.changeNewController.clear();
          generalWatch.changeConfirmController.clear();
        }
        return generalWatch.restrictUserNavigation == false ? true : false;
      },
      child: InternetConnectivityScreen(
        widget: Container(
          height: 417,
          width: 380,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 69,
                decoration: BoxDecoration(
                  color: theme.redColor,
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          webHomeRead.settingScreenIndexUpdate(index: -1);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: theme.whiteColor,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Change Password',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: theme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: 284,
                  child: Text(
                    'Passwords need to be minimum 8 characters long with uppercase, lowercase, a number, and a special character.',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWeb(
                        controller: generalWatch.changeOldController,
                        hintText: 'Current Password'),
                    CustomTextFieldWeb(
                        controller: generalWatch.changeNewController,
                        hintText: 'New Password'),
                    CustomTextFieldWeb(
                      controller: generalWatch.changeConfirmController,
                      hintText: 'Confirm Password',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Hero(
                      tag: 'LoginToSignupButton',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                            width: 360,
                            height: 48,
                            child: InkWell(
                              onTap: () async {
                                if (generalWatch
                                    .changeOldController.text.isEmpty) {
                                  utils.showToast(context,
                                      message: 'Enter your current password');
                                } else if (generalWatch
                                    .changeNewController.text.isEmpty) {
                                  utils.showToast(context,
                                      message: 'Enter your new password');
                                } else if (!regexPassword.hasMatch(
                                    generalWatch.changeNewController.text)) {
                                  utils.showToast(context,
                                      message:
                                          'Password does not meet the required conditions.');
                                } else if (generalWatch
                                    .changeConfirmController.text.isEmpty) {
                                  utils.showToast(context,
                                      message: 'Enter your confirm password');
                                } else if (generalWatch
                                        .changeNewController.text !=
                                    generalWatch.changeConfirmController.text) {
                                  utils.showToast(context,
                                      message:
                                          "New Password and Confirm Password do not match");
                                } else {
                                  await authRead.resetPasswordApi(context,
                                      email: generalWatch.emailValue,
                                      newPassword:
                                          '${generalWatch.changeNewController.text}',
                                      oldPassword:
                                          "${generalWatch.changeOldController.text}");
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 9),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: theme.orangeColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: theme.orangeColor, width: .7),
                                ),
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: theme.whiteColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
