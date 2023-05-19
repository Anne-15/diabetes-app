import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsModel {
  final String? id;
  final String title;
  final String date;
  final String timeFrom;
  final String timeTo;
  final String receiverEmail;
  final String notes;

  const AppointmentsModel({
    this.id,
    required this.title,
    required this.date,
    required this.timeFrom,
    required this.timeTo,
    required this.receiverEmail,
    required this.notes,
  });

  toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "timeFrom": timeFrom,
      "timeTo": timeTo,
      "receiverEmail": receiverEmail,
      "notes": notes,
    };
  }

  factory AppointmentsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return AppointmentsModel(
      id: data["id"],
      title: data["receiverId"],
      date: data["senderId"],
      timeFrom: data["receiverName"],
      timeTo: data["senderName"],
      receiverEmail: data["receiverEmail"],
      notes: data["receiverAvatar"],
    );
  }
}
