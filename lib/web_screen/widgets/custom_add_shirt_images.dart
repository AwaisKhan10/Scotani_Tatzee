import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skincanvas/AppConstant/Theme.dart';

class CustomAddShirtImages extends StatelessWidget {
  ThemeColors theme = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 172,
            width: 166,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(25)),
            child: Image.asset("assets/Images/shirt.png"),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28.h,
                      width: 16.w,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 25,
                      //     vertical: 3),
                      decoration: BoxDecoration(
                          color: theme.redColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      child: Image.asset(
                        "assets/Icons/edit.png",
                        scale: 6.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                          color: theme.blackColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Image.asset(
                        "assets/Icons/trash.png",
                        scale: 4,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
