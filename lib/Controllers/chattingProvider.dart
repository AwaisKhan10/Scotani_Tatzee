// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:place_picker/uuid.dart';
// import 'package:provider/provider.dart';
// import 'package:skincanvas/AppConstant/Static.dart';
// import 'package:skincanvas/Controllers/GeneralProvider.dart';
// import 'package:skincanvas/Models/Conversation.dart';
// import 'package:skincanvas/Models/MDUserModal.dart';
// import 'package:skincanvas/Models/Messages.dart';
// import 'package:skincanvas/Services/DataBaseServices.dart';
// import 'package:skincanvas/main.dart';
// import 'package:uuid/v4.dart';

// class ChattingController with ChangeNotifier {
//   var generalWatch = Provider.of<GeneralController>(
//       navigatorkey.currentContext!,
//       listen: false);
//   bool isSelect = false;

//   // final db = DataBaseService();
//   Statics? currentUser;
//   List<Message> messages = [];

//   TextEditingController messageController = TextEditingController();
//   MDUserData toUser = MDUserData();
//   Message message = Message();

//   Conversation conversationTo = Conversation();
//   Conversation conversationFrom = Conversation();
//   Conversation conversation = Conversation();
//   var uuid = Uuid();
//   Stream<QuerySnapshot>? messageStream;

//   // PickedFile? imageFile =
//   // (ImagePicker().pickImage(source: ImageSource.gallery)) as PickedFile?;

//   // ContactUsViewModel() {
//   //   message = Message();
//   //   toUser = MDUserData();
//   //   getAllMessages();
//   // }

//   getAllMessages() async {
//     if (conversationTo.conversationId == null) {
//       // If conversation ID is not available, initialize it
//       conversationTo.conversationId = uuid.generateV4();
//     }

//     messageStream = db.getRealTimeMessages(conversationTo.conversationId);

//     messageStream!.listen(
//       (event) {
//         messages = [];
//         if (event.docs.length > 0) {
//           event.docs.forEach((element) {
//             messages.add(Message.fromJson(element.data(), element.id));
//           });
//           notifyListeners();
//         } else {
//           messages = [];
//           notifyListeners();
//         }
//       },
//     );

//     // notifyListeners();
//   }

//   // getAllMessages() async {
//   //   // conversation.conversationId = toUser.id;
//   //   print('getting all messages  ${conversationTo.conversationId}');
//   //   setState(ViewState.busy);
//   //   messageStream = db.getRealTimeMessages(conversationTo.conversationId);
//   //   setState(ViewState.idle);
//   //   messageStream!.listen(
//   //     (event) {
//   //       messages = [];
//   //       if (event.docs.length > 0) {
//   //         event.docs.forEach((element) {
//   //           messages.add(Message.fromJson(element.data(), element.id));
//   //           print('message ==> ${messages.first.textMessage}');
//   //         });
//   //         notifyListeners();
//   //       } else {
//   //         messages = [];
//   //         notifyListeners();
//   //       }
//   //     },
//   //   );

//   //   notifyListeners();
//   // }

//   /// ================================================= ///
//   /// =============== Normal Chat Contact Us ===================== ///
//   /// ================================================= ///

//   sendNewMessage() async {
//     // ///
//     // /// conversation From
//     // ///
//     // conversationFrom.conversationId = conversation.conversationId ?? uuid.v4();
//     // conversation.conversationId = conversationFrom.conversationId;
//     // conversationFrom.lastMessage = message.textMessage;
//     // conversationFrom.lastMessageAt = FieldValue.serverTimestamp();
//     // conversationFrom.fromUserId = currentUser.appUser.id;
//     // conversationFrom.toUserId = toUser.id;

//     ///
//     /// Conversation To
//     ///

//     isSelect = false;
//     notifyListeners();

//     conversationTo.conversationId =
//         conversationFrom.conversationId ?? "${UuidV4()}";
//     print(
//         "   conversationTo.conversationId ==?   ${conversationTo.conversationId}");
//     // conversationTo.lastMessage = message.textMessage;
//     conversationTo.lastMessageAt = FieldValue.serverTimestamp();
//     conversationTo.fromUserId = toUser.userId;
//     conversationTo.toUserId = currentUser!.userID;

//     print('message : ${message.textMessage}');
//     if (message.textMessage != null) {
//       ///
//       /// messages
//       ///
//       message.fromUserId = currentUser!.userID;

//       print("fromUserId ==>> ${message.fromUserId}");
//       message.toUserId = toUser.userId;
//       print("toUserId ==>> ${message.toUserId}");
//       message.sendAt = FieldValue.serverTimestamp();
//       message.type = 'text';
//       messages.add(message);
//       notifyListeners();

//       db.newMessages(
//         // conversationFrom,
//         conversationTo,
//         message,
//         // currentUser.appUser.id!,
//         //  toUser.id!
//       );
//       if (messages.isEmpty) {
//         getAllMessages();
//       }

//       notifyListeners();

//       messageController.clear();
//       message = Message();
//       notifyListeners();
//     } else {
//       print("message is null");
//     }
//   }
// }
