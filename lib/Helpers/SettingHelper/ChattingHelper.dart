// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Routes.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/AppConstant/Theme.dart';
// import 'package:skincanvas/AppUtils/AppUtils.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Controllers/chattingProvider.dart';

// import 'package:skincanvas/Models/MDUserModal.dart';
// import 'package:skincanvas/Models/Messages.dart';
// import 'package:skincanvas/main.dart';

// class ChattingHelper {
//   BuildContext context;

//   ChattingHelper(this.context);

//   var utils = AppUtils();
//   var theme = ThemeColors();
//   var static = Statics();
//   var route = Routes();

//   var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
//   var generalRead = navigatorkey.currentContext!.read<GeneralController>();
//   var chatRead = navigatorkey.currentContext!.read<ChattingController>();

//   textField() {
//     return Container(
//         child: Container(
//       // padding: EdgeInsets.only(left: 15.w, right: 15.w),
//       child: utils.inputField(
//         textColor: theme.blackColor,
//         postfixIcon: null,
//         postfixClick: () async {},
//         postfixIconColor: null,
//         placeholderColor: theme.midLightGreyColor,
//         borderColor: theme.midGreyColor,
//         placeholder: 'Write a Message',
//         isSecure: false,
//         textfieldColor: theme.midGreyColor,
//         controller: generalWatch.reportMessageController,
//         maxLines: 1,
//       ),
//     ));
//   }

//   Widget messagesList() {
//     return Expanded(
//       child: ListView.builder(
//         reverse: true,
//         physics: BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: chatRead.messages.length,
//         itemBuilder: (context, index) {
//           return chatRead.messages.isEmpty && chatRead.messages == null
//               ? Container()
//               : ChatContainer(
//                   message: chatRead.messages[index],
//                 );
//         },
//       ),
//     );
//   }

//   Widget bottomBar() {
//     return BottomAppBar(
//       height: 70,
//       shadowColor: theme.whiteColor,
//       color: Color(0xffFFFFFF),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         child: TextFormField(
//           controller: chatRead.messageController,
//           onChanged: (val) {
//             chatRead.message.textMessage = val;
//           },
//           textAlign: TextAlign.start,
//           decoration: InputDecoration(
//             hintText: 'Write your message',
//             suffixIcon: IconButton(
//               onPressed: () {
//                 print("Sending new message...");
//                 chatRead.sendNewMessage();
//               },
//               icon: Icon(
//                 Icons.send,
//                 color: theme.blueColor,
//                 size: 22,
//               ),
//             ),
//             fillColor: Color(0xffF3F6F6),
//             filled: true,
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatContainer extends StatelessWidget {
//   final Message? message;
//   final MDUserData? currentUser;
//   var theme = ThemeColors();
//   final bool? isShow;

//   var utils = AppUtils();

//   ChatContainer({this.message, this.currentUser, this.isShow});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15.0),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         child: Align(
//           alignment: (message?.fromUserId != currentUser?.userId
//               ? Alignment.topLeft
//               : Alignment.topRight),
//           child: Column(
//             crossAxisAlignment: message?.fromUserId != currentUser?.userId
//                 ? CrossAxisAlignment.start
//                 : CrossAxisAlignment.end,
//             children: [
//               Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: message?.fromUserId != currentUser?.userId
//                         ? BorderRadius.only(
//                             topRight: Radius.circular(13),
//                             bottomRight: Radius.circular(13),
//                             bottomLeft: Radius.circular(13),
//                           )
//                         : BorderRadius.only(
//                             topLeft: Radius.circular(13),
//                             bottomLeft: Radius.circular(13),
//                             bottomRight: Radius.circular(13),
//                           ),
//                     color: message?.fromUserId != currentUser?.userId
//                         ? Color(0xffF2F7FB)
//                         : Colors.red,
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                   child: Text(message?.textMessage?.toString() ?? "",
//                       style: message?.fromUserId != currentUser?.userId
//                           ? utils.labelStyleB(theme.whiteColor)
//                           : utils.labelStyleB(theme.blackColor)),
//                 ),
//               ]),
//               Text(
//                   "${utils.onlyTime.format(message?.sendat ?? DateTime.now())}",
//                   style: utils.xxlSmallLabelStyleB(theme.blackColor)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
