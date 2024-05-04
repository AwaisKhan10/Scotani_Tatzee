// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';

// class MenWebScreenHelper {
//   var theme = ThemeColors();
//   var utils = AppUtils();
//   var static = Statics();
//   BuildContext context;

//   MenWebScreenHelper(this.context);

//   List<String> imgList = [
//     'm1.png',
//     'm2.png',
//     'm3.png',
//     'm4.png',
//     'm5.png',
//     'm6.png',
//     'm7.png',
//     'm8.png',
//     'm9.png',
//     'm10.png',
//     'm11.png',
//     'm12.png',
//     'm13.png',
//     'm14.png',
//     'm15.png',
//     'm16.png',
//     'm17.png',
//   ];

//   listData() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0, top: 5),
//       child: Container(
//         height: 60.h,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           itemCount: imgList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               width: 20.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   image: DecorationImage(
//                       image: AssetImage("assets/Images/${imgList[index]}"),
//                       fit: BoxFit.cover)),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return SizedBox(
//               width: 5.w,
//             );
//           },
//         ),
//       ),
//     );
//   }

//   List<String> images = [
//     'p3',
//     'p4',
//     'p14',
//     'p6',
//     'p7',
//     'p9',
//     'p5',
//     'p8',
//     'p13',
//     'p10',
//     'p12',
//     'p11',

//     // 'p1',
//     // 'p2',
//   ];
//   mansoryGridView() {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Expanded(
//         child: MasonryGridView.builder(
//           gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 5,
//           ),
//           shrinkWrap: true,
//           itemCount: images.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Container(
//                   //   decoration: BoxDecoration(
//                   //       color: Colors.black,
//                   //       borderRadius: BorderRadius.circular(16.r),
//                   //       image: DecorationImage(
//                   //         image: AssetImage(
//                   //             ),
//                   //         fit: BoxFit.contain,
//                   //       )),
//                   // ),

//                   Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                       child: Image.asset(
//                         'assets/Images/${images[index]}.png',
//                         fit: BoxFit.cover,
//                       )),

//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ////
//                         /// Product name
//                         ///
//                         Text('Striped ultra thin tracsuits',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: utils.textStyle6(
//                                 color: theme.whiteColor,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 4.sp)),
//                         SizedBox(height: 3.h),
//                         Text('MOQ : 40 Units',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: utils.textStyle6(
//                                 color: theme.whiteColor,
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 4.sp)),
//                         SizedBox(height: 3.h),

//                         ///
//                         /// Price
//                         ///
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               '140 USD',
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: 4.sp,
//                                   color: theme.redColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'finalBold'),
//                             ),

//                             ///
//                             /// Heart and Cart
//                             ///
//                             // Row(
//                             //   children: [
//                             //     GestureDetector(
//                             //       onTap: () {},
//                             //       child: Container(
//                             //         alignment: Alignment.center,
//                             //         padding: EdgeInsets.all(5.0),
//                             //         decoration: BoxDecoration(
//                             //             color: theme.blueColor,
//                             //             borderRadius:
//                             //                 BorderRadius.circular(8.0.r)),
//                             //         child: Icon(
//                             //           CupertinoIcons.heart_fill,
//                             //           size: 5.sp,
//                             //           color: theme.whiteColor,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //     SizedBox(
//                             //       width: 2.w,
//                             //     ),

//                             //     ///
//                             //     /// Cart
//                             //     ///
//                             //     GestureDetector(
//                             //       onTap: () {},
//                             //       child: Container(
//                             //         alignment: Alignment.center,
//                             //         padding: EdgeInsets.all(5.0),
//                             //         decoration: BoxDecoration(
//                             //             color: theme.redColor,
//                             //             borderRadius:
//                             //                 BorderRadius.circular(8.0.r)),
//                             //         child: Icon(
//                             //           Icons.shopping_cart,
//                             //           size: 5.sp,
//                             //           color: theme.whiteColor,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/AuthenticationProvider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Controllers/OrdersAndCheckOutAndWishlistProvider.dart';
import 'package:skincanvas/Models/MDProductModal.dart';
import 'package:skincanvas/main.dart';

