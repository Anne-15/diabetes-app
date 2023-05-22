import 'package:cloud_firestore/cloud_firestore.dart';

class MyDoctorsModel {
  final String? id;
  final String fullname;
  final String hospital;
  final String department;

  const MyDoctorsModel(
      {this.id,
      required this.fullname,
      required this.hospital,
      required this.department,
      });

  toJson() {
    return {
      "id": id,
      "FullName": fullname,
      "Hospital": hospital,
      "Department": department,
    };
  }

  factory MyDoctorsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return MyDoctorsModel(
      id: snapshot.id,
      fullname: data["FullName"],
      hospital: data["hospital"],
      department: data["Department"],
    );
  }
}
