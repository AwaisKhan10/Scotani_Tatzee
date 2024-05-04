import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Helpers/SettingHelper/EditProfileHelper.dart';
import 'package:skincanvas/main.dart';

import '../../../../Controllers/WebScreenHomeProvider.dart';

class EditProfileScreenWeb extends StatefulWidget {
  @override
  State<EditProfileScreenWeb> createState() => _EditProfileScreenWebState();
}

class _EditProfileScreenWebState extends State<EditProfileScreenWeb> {
  var themeColor = ThemeColors();

  var utils = AppUtils();

  var static = Statics();

  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

  var webHomeRead =
      navigatorkey.currentContext!.read<WebScreenHomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      generalWatch.editProfileImageUpdate(value: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    EditProfileHelper helper = EditProfileHelper(context);

    return WillPopScope(
      onWillPop: () async {
        webHomeRead.settingScreenIndexUpdate(index: -1);
        return generalWatch.restrictUserNavigation == false ? true : false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          width: 461,
          height: 633,
          child: Scaffold(
            backgroundColor: themeColor.whiteColor,
            body: InternetConnectivityScreen(
              widget: Column(
                children: [
                  utils.statusBar(context, color: themeColor.backGroundColor),
                  helper.editProfileTextWeb(() {
                    webHomeRead.settingScreenIndexUpdate(index: -1);
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          helper.cameraWidgetWeb(),
                          SizedBox(
                            height: 30,
                          ),
                          CustomTextFieldWeb(
                            width: 361,
                            controller: generalWatch.editNameController,
                            hintText: 'Name',
                            showSuffixIcon: false,
                          ),
                          CustomTextFieldWeb(
                            width: 361,
                            controller: generalWatch.editEmailController,
                            hintText: 'Email',
                            showSuffixIcon: false,
                          ),
                          CustomTextFieldWeb(
                            width: 361,
                            controller: generalWatch.editMobileController,
                            hintText: 'Phone Number',
                            showSuffixIcon: false,
                          ),
                          CustomTextFieldWeb(
                            width: 361,
                            controller: generalWatch.editMobileController,
                            hintText: 'Mobile Number',
                            showSuffixIcon: false,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          //helper.fieldForFullName(),
                          //helper.fieldForEmail(),
                          // helper.fieldForMobile(),
                          //helper.fieldForAddress(),
                          helper.updateButtonWeb(),
                        ],
                      ),
                    ),
                  ),
                  utils.bottomBar(context, color: themeColor.backGroundColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