class MenWebScreenHelper {
  BuildContext context;
  late TabController tabController;
  late ScrollController scrollController;

  MenWebScreenHelper(this.context);

  var authWatch =
      navigatorkey.currentContext!.watch<AuthenticationController>();
  var authRead = navigatorkey.currentContext!.read<AuthenticationController>();

  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();

  var orderRead = Provider.of<OrderCheckOutWishlistController>(
      navigatorkey.currentContext!,
      listen: false);

  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  bool isFromConfigureable = false;

  Widget mansoryGridView() {
    return Consumer<HomeController>(builder: (context, homeWatch, _) {
      int lengthOfList = homeWatch.productList.length;

      print("productList.length ${homeWatch.productList.length}");

      // if (homeWatch.tabIndex == 2) {
      //   return Container();
      // }

      return homeWatch.productLoading && homeWatch.productList.isEmpty ||
              homeWatch.loadingApi
          ? Container(alignment: Alignment.center, child: utils.noDataFound())
          : Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                shrinkWrap: true,
                itemCount: lengthOfList,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        buildImageCard(
                          index: index,
                          productDetailList: homeWatch.productList,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
    });
  }

  Widget buildImageCard({
    required int index,
    required List<Products>? productDetailList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            AppUtils.selectedImage = productDetailList[index].image!;
            homeRead.createProduct(context,
                imageUrl: productDetailList[index].image,
                productID: productDetailList[index].sId);
            homeWatch.categoryStatusUpdate(index: index);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                  color: productDetailList![index].sId != null
                      ? theme.orangeColor
                      : Colors.transparent,
                  width: 2

                  // theme.whiteColor,
                  ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: '${productDetailList[index].image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${productDetailList[index].title.toString()}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: utils.textStyle6(
                  color: theme.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 4.sp,
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${priceKey}${productDetailList[index].price!}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 4.sp,
                      color: theme.redColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'finalBold',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // listData() {
  //   return Consumer<HomeController>(builder: (context, homeWatch, _) {
  //     print(
  //         "configureDataList List Length: ${homeWatch.configureDataList.length}");
  //     return Padding(
  //       padding: const EdgeInsets.only(left: 20.0, top: 5),
  //       child: Container(
  //         height: 60.h,
  //         child: ListView.separated(
  //           scrollDirection: Axis.horizontal,
  //           shrinkWrap: true,
  //           itemCount: homeWatch.configureDataList.length,
  //           itemBuilder: (context, i) {
  //             return utils.categorySelectionContainer(
  //                 text: '${homeWatch.configureDataList[i].name}',
  //                 image: '${homeWatch.configureDataList[i].image}',
  //                 imageColor: theme.transparentColor,
  //                 isSelect:
  //                     homeWatch.selectConfigurableCategoriesStatus.isNotEmpty
  //                         ? homeWatch.selectConfigurableCategoriesStatus[i]
  //                         : false,
  //                 width: static.width > 550
  //                     ? static.width * .22
  //                     : static.width * .26,
  //                 height: static.width > 550
  //                     ? static.width * .22
  //                     : static.width * .26,
  //                 imageSize: static.width * .15,
  //                 textSize: static.width > 550 ? 8.sp : 12.sp,
  //                 isFromCreateProduct: true,
  //                 onTap: () async {
  //                   homeRead.selectConfigurableCategoriesStatusUpdate(index: i);
  //                   homeRead.productListingApi(context,
  //                       categoryID: homeWatch
  //                           .configureDataList[i].subCategories![0].sId,
  //                       title: '',
  //                       type: "3",
  //                       isLoading: false,
  //                       isLoadingFromConfigurable: true);
  //                   await homeRead.selectedCategoryForConfigurableUpdator(
  //                       ID: homeWatch
  //                           .configureDataList[i].subCategories![0].sId,
  //                       type: '3');
  //                 });
  //             //     //  InspirationalContainer(
  //             //     //     categories: homeWatch.categoryList[i],
  //             //     //     index: i,
  //             //     //     onTap: () {
  //             //     //       print("homeWatch.tabIndex ${homeWatch.tabIndex}");
  //             //     //       homeRead.selectedCategoryUpdator(
  //             //     //           index: i,
  //             //     //           ID: homeWatch.categoryList[i].sId.toString(),
  //             //     //           type: homeWatch.tabIndex == 0
  //             //     //               ? "0"
  //             //     //               : homeWatch.tabIndex == 1
  //             //     //                   ? "1"
  //             //     //                   : homeWatch.tabIndex == 2
  //             //     //                       ? "2"
  //             //     //                       : "4");

  //             //     //       homeRead.productListingApi(context,
  //             //     //           categoryID: homeWatch.categoryList[i].sId,
  //             //     //           title: '',
  //             //     //           isLoading: false,
  //             //     //           type: homeWatch.tabIndex == 0
  //             //     //               ? "0"
  //             //     //               : homeWatch.tabIndex == 1
  //             //     //                   ? "1"
  //             //     //                   : homeWatch.tabIndex == 2
  //             //     //                       ? "2"
  //             //     //                       : "4");
  //             //     //     });
  //             //     GestureDetector(
  //             //   onTap: () {
  //             //     print("homeWatch.tabIndex ${homeWatch.tabIndex}");
  //             //     homeRead.selectedCategoryUpdator(
  //             //         index: index,
  //             //         ID: homeWatch.categoryList[index].sId.toString(),
  //             //         type: homeWatch.tabIndex == 0
  //             //             ? index
  //             //             : homeWatch.tabIndex == 1
  //             //                 ? "1"
  //             //                 : homeWatch.tabIndex == 2
  //             //                     ? "2"
  //             //                     : "4");

  //             //     homeRead.productListingApi(context,
  //             //         categoryID: homeWatch.categoryList[index].sId,
  //             //         title: '',
  //             //         isLoading: false,
  //             //         type: homeWatch.tabIndex == 0
  //             //             ? "0"
  //             //             : homeWatch.tabIndex == 1
  //             //                 ? "1"
  //             //                 : homeWatch.tabIndex == 2
  //             //                     ? "2"
  //             //                     : "4");
  //             //   },
  //             //   child: Container(
  //             //     width: 20.w,
  //             //     decoration: BoxDecoration(
  //             //       borderRadius: BorderRadius.circular(8.r),
  //             //     ),
  //             //     child: Column(
  //             //       mainAxisAlignment: MainAxisAlignment.center,
  //             //       crossAxisAlignment: CrossAxisAlignment.center,
  //             //       children: [
  //             //         CachedNetworkImage(
  //             //           imageUrl:
  //             //               homeWatch.categoryList[index].image.toString(),
  //             //           fit: BoxFit.cover,
  //             //         ),
  //             //         Text(
  //             //           '${homeRead.categoryList[index].name}',
  //             //           textAlign: TextAlign.center,
  //             //           style: utils.smallLabelStyle(
  //             //             (isFromConfigureable
  //             //                     ? homeWatch
  //             //                             .selectedConfigurableCategoryIndex ==
  //             //                         index
  //             //                     : homeWatch.selectedCategoryIndex == index)
  //             //                 ? theme.orangeColor
  //             //                 : theme.whiteColor,
  //             //           ),
  //             //         )
  //             //       ],
  //             //     ),
  //             //   ),
  //             // );
  //           },
  //           separatorBuilder: (BuildContext context, int index) {
  //             return SizedBox(
  //               width: 5.w,
  //             );
  //           },
  //         ),
  //       ),
  //     );
  //   });
  // }

  // List<String> images = [
  //   'p3',
  //   'p4',
  //   'p14',
  //   'p6',
  //   'p7',
  //   'p9',
  //   'p5',
  //   'p8',
  //   'p13',
  //   'p10',
  //   'p12',
  //   'p11',

  //   // 'p1',
  //   // 'p2',
  // ];

  // Widget buildImageCard(
  //     {required int index, required List<Products>? productDetailList}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // Container(
  //         //   decoration: BoxDecoration(
  //         //       color: Colors.black,
  //         //       borderRadius: BorderRadius.circular(16.r),
  //         //       image: DecorationImage(
  //         //         image: AssetImage(
  //         //             ),
  //         //         fit: BoxFit.contain,
  //         //       )),
  //         // ),

  //         GestureDetector(
  //           onTap: () {
  //             homeRead.productDetailApi(context,
  //                 productID: productDetailList![index].sId);
  //           },
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20.r),
  //             ),
  //             child: ClipRRect(
  //               // Wrap the image with ClipRRect
  //               borderRadius: BorderRadius.circular(16.r),
  //               child: CachedNetworkImage(
  //                 imageUrl: '${productDetailList![index].image}',
  //                 // progressIndicatorBuilder:
  //                 //     (context, url, downloadProgress) =>
  //                 //         utils.loadingShimmer(
  //                 //   width: static.width * .25,
  //                 //   height: static.width * .25,
  //                 // ),
  //                 // errorWidget: (context, url, error) =>
  //                 //     utils.loadingShimmer(
  //                 //   width: static.width * .25,
  //                 //   height: static.width * .25,
  //                 // ),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),

  //         SizedBox(
  //           height: 5.h,
  //         ),
  //         Align(
  //           alignment: Alignment.bottomLeft,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               ////
  //               /// Product name
  //               ///
  //               Text('${productDetailList[index].title.toString()}',
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: utils.textStyle6(
  //                       color: theme.whiteColor,
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 4.sp)),
  //               SizedBox(height: 3.h),

  //               // Text('${priceKey}${productDetailList[index].price!}',
  //               //     maxLines: 2,
  //               //     overflow: TextOverflow.ellipsis,
  //               //     style: utils.textStyle6(
  //               //         color: theme.whiteColor,
  //               //         fontWeight: FontWeight.w300,
  //               //         fontSize: 4.sp)),
  //               // SizedBox(height: 3.h),

  //               ///
  //               /// Price
  //               ///
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     '${priceKey}${productDetailList[index].price!}',
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(
  //                         fontSize: 4.sp,
  //                         color: theme.redColor,
  //                         fontWeight: FontWeight.bold,
  //                         fontFamily: 'finalBold'),
  //                   ),

  //                   // Row(
  //                   //     children: [
  //                   //       GestureDetector(
  //                   //         onTap: () {
  //                   //           // print( homeWatch.productList[index].sId.toString());
  //                   //           orderRead.makeAndRemoveWishListApi(context,
  //                   //               productID: homeWatch.productList[index].sId
  //                   //                   .toString(),
  //                   //               status: !homeWatch
  //                   //                   .productList[index].isFeatured!);
  //                   //         },
  //                   //         child: Container(
  //                   //           alignment: Alignment.center,
  //                   //           padding: EdgeInsets.all(5.0),
  //                   //           decoration: BoxDecoration(
  //                   //               color:
  //                   //                   homeWatch.productList[index].isFeatured!
  //                   //                       ? theme.blueColor.withOpacity(0.5)
  //                   //                       : theme.blueColor,
  //                   //               borderRadius: BorderRadius.circular(8.0.r)),
  //                   //           child: Icon(
  //                   //             size: static.width > 550 ? 18.sp : 20.sp,
  //                   //             // homeWatch.productList[index].isFeatured!
  //                   //             //     ? CupertinoIcons.heart_fill
  //                   //             // :
  //                   //             CupertinoIcons.heart_fill,
  //                   //             color: homeWatch.productList[index].isFeatured!
  //                   //                 ? theme.whiteColor.withOpacity(0.5)
  //                   //                 : theme.whiteColor,
  //                   //           ),
  //                   //         ),
  //                   //       ),
  //                   //       SizedBox(
  //                   //         width: 5.w,
  //                   //       ),

  //                   //       ///
  //                   //       /// Cart
  //                   //       ///
  //                   //       GestureDetector(
  //                   //         onTap: () {
  //                   //           // orderRead.cartProductListSelectionInitialize();
  //                   //           // Navigator.pushNamed(context, route.myCartScreenRoute);

  //                   //           if (productDetailList[index].isProductIntoCart!) {
  //                   //             utils.showToast(context,
  //                   //                 message: "Product already into cart");
  //                   //           } else {
  //                   //             orderRead.addToCartApi(
  //                   //               context,
  //                   //               type: 0,
  //                   //               systemProduct: SystemProductsSender(
  //                   //                   productId: productDetailList[index].sId,
  //                   //                   quantity: 1,
  //                   //                   price: productDetailList[index].price!,
  //                   //                   subTotal:
  //                   //                       1 * productDetailList[index].price!),
  //                   //             );
  //                   //           }
  //                   //         },
  //                   //         child: Container(
  //                   //             alignment: Alignment.center,
  //                   //             padding: EdgeInsets.all(5.0),
  //                   //             decoration: BoxDecoration(
  //                   //                 color: productDetailList[index]
  //                   //                         .isProductIntoCart!
  //                   //                     ? theme.redColor.withOpacity(.5)
  //                   //                     : theme.redColor,
  //                   //                 borderRadius: BorderRadius.circular(8.0.r)),
  //                   //             child: Icon(
  //                   //               Icons.shopping_cart,
  //                   //               size: 20.sp,
  //                   //               color: productDetailList[index]
  //                   //                       .isProductIntoCart!
  //                   //                   ? theme.whiteColor.withOpacity(0.7)
  //                   //                   : theme.whiteColor,
  //                   //             )
  //                   //             // ? Image.asset(
  //                   //             //     'assets/Icons/cartFilled.png',
  //                   //             //     height: static.width > 550 ? 20.w : 26.w,
  //                   //             //     width: static.width > 550 ? 20.w : 26.w,
  //                   //             //   )
  //                   //             // : Image.asset(
  //                   //             //     'assets/Icons/cart.png',
  //                   //             //     height: static.width > 550 ? 26.w : 35.w,
  //                   //             //     width: static.width > 550 ? 26.w : 35.w,
  //                   //             //   ),
  //                   //             ),
  //                   //       ),
  //                   //     ],
  //                   //   ),

  //                   ///
  //                   /// Heart and Cart
  //                   ///
  //                   // Row(
  //                   //   children: [
  //                   //     GestureDetector(
  //                   //       onTap: () {},
  //                   //       child: Container(
  //                   //         alignment: Alignment.center,
  //                   //         padding: EdgeInsets.all(5.0),
  //                   //         decoration: BoxDecoration(
  //                   //             color: theme.blueColor,
  //                   //             borderRadius:
  //                   //                 BorderRadius.circular(8.0.r)),
  //                   //         child: Icon(
  //                   //           CupertinoIcons.heart_fill,
  //                   //           size: 5.sp,
  //                   //           color: theme.whiteColor,
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //     SizedBox(
  //                   //       width: 2.w,
  //                   //     ),

  //                   //     ///
  //                   //     /// Cart
  //                   //     ///
  //                   //     GestureDetector(
  //                   //       onTap: () {},
  //                   //       child: Container(
  //                   //         alignment: Alignment.center,
  //                   //         padding: EdgeInsets.all(5.0),
  //                   //         decoration: BoxDecoration(
  //                   //             color: theme.redColor,
  //                   //             borderRadius:
  //                   //                 BorderRadius.circular(8.0.r)),
  //                   //         child: Icon(
  //                   //           Icons.shopping_cart,
  //                   //           size: 5.sp,
  //                   //           color: theme.whiteColor,
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //   ],
  //                   // ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
