import 'package:android_testing/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String? senderId;
  final String message;
  final Timestamp timestamp;

  static var to;

  const Messages({
    this.senderId,
    required this.message,
    required this.timestamp,
  });

  toJson() {
    return {
      "senderId": senderId,
      "message": message,
      "timestamp": Timestamp.fromDate(timestamp as DateTime),
    };
  }

  factory Messages.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    return Messages(
      senderId: data["senderId"],
      message: data["message"],
      timestamp: data["timestamp"],
    );
  }
}
