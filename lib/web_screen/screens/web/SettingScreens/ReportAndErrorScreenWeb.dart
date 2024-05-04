import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Helpers/SettingHelper/ReportAndErrorHelper.dart';
import 'package:skincanvas/main.dart';

class ReportAndErrorScreenWeb extends StatelessWidget {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();

  @override
  Widget build(BuildContext context) {
    ReportAndErrorHelper helper = ReportAndErrorHelper(context);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        width: 361,
        height: 643,
        child: Scaffold(
          backgroundColor: themeColor.whiteColor,
          body: SafeArea(
            child: InternetConnectivityScreen(
              widget: Column(
                children: [
                  helper.reportAndErrorTextWeb(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFieldWeb(
                              width: 361,
                              controller: generalWatch.reportNameController,
                              hintText: 'Report Name',
                              showSuffixIcon: false,
                            ),
                            CustomTextFieldWeb(
                              width: 361,
                              controller: generalWatch.reportEmailController,
                              hintText: 'Email',
                              showSuffixIcon: false,
                            ),
                            CustomTextFieldWeb(
                              width: 361,
                              controller: generalWatch.reportPhoneController,
                              hintText: 'Phone Number',
                              showSuffixIcon: false,
                            ),
                            CustomTextFieldWeb(
                              width: 361,
                              controller: generalWatch.reportSubjectController,
                              hintText: 'Subject',
                              showSuffixIcon: false,
                            ),
                            SizedBox(height: 12,)
,                            CustomTextFieldWeb(
                              width: 361,
                              height: 140,
                              maxLines: 6,
                              controller: generalWatch.reportMessageController,
                              hintText: 'Write a Message',
                              showSuffixIcon: false,
                            ),
                            helper.sendButtonWeb(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
