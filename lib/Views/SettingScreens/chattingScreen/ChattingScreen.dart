// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:skincanvas/AppConstant/Static.dart';
import 'package:skincanvas/AppConstant/Theme.dart';
import 'package:skincanvas/AppUtils/AppUtils.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Models/MDUserModal.dart';
import 'package:skincanvas/Models/Messages.dart';
import 'package:skincanvas/Views/SettingScreens/chattingScreen/chat_view_model.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/others/view_state/view_state.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(),
      child: Consumer<ChatViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.black,

          ///
          /// App Bar
          ///
          appBar: appBar(context),

          ///
          /// Start Body
          ///
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListView.builder(
                reverse: false,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.messages.length,
                itemBuilder: (context, index) {
                  return model.messages.isEmpty && model.messages == null
                      ? Container()
                      : ChatContainer(
                          message: model.messages[index],
                        );
                },
              ),
              TextFormField(
                controller: model.messageController,
                onChanged: (val) {
                  model.message.textMessage = val;
                  model.setState(ViewState.idle);
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: 'Write your message',
                    suffixIcon: IconButton(
                      onPressed: () {
                        model.sendNewMessage(model.message);
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        ///
                        /// Pick Image
                        ///

                        model.pickAndSendMessage();
                      },
                      icon: Icon(
                        Icons.image, // or any other icon you prefer
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                    fillColor: Colors.grey,
                    filled: true,
                    border: InputBorder.none,
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              )
            ],
          ),

          ///
          /// Bottom app bar
          ///
          // bottomNavigationBar: BottomAppBar(
          //   height: 70,
          //   shadowColor: Colors.grey,
          //   color: Colors.grey,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //     child: ,
          //   ),
          // ),
        ),
      ),
    );
  }

  // AppBar _appBar(ChatViewModel model) {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     automaticallyImplyLeading: true,
  //     elevation: 1.0,
  //     title: Text("Contact Us", style: heading16.copyWith(fontSize: 16.sp)),
  //     centerTitle: true,
  //   );
  // }
}

class ChatContainer extends StatelessWidget {
  final Message? message;
  final MDUserData? currentUser;
  final bool? isShow;

  var utils = AppUtils();

  ChatContainer({this.message, this.currentUser, this.isShow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Align(
          alignment: (message?.fromUserId == currentUser?.userId
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Column(
            crossAxisAlignment: message?.fromUserId == currentUser?.userId
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: message?.fromUserId == currentUser?.userId
                        ? BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                          )
                        : BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                          ),
                    color: message?.fromUserId == currentUser?.userId
                        ? Color(0xffF2F7FB)
                        : Colors.red,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(message?.textMessage?.toString() ?? "",
                      style: message?.fromUserId == currentUser?.userId
                          ? utils.labelStyleB(Colors.black)
                          : utils.labelStyleB(Colors.white)),
                ),
              ]),
              Text(
                "${utils.onlyTime.format(message?.sendat ?? DateTime.now())}",
                style: utils.xSmallLabelStyleB(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

appBar(context) {
  var theme = ThemeColors();
  var utils = AppUtils();
  var static = Statics();
  var generalWatch = navigatorkey.currentContext!.watch<GeneralController>();
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: AppBar(
      elevation: 1.0,
      backgroundColor: theme.midLightGreyColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: theme.whiteColor,
              size: 22.sp,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();

              utils.flipCard(context);
            },
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: theme.lightBlackColor,
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: theme.greyColor.withOpacity(.8),
                // ),
              ),
              child: Container(
                width: static.width > 500 ? 40.w : 45.w,
                height: static.width > 500 ? 40.h : 45.h,
                margin: static.width > 500
                    ? EdgeInsets.all(2.w)
                    : EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.lightGreyColor,
                ),
                child: CachedNetworkImage(
                  imageUrl: generalWatch.profilePhotoValue ?? '',
                  // progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //     utils.loadingShimmer(
                  //   width: 30.w,
                  //   height: 30.h,
                  // ),
                  // errorWidget: (context, url, error) => utils.loadingShimmer(
                  //   width: 30.w,
                  //   height: 30.h,
                  // ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
