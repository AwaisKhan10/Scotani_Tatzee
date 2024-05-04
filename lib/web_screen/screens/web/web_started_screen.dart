// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/web_screen/widgets/dialogue_box/sign_up.dart';

import '../../../Helpers/AuthenticationHelper/LoginHelper.dart';
import '../../widgets/dialogue_box/login_dialogue.dart';

class WebStartedScreen extends StatefulWidget {
  const WebStartedScreen({super.key});

  @override
  State<WebStartedScreen> createState() => _WebStartedScreenState();
}

class _WebStartedScreenState extends State<WebStartedScreen> {
  ThemeColors themeColors = ThemeColors();
  TextEditingController _searchController = TextEditingController();

  List<String> _imageList = [
    "assets/images/img3.png",
    "assets/images/img4.png",
    "assets/images/img5.png",
    "assets/images/img6.png",
    "assets/images/img7.png",
    "assets/images/img8.png",
  ];
  @override
  Widget build(BuildContext context) {
    LoginHelper helper = LoginHelper(context);
    return Scaffold(
      backgroundColor: themeColors.blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/Icons/logo_web.png",
                      scale: 5.0,
                    ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       "assets/icons/logo_tazee.png",
                    //       height: 35,
                    //       width: 24,
                    //     ),
                    //     Image.asset(
                    //       "assets/images/App_Name.png",
                    //       height: 30,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Create Tattoos",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),

                    ///
                    /// Search Field
                    ///
                    SizedBox(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width / 2.0,
                      child: TextFormField(
                        controller: _searchController,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                          hintText: "Browse our wide range of apparel",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          prefixIcon: GestureDetector(
                            child: Image.asset(
                              "assets/Icons/search.png",
                              scale: 4,
                            ),
                            onTap: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                          ),
                          suffixIcon: GestureDetector(
                            child: Image.asset(
                              "assets/Icons/close.png",
                              scale: 4,
                            ),
                            onTap: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),

                    ///
                    /// Buttons login and sign Up
                    ///
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            showLogInDialogue(context, helper);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 7.sp,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            showSignUpDialogue(context, helper);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42),
                              color: Color(0xffFD3131),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                "GET STARTED",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 6.sp,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: SizedBox(
                                    width: 285,
                                    height:
                                        MediaQuery.sizeOf(context).height / 2.2,
                                    child: Image.asset(
                                      "assets/images/img1.png",
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: SizedBox(
                                    width: 285,
                                    height:
                                        MediaQuery.sizeOf(context).height / 2.2,
                                    child: Image.asset(
                                      "assets/images/img2.png",
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Image.asset(
                          "assets/Icons/logo_web.png",
                          scale: 2,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Join us on our journey as we explore the intersection of Tattoo and technology, creation not just tattoos, but personalized stories on body.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 23,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _rowWidget(title: "900k", text: "Designs"),
                            _rowWidget(title: "3k", text: "Apparel"),
                            _rowWidget(title: "4 MILLION", text: "Users"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3 / 3.5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, i) {
                              return Image.asset(
                                _imageList[i],
                                fit: BoxFit.fill,
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowWidget({required String title, required String text}) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xffFD3131)),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xffFfffff)),
          ),
        ],
      ),
    );
  }
}
