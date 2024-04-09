import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? messageId;
  String? fromUserId;
  String? toUserId;
  String? textMessage;
  String? imageUrl; // Added field for image URL
  FieldValue? sendAt;
  DateTime? sendat;
  String? type;
  bool? isSendNotification;

  Message({
    this.fromUserId,
    this.messageId,
    this.sendAt,
    this.textMessage,
    this.toUserId,
    this.type,
    this.isSendNotification,
    this.imageUrl, // Initialize the image URL
  });

  Message.fromJson(json, id) {
    this.messageId = id;
    this.fromUserId = json["fromUserId"];
    this.toUserId = json["toUserId"];
    this.textMessage = json["textMessage"] ?? "";
    this.imageUrl = json["imageUrl"] ?? ""; // Parse the image URL
    this.sendat = sendAt != null
        ? DateTime.parse(json["sendAt"].toDate().toString())
        : DateTime.now();
    this.type = json["type"];
  }

  toJson() {
    return {
      "fromUserId": this.fromUserId,
      "toUserId": this.toUserId,
      "textMessage": this.textMessage,
      "imageUrl": this.imageUrl, // Include the image URL in the JSON
      "sendAt": this.sendAt,
      "type": this.type,
      "isSendNotification": this.isSendNotification,
    };
  }
}
