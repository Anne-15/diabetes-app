import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String senderId;
  final String receiverId;
  final String senderName;
  final String receiverName;
  final String senderAvatar;
  final String receiverAvatar;
  final String message;
  final Timestamp time;
  final int? messageNum;

  const Messages({
    required this.receiverId,
    required this.senderId,
    required this.receiverName,
    required this.senderName,
    required this.receiverAvatar,
    required this.senderAvatar,
    required this.message,
    required this.time,
    required this.messageNum,
  });

  toJson() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "senderName": senderName,
      "receiverName": receiverName,
      "senderAvatar": senderAvatar,
      "receiverAvatar": receiverAvatar,
      "message": message,
      "messageNum": messageNum
    };
  }

  factory Messages.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return Messages(
        receiverId: data["receiverId"],
        senderId: data["senderId"],
        receiverName: data["receiverName"],
        senderName: data["senderName"],
        receiverAvatar: data["receiverAvatar"],
        senderAvatar: data["senderAvatar"],
        message: data["message"],
        time: data["time"],
        messageNum: data["messageNum"]);
  }
}
