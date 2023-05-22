import 'package:cloud_firestore/cloud_firestore.dart';

class MyDoctorsModel {
  final String fullname;
  final String hospital;
  final String department;

  const MyDoctorsModel({
    required this.fullname,
    required this.hospital,
    required this.department,
  });

  toJson() {
    return {
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
      fullname: data["FullName"],
      hospital: data["hospital"],
      department: data["Department"],
    );
  }
}
