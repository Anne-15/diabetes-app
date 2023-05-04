import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsModel {
  final String title;
  final String date;
  final String timeFrom;
  final String timeTo;
  final String notes;

  const AppointmentsModel({
    required this.title,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    required this.notes,
  });

  toJson() {
    return {
      "senderId": title,
      "receiverId": date,
      "senderName": timeFrom,
      "receiverName": timeTo,
      "senderAvatar": notes,
    };
  }

  factory AppointmentsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return AppointmentsModel(
      title: data["receiverId"],
      date: data["senderId"],
      timeFrom: data["receiverName"],
      timeTo: data["senderName"],
      notes: data["receiverAvatar"],
    );
  }
}
