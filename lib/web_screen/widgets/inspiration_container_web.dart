import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/Models/MDHomeCategoryModal.dart';
import 'package:skincanvas/main.dart';

class InspirationalContainerWeb extends StatefulWidget {
  Categories? categories;
  int index;
  Function()? onTap;
  bool isFromConfigureable;

  InspirationalContainerWeb(
      {this.categories,
      required this.index,
      this.onTap,
      this.isFromConfigureable = false});

  @override
  State<InspirationalContainerWeb> createState() =>
      _InspirationalContainerWebState();
}

class _InspirationalContainerWebState extends State<InspirationalContainerWeb> {
  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();

  var homeWatch = navigatorkey.currentContext!.watch<HomeController>();
  var homeRead = navigatorkey.currentContext!.read<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("The image is:" + widget.categories!.image.toString());
    print("The name is:" + widget.categories!.name.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: MediaQuery.of(context).size.width * .044,
              height: MediaQuery.of(context).size.width * .044,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: theme.whiteColor,
              ),
              child: widget.categories!.image!.toString().contains('assets')
                  ? Image.asset(
                      widget.categories!.image!.toString(),
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.categories!.image.toString(),
                      // progressIndicatorBuilder: (context, url, downloadProgress) =>
                      //     utils.loadingShimmer(
                      //   height: static.width > 550
                      //       ? static.width * .15
                      //       : static.width * .2.w,
                      //   width: static.width > 550
                      //       ? static.width * .15
                      //       : static.width * .2.w,
                      // ),
                      // errorWidget: (context, url, error) => utils.loadingShimmer(
                      //   height: static.width > 550
                      //       ? static.width * .15
                      //       : static.width * .2.w,
                      //   width: static.width > 550
                      //       ? static.width * .15
                      //       : static.width * .2.w,
                      // ),
                      fit: BoxFit.cover,
                    ),
            ),
            Text(
              '${widget.categories!.name}',
              style: GoogleFonts.poppins(
                color: (widget.isFromConfigureable
                        ? homeWatch.selectedConfigurableCategoryIndex ==
                            widget.index
                        : homeWatch.selectedCategoryIndex == widget.index)
                    ? theme.orangeColor
                    : theme.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
