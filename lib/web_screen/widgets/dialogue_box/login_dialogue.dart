import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../AppConstant/Static.dart';
import '../../../AppUtils/AppUtils.dart';
import '../../../Helpers/AuthenticationHelper/LoginHelper.dart';
import '../app_button.dart';

Future<void> showLogInDialogue(context, LoginHelper helper) {
  var utils = AppUtils();

  return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.80),
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.black,
            contentPadding: const EdgeInsets.all(18),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30.0,
                ),
              ),
            ),
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
                          Expanded(
                            child: Image.asset(
                              "assets/Icons/logo_web.png",
                              scale: 5.0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    100,
                                  ),
                                  bottomLeft: Radius.circular(
                                    100,
                                  ),
                                  topLeft: Radius.circular(
                                    85,
                                  ),
                                  bottomRight: Radius.circular(
                                    85,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  8.0,
                                ),
                                child: Image.asset(
                                  "assets/Icons/remove.png",
                                  scale: 4.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      // AppTextField(
                      //   text: 'Your Email',
                      //   keyBoardType: TextInputType.emailAddress,
                      // ),
                      // AppTextField(
                      //   text: 'Your Password',
                      //   keyBoardType: TextInputType.emailAddress,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //     left: kIsWeb ? 80 : 0.0,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           setState(() {
                      //             _value = !_value;
                      //           });
                      //         },
                      //         child: Container(
                      //           height: 24,
                      //           width: 24,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //               0,
                      //             ),
                      //             border: Border.all(
                      //               color: Colors.white,
                      //               width: 2,
                      //             ),
                      //           ),
                      //           child: _value
                      //               ? Icon(
                      //                   Icons.check,
                      //                   size: 18.0,
                      //                   color: Colors.white,
                      //                 )
                      //               : SizedBox(),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 8,
                      //       ),
                      //       Text(
                      //         "Remember Me",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 12,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        children: [
                          //helper.fieldForEmail(),
                          CustomTextFieldWeb(
                            controller: helper.authWatch.loginEmailController,
                            hintText: 'Email',
                            showSuffixIcon: false,
                            isBlackFieldColor: false,
                          ),
                          CustomTextFieldWeb(
                            controller:
                                helper.authWatch.loginPasswordController,
                            hintText: 'Password',
                            showSuffixIcon: false,
                            isBlackFieldColor: false,
                          ),
                          //helper.fieldForPassword(),
                          helper.RememberMeWeb(),
                          //helper.loginButtonWeb(),
                          AppButton(
                            onPressed: () async {
                              if (helper.authWatch.loginEmailController.text
                                  .isEmpty) {
                                utils.showToast(context,
                                    message: 'Please fill email field');
                              } else if (!regexEmail.hasMatch(
                                  helper.authWatch.loginEmailController.text)) {
                                utils.showToast(context,
                                    message: 'Please enter valid email');
                              } else if (helper.authWatch
                                  .loginPasswordController.text.isEmpty) {
                                utils.showToast(context,
                                    message: 'Please fill password field');
                              } else {
                                await helper.authRead.rememberMeUpdator(
                                    value: helper.authWatch.isRemember,
                                    email: helper
                                        .authWatch.loginEmailController.text,
                                    password: helper.authWatch
                                        .loginPasswordController.text);
                                await helper.authRead.signInApiWeb(context);
                              }
                            },
                            btnLabel: 'Login ',
                          ),

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => WebScreenHome(),
                          //   ),
                          // );
                        ],
                      ),
                      // SizedBox(
                      //   height: 18,
                      // ),
                      // AppButton(
                      //   onPressed: () {
                      //
                      //   },
                      //   btnLabel: 'Login ',
                      // ),
                      SizedBox(
                        height: 18,
                      ),
                      // Text(
                      //   "Forgot your password?",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 12,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {
                      //         //Navigator.pop(context);
                      //         //showSignUpDialogue(context);
                      //       },
                      //       child: RichText(
                      //         text: TextSpan(
                      //           text: "Don’t have an account? ",
                      //           style: const TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 12,
                      //           ),
                      //           children: [
                      //             TextSpan(
                      //               text: " Sign up.",
                      //               style: TextStyle(
                      //                 color: Color(
                      //                   0xffFD3131,
                      //                 ),
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 12,
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            ));
      });
}
