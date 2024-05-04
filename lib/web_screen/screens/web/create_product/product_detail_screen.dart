// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/web_helper/web_helper/create_product_detail_helper.dart';

class WebProductDetailScreen extends StatefulWidget {
  @override
  State<WebProductDetailScreen> createState() => _WebProductDetailScreenState();
}

class _WebProductDetailScreenState extends State<WebProductDetailScreen>
    with TickerProviderStateMixin {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var route = Routes();

  bool isScrolling = false;

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
    WebCreateProductDetailHelper helper =
        WebCreateProductDetailHelper(context, setStateFunction);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          // The user started scrolling
          setState(() {
            isScrolling = true;
          });
        } else if (scrollNotification is ScrollEndNotification) {
          // The user stopped scrolling
          setState(() {
            isScrolling = false;
          });
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: helper.appBar(),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),

                    ///
                    /// Header
                    ///

                    helper.headerAppBar(),

                    ///
                    /// deatial
                    ///

                    Expanded(
                      child: Row(
                        children: [
                          ///
                          /// 1st Container
                          ///

                          helper.addImages(),

                          ///
                          /// mid container
                          ///
                          helper.midImage(),

                          ///
                          /// last deatail and color changes , design and add to cart process
                          ///
                          helper.containerDetail(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
