// ignore_for_file: invalid_use_of_protected_member, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_helper/mobile_helper/mobile_create_product_new_helper.dart';

class MobileCreateProductScreen extends StatefulWidget {
  const MobileCreateProductScreen({Key? key}) : super(key: key);

  @override
  State<MobileCreateProductScreen> createState() =>
      _MobileCreateProductScreenState();
}

class _MobileCreateProductScreenState extends State<MobileCreateProductScreen>
    with TickerProviderStateMixin {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

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
    MobileCreateProductNewHelper helper =
        MobileCreateProductNewHelper(context, setStateFunction);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ///
                    /// Header
                    ///
                    helper.headerAppBar(),

                    ///
                    /// deatial
                    ///
                    helper.rowContainer(),

                    ///
                    /// Side Bar Container
                    ///
                    helper.sideBarContainer(),

                    ///
                    /// tools
                    ///
                    helper.midContainer(),

                    helper.dragonContainer(),

                    helper.dragonImages(),

                    helper.containerButton(),

                    // helper.rightContainer(),

                    SizedBox(
                      height: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
