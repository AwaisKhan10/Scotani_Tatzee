import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Routes.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/AppUtils/Widgets/FaqExpandableListView.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';

class FAQHelper {
  BuildContext context;

  FAQHelper(this.context);

  var utils = AppUtils();
  var theme = ThemeColors();
  var static = Statics();
  var route = Routes();

  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();

  Widget faqText() {
    return utils.appBar(context, barText: 'FAQs', onPress: () {
      generalWatch.faqController.clear();
      Navigator.pop(context);
    });
  }

  Widget fieldForSearch() {
    return Container(
      padding:
          EdgeInsets.only(left: 15.w, right: 15.w) + EdgeInsets.only(top: 5.h),
      child: utils.inputField(
        textColor: theme.blackColor,
        placeholderColor: theme.blackColor,
        placeholder: 'Search using key words',
        isSecure: false,
        controller: generalWatch.faqController,
        maxLines: 1,
        postfixIcon: 'search',
        postfixClick: () async {
          await generalRead.getFaqApi(context,
              isLoading: true, searchKey: generalWatch.faqController.text);
        },
        postfixIconColor: theme.greyColor,
        postFixIconSize: static.width > 550 ? 12.w : 20.w,
        onChange: (text) async {
          if (text == '')
            await generalRead.getFaqApi(context,
                isLoading: true, searchKey: text);
        },
      ),
    );
  }

  Widget fieldForSearchWeb() {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 12,
        top: 12,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: CustomSearchTextFieldWeb(
          controller: generalWatch.faqController,
          hintText: 'Search using key words',
          onChanged: (v) async {
            if (v == '')
              await generalRead.getFaqApi(
                context,
                isLoading: true,
                searchKey: v,
              );
          },
          searchFunction: () async {
            await generalRead.getFaqApi(context,
                isLoading: true, searchKey: generalWatch.faqController.text);
          },
        ),
      ),
      // utils.inputField(
      //   textColor: theme.blackColor,
      //   placeholderColor: theme.blackColor,
      //   placeholder: 'Search using key words',
      //   isSecure: false,
      //   controller: generalWatch.faqController,
      //   maxLines: 1,
      //   postfixIcon: 'search',
      //   postfixClick: () async {
      //     await generalRead.getFaqApi(context,
      //         isLoading: true, searchKey: generalWatch.faqController.text);
      //   },
      //   postfixIconColor: theme.greyColor,
      //   postFixIconSize: static.width > 550 ? 12.w : 20.w,
      //   onChange: (text) async {
      //     if (text == '')
      //       await generalRead.getFaqApi(context,
      //           isLoading: true, searchKey: text);
      //   },
      // ),
    );
  }

  Widget faqStatements() {
    return Column(
      children: [
        for (int i = 0; i < generalWatch.faqList.length; i++) ...[
          generalWatch.faqController.text.isNotEmpty
              ? SizedBox()
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    '${generalWatch.faqList[i].name.toString()}',
                    style: utils.xlHeadingStyleB(theme.orangeColor,
                        fontFamily: 'finalBold'),
                  ),
                ),
          Container(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  for (int j = 0; j < generalWatch.faqList[i].faqs!.length; j++)
                    FAQExpandableListView(
                        title: "${generalWatch.faqList[i].faqs![j].title}",
                        description:
                            "${generalWatch.faqList[i].faqs![j].desc}"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ]
      ],
    );
  }

  Widget faqStatementsWeb() {
    return Consumer<GeneralController>(builder: (context, pro, __) {
      return Column(
        children: [
          for (int i = 0; i < pro.faqList.length; i++) ...[
            pro.faqController.text.isNotEmpty
                ? SizedBox()
                : Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      bottom: 8,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Scotani Features and Usage',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: theme.lightGreyColor,
                      ),
                    ),
                  ),
            Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    for (int j = 0; j < pro.faqList[i].faqs!.length; j++)
                      FAQExpandableListViewWeb(
                        title: "${pro.faqList[i].faqs![j].title}",
                        description: "${pro.faqList[i].faqs![j].desc}",
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]
        ],
      );
    });
  }
}
