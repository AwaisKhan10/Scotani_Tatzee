import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation {
  String? conversationId;
  String? lastMessage;
  FieldValue? lastMessageAt;
  DateTime? lastMessageat;
  bool? isMessageSeen;
  int? noOfUnReadMsgs;
  bool? isGroupChat;
  List<String>? joinedUsers;
  List<String>? leftedUsers;
  String? fromUserId;
  String? toUserId;
  String? groupId;
  String? name;
  String? imageUrl;
  // AppUser? appUser;

  Conversation({
    this.conversationId,
    this.lastMessage,
    this.lastMessageAt,
    this.isMessageSeen,
    this.noOfUnReadMsgs,
    this.isGroupChat,
    this.joinedUsers,
    this.leftedUsers,
    this.toUserId,
    this.fromUserId,
    // this.appUser,
    this.groupId,
    this.imageUrl,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['conversationId'] = conversationId;
    data['lastMessage'] = lastMessage;
    data['lastMessageAt'] = lastMessageAt;
    data["isMessageSeen"] = isMessageSeen;
    data["noOfUnReadMsgs"] = noOfUnReadMsgs;
    data["fromUserId"] = fromUserId;
    data["toUserId"] = toUserId;
    data["imageUrl"] = imageUrl;
    data['name'] = name;
    data["joinedUsers"] = joinedUsers;
    data["leftedUsers"] = leftedUsers;
    data["groupId"] = groupId;
    data["isGroupChat"] = isGroupChat;
    return data;
  }

  Conversation.fromJson(json) {
    this.conversationId = json["conversationId"];
    this.lastMessageat = lastMessageAt != null
        ? DateTime.parse(json['lastMessageAt'].toDate().toString())
        : DateTime.now();
    this.imageUrl = json['imageUrl'];
    this.name = json['name'] ?? 'Group';
    this.lastMessage = json['lastMessage'] ?? "";
    this.isMessageSeen = json["isMessageSeen"] ?? false;
    this.noOfUnReadMsgs = json["noOfUnReadMsgs"] ?? 0;
    this.fromUserId = json["fromUserId"] ?? "";
    this.toUserId = json["toUserId"] ?? "";
    this.groupId = json['groupId'] ?? "";
    this.isGroupChat = json['isGroupChat'] ?? false;
    if (json["leftedUsers"] != null) {
      leftedUsers = [];
      json["leftedUsers"].forEach((id) {
        leftedUsers!.add(id);
      });
    } else {
      leftedUsers = [];
    }
    if (json["joinedUsers"] != null) {
      joinedUsers = [];
      json["joinedUsers"].forEach((id) {
        joinedUsers!.add(id);
      });
    } else {
      joinedUsers = [];
    }
  }
}
