import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skincanvas/Models/Conversation.dart';
import 'package:skincanvas/Models/Messages.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  /// ====================== Chat new algorithm ============================///
  ///
  ///
  /// add new message
  ///
  newMessages(
    // Conversation conversationFrom,
    Conversation conversationTo,
    Message message,
    //  String currentUserId,
    //  String toUserId
  ) async {
    try {
      // ///
      // /// Check previous conversation
      // ///
      // final snapshot = await _db
      //     .collection("Conversations")
      //     .doc("${currentUserId}")
      //     .collection("MyConversation")
      //     .doc("${toUserId}")
      //     .get();

      // if (snapshot.exists) {
      //   Conversation createdConversation =
      //       Conversation.fromJson(snapshot.data());
      //   conversationFrom.conversationId = createdConversation.conversationId;
      //   await _db
      //       .collection("Conversations")
      //       .doc("${currentUserId}")
      //       .collection("MyConversation")
      //       .doc("${toUserId}")
      //       .update({
      //     "lastMessage": conversationFrom.lastMessage,
      //   });
      // } else {
      //   ///
      //   /// my converstion list
      //   ///
      //   await _db
      //       .collection("Conversations")
      //       .doc("${currentUserId}")
      //       .collection("MyConversation")
      //       .doc("${toUserId}")
      //       .set(conversationFrom.toJson());
      // }

      // ///
      // /// Check previous conversation
      // ///
      // final snap = await _db
      //     .collection("Conversations")
      //     .doc("${toUserId}")
      //     .collection("MyConversation")
      //     .doc("${currentUserId}")
      //     .get();

      // if (snap.exists) {
      //   Conversation createdConversation = Conversation.fromJson(snap.data());
      //   conversationTo.conversationId = createdConversation.conversationId;
      //   await _db
      //       .collection("Conversations")
      //       .doc("${toUserId}")
      //       .collection("MyConversation")
      //       .doc("${currentUserId}")
      //       .update({
      //     "lastMessage": conversationTo.lastMessage,
      //   });
      // } else {
      //   ///
      //   /// to user converstion list
      //   ///
      //   await _db
      //       .collection("Conversations")
      //       .doc("${toUserId}")
      //       .collection("MyConversation")
      //       .doc("${currentUserId}")
      //       .set(conversationTo.toJson());
      // }

      ///
      /// Messages
      ///

      await _db
          .collection("messages")
          .doc("${conversationTo.conversationId}")
          .collection("realtime-messages")
          .add(message.toJson());
    } catch (e) {
      print('Exception@DatabaseServices/addNewMessage ==> $e');
    }
  }

  // getMessages()async{

  // }

  Stream<QuerySnapshot>? getRealTimeMessages(currentUserId) {
    try {
      print("inner messages");
      Stream<QuerySnapshot> messageSnapshot = _db
          .collection("messages")
          .doc(currentUserId)
          .collection("realtime-messages")
          .orderBy('sendAt', descending: true)
          .snapshots();
      return messageSnapshot;
    } catch (e) {
      print('Exception@GetUserMessagesStream=>$e');
      return null;
    }
  }

  ///
  /// Get appUser
  ///
  // Future<Admin?> getAdmin(id) async {
  //   print('@getAdmin: id: $id');
  //   try {
  //     final snapshot = await _db.collection('admin').doc(id).get();
  //     print('Admin Data: ${snapshot.data()}');
  //     return Admin.formJson(snapshot.data(), snapshot.id);
  //   } catch (e) {
  //     print('Exception @DatabaseService/getAdmin $e');
  //     return null;
  //   }
  // }

  // Stream<QuerySnapshot>? getAllConverationList(String id) {
  //   try {
  //     Stream<QuerySnapshot> conversationSnapshot = _db
  //         .collection("Conversations")
  //         .doc(id)
  //         .collection('MyConversation')
  //         .orderBy("lastMessageAt", descending: true)
  //         .snapshots();
  //     return conversationSnapshot;
  //   } catch (e) {
  //     print("Exception@database/GetAllConversationList ==> $e");
  //     return null;
  //   }
  // }

  // createGroup(Conversation conversation, Message message) async {
  //   try {
  //     await _db
  //         .collection("Conversations")
  //         .doc("${conversation.fromUserId}")
  //         .collection("MyConversation")
  //         .doc("${conversation.groupId}")
  //         .set(conversation.toJson());

  //     ///
  //     /// Messages
  //     ///

  //     await _db
  //         .collection("messages")
  //         .doc("${conversation.conversationId}")
  //         .collection("realtime-messages")
  //         .add(message.toJson());
  //     return true;
  //   } catch (e) {
  //     print('Exception@DatabaseServices/addNewMessage ==> $e');
  //     return false;
  //   }
  // }

  // updateGroup(Conversation conversation, Message message) async {
  //   // print("appuaser premiume check: ${appUser.isPremiumUser}");
  //   print('user id==> ${conversation.fromUserId}');
  //   print('group id==> ${conversation.groupId}');
  //   try {
  //     await _db
  //         .collection('Conversations')
  //         .doc(conversation.fromUserId)
  //         .collection("MyConversation")
  //         .doc("${conversation.groupId}")
  //         .update(conversation.toJson());

  //     ///
  //     /// Messages
  //     ///

  //     await _db
  //         .collection("messages")
  //         .doc("${conversation.conversationId}")
  //         .collection("realtime-messages")
  //         .add(message.toJson());
  //     return true;
  //   } catch (e, s) {
  //     debugPrint('Exception @DatabaseService/GroupUpdate ==>$e');
  //     debugPrint(s.toString());
  //     return false;
  //   }
  // }
}
