import 'package:flutter/material.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/web_helper/mobile_helper/men_mobile_helper.dart';

class MobileCustomoizationScreen extends StatefulWidget {
  @override
  State<MobileCustomoizationScreen> createState() => _MenMobileScreenState();
}

class _MenMobileScreenState extends State<MobileCustomoizationScreen>
    with TickerProviderStateMixin {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  @override
  Widget build(BuildContext context) {
    MenMobileHelper helper = MenMobileHelper(context);
    return Scaffold(
      backgroundColor: theme.blackColor,
      body:

          ///
          /// details data
          ///
          helper.mansoryGridView(),
    );
  }
}
