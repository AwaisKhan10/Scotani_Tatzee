// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/InternetConnectivity.dart';
import 'package:skincanvas/Helpers/ProductRelatedHelper/ProductDetailHelper.dart';

class ProductDetailScreen extends StatelessWidget {
  var themeColor = ThemeColors();
  var utils = AppUtils();
  var static = Statics();

  @override
  Widget build(BuildContext context) {
    ProductDetailHelper helper = ProductDetailHelper(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: themeColor.backGroundColor,
        body: InternetConnectivityScreen(
          widget: Container(
            width: static.width,
            height: static.height,
            child: Column(
              children: [
                helper.productDetailText(),
                helper.myCartList(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        helper.priceOfProduct(),
                        helper.description(),
                      ],
                    ),
                  ),
                ),
                helper.buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
