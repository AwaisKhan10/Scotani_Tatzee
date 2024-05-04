import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Helpers/AuthenticationHelper/LoginHelper.dart';
import '../../widgets/dialogue_box/login_dialogue.dart';

class MobileStartedScreen extends StatefulWidget {
  const MobileStartedScreen({super.key});

  @override
  State<MobileStartedScreen> createState() => _MobileStartedScreenState();
}

class _MobileStartedScreenState extends State<MobileStartedScreen> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // Image.asset(
                                //   "assets/images/logo.png",
                                //   height: 35,
                                //   width: 24,
                                // ),
                                // Image.asset(
                                //   "assets/images/App_Name.png",
                                //   height: 30,
                                // ),
                                Image.asset(
                                  "assets/Icons/logo_web.png",
                                  scale: 7,
                                ),
                                SizedBox(
                                  width: 25.w,
                                ),
                                Text(
                                  "Create Tattoos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 45,
                              width: MediaQuery.sizeOf(context).width / 1.4,
                              child: TextFormField(
                                controller: _searchController,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.black),
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
                              width: 8,
                            ),
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
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(42),
                                      color: Color(0xffFD3131),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "GET STARTED",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
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
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: 285,
                                height: MediaQuery.sizeOf(context).height / 2.2,
                                child: Image.asset(
                                  "assets/Images/img1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: 285,
                                height: MediaQuery.sizeOf(context).height / 2.2,
                                child: Image.asset(
                                  "assets/Images/img2.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/Icons/logo_web.png",
                            scale: 4,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Image.asset(
                          //       "assets/images/App_Name.png",
                          //       height: 35,
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Container(
                          //       height: 34,
                          //       width: 145,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(
                          //           color: Colors.white,
                          //         ),
                          //         borderRadius: BorderRadius.circular(42),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           "Apparel",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 10,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
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
                  SizedBox(
                    height: 12,
                  ),
                  Column(
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
                  SizedBox(
                    height: 18,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowWidget({required String title, required String text}) {
    return SizedBox(
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
