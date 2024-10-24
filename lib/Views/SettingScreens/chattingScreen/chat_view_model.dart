// ignore_for_file: avoid_print, sdk_version_since

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Models/Conversation.dart';
import 'package:skincanvas/Models/MDUserModal.dart';
import 'package:skincanvas/Models/Messages.dart';
import 'package:skincanvas/Services/DataBaseServices.dart';
import 'package:skincanvas/main.dart';
import 'package:skincanvas/others/view_model/view_model.dart';
import 'package:skincanvas/others/view_state/view_state.dart';

import 'package:uuid/uuid.dart';
// import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class ChatViewModel extends BaseViewModel {
  var generalRead = navigatorkey.currentContext!.read<GeneralController>();
  bool isSelect = false;

  final db = DatabaseService();
  // final currentUser = Statics();
  List<Message> messages = [];

  TextEditingController messageController = TextEditingController();
  MDUserData toUser = MDUserData();
  Message message = Message();

  Conversation conversationTo = Conversation();
  Conversation conversationFrom = Conversation();
  Conversation conversation = Conversation();
  var uuid = Uuid();
  Stream<QuerySnapshot>? messageStream;

  ChatViewModel() {
    message = Message();
    toUser = MDUserData();
    getAllMessages();
    notifyListeners();
  }

  Future<void> pickAndSendMessage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Image picked successfully, send it as a message
      final imageMessage = Message(
        textMessage: '', // You can include a text description if needed
        imageUrl: pickedFile.path,
        // Add other properties like fromUserId, toUserId, etc.
      );

      sendNewMessage(imageMessage);
    }
  }

  getAllMessages() async {
    if (conversationTo.conversationId == null) {
      // If conversation ID is not available, initialize it
      conversationTo.conversationId = uuid.v4();
    }

    setState(ViewState.busy);

    messageStream = db.getRealTimeMessages(conversationTo.conversationId);
    setState(ViewState.idle);

    messageStream!.listen(
      (event) {
        messages = [];
        if (event.docs.length > 0) {
          event.docs.forEach((element) {
            messages.add(Message.fromJson(element.data(), element.id));
          });
          notifyListeners();
        } else {
          messages = [];
          notifyListeners();
        }
      },
    );

    notifyListeners();
  }

  // getAllMessages() async {
  //   // conversation.conversationId = toUser.id;
  //   print('getting all messages  ${conversationTo.conversationId}');
  //   setState(ViewState.busy);
  //   messageStream = db.getRealTimeMessages(conversationTo.conversationId);
  //   setState(ViewState.idle);
  //   messageStream!.listen(
  //     (event) {
  //       messages = [];
  //       if (event.docs.length > 0) {
  //         event.docs.forEach((element) {
  //           messages.add(Message.fromJson(element.data(), element.id));
  //           print('message ==> ${messages.first.textMessage}');
  //         });
  //         notifyListeners();
  //       } else {
  //         messages = [];
  //         notifyListeners();
  //       }
  //     },
  //   );

  //   notifyListeners();
  // }

  /// ================================================= ///
  /// =============== Normal Chat Contact Us ===================== ///
  /// ================================================= ///

  sendNewMessage(Message message) async {
    // ///
    // /// conversation From
    // ///
    // conversationFrom.conversationId = conversation.conversationId ?? uuid.v4();
    // conversation.conversationId = conversationFrom.conversationId;
    // conversationFrom.lastMessage = message.textMessage;
    // conversationFrom.lastMessageAt = FieldValue.serverTimestamp();
    // conversationFrom.fromUserId = currentUser.userID;
    // conversationFrom.toUserId = toUser.userId;

    ///
    /// Conversation To
    ///

    isSelect = false;
    notifyListeners();

    conversationTo.conversationId =
        conversationFrom.conversationId ?? "${UuidV4()}";
    print(
        "   conversationTo.conversationId ==?   ${conversationTo.conversationId}");
    // conversationTo.lastMessage = message.textMessage;
    conversationTo.lastMessageAt = FieldValue.serverTimestamp();
    conversationTo.fromUserId = toUser.userId;
    conversationTo.toUserId = generalRead.userIDValue;

    print('message==> ${message.textMessage}');
    print('Sending new message: ${message.toJson()}');
    if (message.textMessage != null || message.imageUrl != null) {
      ///
      /// messages
      ///
      message.fromUserId = generalRead.userIDValue;

      print("fromUserId ==>> ${message.fromUserId}");
      message.toUserId = toUser.userId;
      print("toUserId ==>> ${message.toUserId}");
      message.sendAt = FieldValue.serverTimestamp();
      message.type = 'text';
      messages.add(message);
      notifyListeners();

      db.newMessages(
        // conversationFrom,
        conversationTo,
        message,
        // currentUser.appUser.id!,
        //  toUser.id!
      );
      if (messages.isEmpty) {
        getAllMessages();
      }

      notifyListeners();

      messageController.clear();
      message = Message();
      notifyListeners();
    } else {
      print("message is null");
    }
  }
}
