import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Helpers/SettingHelper/PrivacyAndPolicyHelper.dart';
import 'package:skincanvas/main.dart';

import '../../../../Controllers/WebScreenHomeProvider.dart';

class PrivacyAndPolicyScreenWeb extends StatelessWidget {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  @override
  Widget build(BuildContext context) {
    PrivacyAndPolicyHelper helper = PrivacyAndPolicyHelper(context);

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
                    Expanded(
                      child: helper.privacyAndPolicyTextWeb(() {
                        webHomeRead.settingScreenIndexUpdate(index: -1);
                      }),
                    ),
                    utils.bottomBar(
                      context,
                      color: themeColor.backGroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
