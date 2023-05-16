import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesModel {
  final String? id;
  final String title;
  final String date;
  final String body;

  const ArticlesModel({
    this.id,
    required this.title,
    required this.date,
    required this.body,
  });

  toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "body": body,
    };
  }

  factory ArticlesModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot
  ) {
    final data = snapshot.data()!;
    return ArticlesModel(
      id: snapshot.id,
      title: data["title"],
      date: data["date"],
      body: data["body"],
    );
  }
}
