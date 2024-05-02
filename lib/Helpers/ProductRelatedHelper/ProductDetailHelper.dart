import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Models/MDCartModal.dart';
import 'package:skincanvas/main.dart';

class ProductDetailHelper {
  BuildContext context;

  ProductDetailHelper(this.context);

  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();
  var route = Routes();

  var orderWatch =
      navigatorkey.currentContext!.watch<OrderCheckOutWishlistController>();
  var orderRead =
      navigatorkey.currentContext!.read<OrderCheckOutWishlistController>();
  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();

  Widget productDetailText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      padding: EdgeInsets.all(10),
      width: static.width,
      color: theme.redColor,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: theme.whiteColor,
              ),
              // Icon to display
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: static.width > 550 ? 16.sp : 24.sp,
              // Callback function when pressed
              tooltip: 'Like', // Optional tooltip text
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Product Detail',
                style: utils.generalHeadingBold(theme.whiteColor,
                    size: static.width > 550 ? 20.sp : 26.sp,
                    fontFamily: 'finalBold'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myCartList() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
          height: static.height * .35,
          width: static.width,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: theme.backGroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: static.width,
              decoration: BoxDecoration(
                color: theme.backGroundColor,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    '${homeWatch.mdProductDetailModal.data!.productImage!}',
                // progressIndicatorBuilder: (context, url, downloadProgress) =>
                //     utils.loadingShimmer(
                //   height: static.width * .5.w,
                //   width: static.width * .5.w,
                // ),
                // errorWidget: (context, url, error) => utils.loadingShimmer(
                //   height: static.width * .5.w,
                //   width: static.width * .5.w,
                // ),
                fit: BoxFit.contain,
              ),
            ),
          ), ///////Working
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  Widget description() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 20.w) + EdgeInsets.only(top: 30.h),
      width: static.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${homeWatch.mdProductDetailModal.data!.productName!}',
            style: utils.extralsmallHeadingStyleB(theme.whiteColor,
                fontFamily: 'finalBold'),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            utils.convertHtmlToPlainText(
                homeWatch.mdProductDetailModal.data!.productDescription!),
            style: utils.generalHeading(theme.whiteColor.withOpacity(.8),
                fontFamily: 'finalBook',
                size: static.width > 550 ? 8.sp : 13.sp),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }

  Widget priceOfProduct() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: theme.lightBlackColor,
      height: static.height * .08,
      child: Row(
        children: [
          Text(
            'Price',
            style: utils.extralHeadingStyleB(
              theme.whiteColor,
              fontFamily: 'finalBold',
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            '${priceKey}${homeWatch.mdProductDetailModal.data!.productPrice!}',
            style: utils.extralHeadingStyleB(theme.orangeColor,
                fontFamily: 'finalBold'),
          ),
        ],
      ),
    );
  }

  Widget buttons() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: static.width * .55,
            padding: EdgeInsets.symmetric(vertical: 12.h) +
                EdgeInsets.only(left: 20.w, right: 10.w),
            child: utils.button(
              textSize: static.width > 550
                  ? 10.sp
                  : homeWatch.mdProductDetailModal.data!.isFeatured!
                      ? 15.sp
                      : 18.sp,
              text: homeWatch.mdProductDetailModal.data!.isFeatured!
                  ? " Remove From Wishlist"
                  : 'Add to Wishlist',
              buttonColor: theme.transparentColor,
              borderColor: theme.orangeColor,
              fontFamily: 'finalBold',
              ontap: () async {
                orderRead.makeAndRemoveWishListApi(context,
                    productID: homeWatch.mdProductDetailModal.data!.productID,
                    status: !homeWatch.mdProductDetailModal.data!.isFeatured!);
              },
              textColor: theme.orangeColor,
              width: static.width,
            ),
          ),
          Hero(
            tag: 'checkout',
            child: Container(
              width: static.width * .45,
              padding: EdgeInsets.symmetric(vertical: 12.h) +
                  EdgeInsets.only(right: 10.w),
              child: utils.button(
                textSize: static.width > 550
                    ? 10.sp
                    : homeWatch.mdProductDetailModal.data!.isProductIntoCart!
                        ? 15.sp
                        : 18.sp,
                text: homeWatch.mdProductDetailModal.data!.isProductIntoCart!
                    ? 'Added into Cart'
                    : 'Add to Cart',
                buttonColor: theme.orangeColor,
                borderColor: theme.orangeColor,
                fontFamily: 'finalBold',
                ontap: () async {
                  if (homeWatch.mdProductDetailModal.data!.isProductIntoCart!) {
                    utils.showToast(context,
                        message: "Product Already into Cart");
                  } else {
                    orderRead.addToCartApi(
                      context,
                      type: 0,
                      systemProduct: SystemProductsSender(
                          productId:
                              homeWatch.mdProductDetailModal.data!.productID,
                          quantity: 1,
                          price: homeWatch
                              .mdProductDetailModal.data!.productPrice!
                              .toDouble(),
                          subTotal: homeWatch
                              .mdProductDetailModal.data!.productPrice!
                              .toDouble()),
                    );
                  }

                  // Navigator.pushNamed(context, route.checkOutScreenRoute);

                  //  await authRead.signInApi(context);
                },
                textColor: theme.whiteColor,
                width: static.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
