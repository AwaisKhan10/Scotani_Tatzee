import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/AboutUsScreenWeb.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/EditProfileScreenWeb.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/FAQScreenWeb.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/PrivacyAndPolicyScreenWeb.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/ReportAndErrorScreenWeb.dart';

import '../../../../AppConstant/Static.dart';
import '../../../../AppConstant/Theme.dart';
import '../../../../AppUtils/AppUtils.dart';
import '../../../../AppUtils/InternetConnectivity.dart';
import '../../../../Controllers/GeneralProvider.dart';
import '../../../../Controllers/WebScreenHomeProvider.dart';
import '../../../../Helpers/FragmentHelpers/MoreFragmentHelper.dart';
import '../../../../main.dart';
import 'ChangePasswordScreenWeb.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  List<Widget> _screens = [
    ChangePasswordScreenWeb(),
    SizedBox(),
    PrivacyAndPolicyScreenWeb(),
    AboutUsScreenWeb(),
    ReportAndErrorScreenWeb(),
    FAQScreenWeb(),
    EditProfileScreenWeb(),
  ];

  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

  @override
  void initState() {
    super.initState();
  }

  setStateFunction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MoreFragmentHelper helper = MoreFragmentHelper(context, setStateFunction);
    return Scaffold(
      backgroundColor: theme.blackColor,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 389,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
                child: Scaffold(
                  backgroundColor: theme.whiteColor,
                  body: InternetConnectivityScreen(
                    widget: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, bottom: 5),
                            child: Text(
                              'Settings',
                              style: utils.generalHeadingBold(
                                theme.blackColor,
                                size: 20,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          helper.profileWidgetWeb(),
                          helper.settingWidgetsWeb(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Consumer<WebScreenHomeController>(
            builder: (_, pro, __) {
              return pro.settingScreenIndex != -1
                  ? _screens[pro.settingScreenIndex]
                  : Container();
            },
          )
        ],
      ),
    );
  }
}
