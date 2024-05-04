import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/web_screen/screens/web/SettingScreens/SettingsScreen.dart';
import 'package:skincanvas/web_screen/screens/web/customization_product/web_customization_screen.dart';
import 'package:skincanvas/web_screen/screens/web/create_product/web_screen.dart';
import 'package:skincanvas/web_screen/widgets/app_bar/custom_app_bar.dart';

import '../../../../Controllers/WebScreenHomeProvider.dart';
import '../../../../main.dart';

class WebScreenHome extends StatefulWidget {
  @override
  State<WebScreenHome> createState() => _WebScreenHomeState();
}

class _WebScreenHomeState extends State<WebScreenHome>
    with TickerProviderStateMixin {
  List<Widget> _screens = [
    WebScreen(),
    WebCustomoizationScreen(),
    // SelectCategoryScreen(),
    SettingsScreen(),
  ];

  var homeWatch = navigatorkey.currentContext!.watch<WebScreenHomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomWidgetAppBar()),

      ///
      /// Body
      ///
      body: Builder(
        builder: (context) {
          var homeWatch = Provider.of<WebScreenHomeController>(context);
          return _screens[homeWatch.screenIndex];
        },
      ),
    );
  }
}
