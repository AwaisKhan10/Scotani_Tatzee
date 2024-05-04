import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skincanvas/Helpers/AuthenticationHelper/LoginHelper.dart';
import 'package:skincanvas/web_screen/widgets/dialogue_box/login_dialogue.dart';

import '../app_button.dart';
import '../custom_textfield.dart';

Future<void> showSignUpDialogue(context, LoginHelper helper) {
  File? _pickedImage;
  Uint8List? webImage;
  return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.80),
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.black,
            contentPadding: const EdgeInsets.all(18),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            content: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Add Your Details To Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff9B9B9B)),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(100),
                                      topLeft: Radius.circular(85),
                                      bottomRight: Radius.circular(85))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/Icons/remove.png",
                                  scale: 4.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xffFD3131))),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: _pickedImage == null
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 105,
                                      width: 105,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.person,
                                        size: 18.sp,
                                      ))
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.memory(
                                        webImage!,
                                        height: 105,
                                        width: 105,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () async {
                                if (!kIsWeb) {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    var selected = File(image.path);
                                    setState(() {
                                      _pickedImage = selected;
                                    });
                                  } else {
                                    print("Working");
                                  }
                                } else if (kIsWeb) {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    var f = await image.readAsBytes();
                                    setState(() {
                                      webImage = f;
                                      _pickedImage = File("a");
                                    });
                                  }
                                }
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFD3131),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                      AppTextField(
                        text: 'Your FirstName',
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      AppTextField(
                        text: 'Your LastName',
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      AppTextField(
                        text: 'Your Email',
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      AppTextField(
                        text: 'Your Password',
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        btnLabel: 'Sign up ',
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLogInDialogue(context, helper);
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: "Already have an account? ",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                    children: [
                                  TextSpan(
                                    text: " Login.",
                                    style: TextStyle(
                                        color: Color(0xffFD3131),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )
                                ])),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
      });
}
